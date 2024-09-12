package cc.coopersoft.keycloak.phone.providers.sender;

import cc.coopersoft.common.ActionsEnums;
import cc.coopersoft.common.BusGeneralEnums;
import cc.coopersoft.keycloak.phone.providers.exception.MessageSendException;
import cc.coopersoft.keycloak.phone.providers.sender.bus.kafkaManger;
import cc.coopersoft.keycloak.phone.providers.spi.FullSmsSenderAbstractService;
import okhttp3.*;
import org.jboss.logging.Logger;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Random;

public class DummySmsSenderService extends FullSmsSenderAbstractService {

    private static final Logger logger = Logger.getLogger(DummySmsSenderService.class);

    public DummySmsSenderService(String realmDisplay) {
        super(realmDisplay);
    }

    private String Determine_Notification_Type(String Username) {
        Pattern Email_Regex = Pattern.compile("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-.]{2,}$");
        Pattern Mobile_Regex = Pattern.compile("^[\\+][1-9]{1}[0-9]{1,14}$");
        Matcher Email_Regex_Matcher = Email_Regex.matcher(Username);
        Matcher Mobile_Regex_Matcher = Mobile_Regex.matcher(Username);
        if (Email_Regex_Matcher.matches()) {
            return "EMAIL";
        } else if (Mobile_Regex_Matcher.matches()) {
            return "MOBILE";
        }
        return "ERROR";
    }


    @Override
    public void sendMessage(String phoneNumber, String message, ActionsEnums action) throws MessageSendException {

        // here you call the method for sending messages
        logger.info(String.format("To=>!!: %s >>> %s", phoneNumber, message));

        String method = "";
        String template_ID = "";

        if (Determine_Notification_Type(phoneNumber) == "EMAIL") {
            method = "EMAIL";
            template_ID = "EMAIL_OTP_VERIFICATION";
        } else if (Determine_Notification_Type(phoneNumber) == "MOBILE") {
            method = "SMS";
            template_ID = "SMS_REGISTRATION_SUCCESSFUL";
        }
        String language = "en_US";

        //callApi(message,phoneNumber);
        String event = "{" +
                "\"actionList\": \"" + ActionsEnums.SENDTEMPLATENOTIFICATIONSLISTOFACTIONS.label + "\"," +
                "\"actionType\": \"" + ActionsEnums.REGULAR.label + "\"," +
                "\"data\": {" +
                "\"language\": \"" + language + "\"," +
                "\"method\": \"" + method + "\"," +
                "\"recipients\": [{" +
                "\"name\": \"User\"," +
                "\"otp\": \"" + message + "\"," +
                "\"username\": \"" + phoneNumber + "\"" +
                "}]," +
                "\"templateId\": \"" + template_ID + "\"" +
                "}," +
                "\"groupId\": \"" + BusGeneralEnums.KEYCLOAK.label + "\"," +
                "\"index\": -1" +
                "}";

        kafkaManger.produceMessage(BusGeneralEnums.TOPIC.label, BusGeneralEnums.TOPIC.label, event);
    }

    @Override
    public void sendMessage(String phoneNumber, String message, String language, ActionsEnums action) throws MessageSendException {

        // here you call the method for sending messages
        logger.info(String.format("To=>!!: %s >>> %s", phoneNumber, message));
        logger.info(String.format("action=>!!%s", action.label));
        if (language == null){
            language = "en_US";
        }
        logger.info("Language 1: " + language);

        String Language = "en-US";
        logger.info("Language 2: " + Language);

        if (language.equals("ar")) {
            logger.info("Language 3: " + Language);

            Language = "ar-SA";
        }
        logger.info("Language 4: " + Language);

        String method = "";
        String template_ID = "";

        if (Determine_Notification_Type(phoneNumber) == "EMAIL" && action.label == "SEND_TEMPLATE_NOTIFICATIONS") {
            method = "EMAIL";
            template_ID = "EMAIL_OTP_VERIFICATION";
        } else if (Determine_Notification_Type(phoneNumber) == "MOBILE" && action.label == "SEND_TEMPLATE_NOTIFICATIONS") {
            method = "SMS";
            template_ID = "SMS_REGISTRATION_SUCCESSFUL";
        } else {
            method = "";
            template_ID = "";
        }

        //callApi(message,phoneNumber);
        String event = "{" +
                "\"actionList\": \"" + ActionsEnums.SENDTEMPLATENOTIFICATIONSLISTOFACTIONS.label + "\"," +
                "\"actionType\": \"" + ActionsEnums.REGULAR.label + "\"," +
                "\"data\": {" +
                "\"language\": \"" + Language + "\"," +
                "\"method\": \"" + method + "\"," +
                "\"recipients\": [{" +
                "\"name\": \"User\"," +
                "\"otp\": \"" + message + "\"," +
                "\"username\": \"" + phoneNumber + "\"" +
                "}]," +
                "\"templateId\": \"" + template_ID + "\"" +
                "}," +
                "\"groupId\": \"" + BusGeneralEnums.KEYCLOAK.label + "\"," +
                "\"index\": -1" +
                "}";

        kafkaManger.produceMessage(BusGeneralEnums.TOPIC.label, BusGeneralEnums.TOPIC.label, event);
    }


    @Override
    public void close() {
    }

    public static String callApi(String message, String mail) {
        // Create an instance of HttpClient
        OkHttpClient client = new OkHttpClient().newBuilder()
                .build();

        MediaType mediaType = MediaType.parse("application/json");
        String jsonBody = "{\n" +
                "    \"username\": \"" + mail + "\",\n" +
                "    \"template\": \"SMTP_TMPL_KEYCLOAK_OTP\",\n" +
                "    \"otp\": \"" + message + "\"\n" +
                "}";

        RequestBody body = RequestBody.create(mediaType, jsonBody);

        Request request = new Request.Builder()
                .url("http://notification:8003/notification/sendNotification")
                .method("POST", body)
                .addHeader("Content-Type", "application/json")
                .build();

        try {
            Response response = client.newCall(request).execute();
            return String.valueOf(response);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void sendAction(String id, ActionsEnums action) throws MessageSendException {
        String phoneNumber = "";
        String emailAddress = "";
        boolean isEmail = Determine_Notification_Type(id).equals("EMAIL");
        if (isEmail) {
            emailAddress = "\"" + id + "\"";
        } else {
            phoneNumber = "\"" + id + "\"";
        }
        String event = "{" +
                "\"actionList\": \"" + ActionsEnums.CREATECONTACTLISTOFACTIONS.label + "\"," +
                "\"actionType\": \"" + ActionsEnums.REGULAR.label + "\"," +
                "\"data\": {" +
                "\"loyalty_identifier\": \"" + new Random().ints(11, 0, 10).collect(StringBuilder::new, StringBuilder::append, StringBuilder::append).toString() + "\"," +
                "\"type\": \"PERSON\"," +
                "\"person_name\": {" +
                "\"first_name\": \"Name\"," +
                "\"last_name\": \"Surname\"" +
                "}," +
                (isEmail ? "" : "\"phone\": {\"type\": \"MOBILE\", \"country_code\": \"SAU\", \"number\": \"" + phoneNumber + "\"},") +
                (isEmail ? "\"email_address\": " + emailAddress + "," : "") +
                //create_wallet: false,
                //            create_default_account: false,
                "\"create_wallet\": false," +
                "\"create_default_account\": true," +
                "\"address\": {" +
                "\"type\": \"HOME\"," +
                "\"name\": \"N/A\"," +
                "\"is_primary\": true," +
                "\"address_line_1\": \"Kingdom of Saudi Arabia\"," +
                "\"address_line_2\": \"Kingdom of Saudi Arabia\"," +
                "\"state_province_county\": \"N/A\"," +
                "\"town_city\": \"N/A\"," +
                "\"postal_code\": \"00000\"," +
                "\"country_code\": \"SAU\"" +
                "}," +
                "\"notes\": \"N/A\"" +
                "}," +
                "\"groupId\": \"" + BusGeneralEnums.KEYCLOAK.label + "\"," +
                "\"index\": -1" +
                "}";
        kafkaManger.produceMessage(BusGeneralEnums.TOPIC.label, BusGeneralEnums.TOPIC.label, event);

    }
}
