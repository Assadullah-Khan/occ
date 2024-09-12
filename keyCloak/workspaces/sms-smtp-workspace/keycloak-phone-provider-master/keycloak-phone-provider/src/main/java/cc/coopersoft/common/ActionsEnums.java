package cc.coopersoft.common;

public enum ActionsEnums {
    CREATECONTACTLISTOFACTIONS("CREATE_CONTACT_LIST_OF_ACTIONS"),
    SENDTEMPLATENOTIFICATIONSLISTOFACTIONS("SEND_TEMPLATE_NOTIFICATIONS_LIST_OF_ACTIONS"),
    REGULAR("REGULAR"),
    SENDTEMPLATENOTIFICATIONS("SEND_TEMPLATE_NOTIFICATIONS");



    public final String label;

    ActionsEnums(String label) {
        this.label  = label;
    }
}
