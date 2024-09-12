package cc.coopersoft.common;

public enum BusGeneralEnums {
    TOPIC("SAGA_ORCHESTRATOR"),
    KEYCLOAK("KEYCLOAK");

    public final String label;

    BusGeneralEnums(String label) {
        this.label  = label;
    }


}
