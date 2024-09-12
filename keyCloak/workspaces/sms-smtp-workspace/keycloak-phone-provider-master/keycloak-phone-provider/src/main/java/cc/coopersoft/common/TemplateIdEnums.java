package cc.coopersoft.common;

public enum TemplateIdEnums {
    SMSREGISTRATIONSUCCESSFUL("SMS_REGISTRATION_SUCCESSFUL"),

    EMAILOTPVERIFICATION("EMAIL_OTP_VERIFICATION");




    public final String label;

    TemplateIdEnums(String label) {
        this.label  = label;
    }
}
