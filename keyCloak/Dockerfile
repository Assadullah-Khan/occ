FROM quay.io/keycloak/keycloak:23.0 as builder

# Configure a database vendor
ENV KC_DB=postgres

WORKDIR /opt/keycloak

# for demonstration purposes only, please make sure to use proper certificates in production instead
RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore

FROM quay.io/keycloak/keycloak:23.0
COPY --from=builder /opt/keycloak/ /opt/keycloak/

COPY ./workspaces/sms-smtp-workspace/keycloak-phone-provider-master/target/providers/. /opt/keycloak/providers/
COPY ./realms/. /opt/keycloak/data/import/

RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

#RUN chown -R 1000 /opt/keycloak/themes/
#RUN chown -R 1000 /opt/keycloak/providers/
#RUN chown -R 1000 /opt/keycloak/data/import/