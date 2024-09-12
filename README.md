Deployment instructions
===================================================

1. Execute the below command to run docker environment
    > npm run local 

2. If you require to run the demo resource-server run the below command
    > cd resource-server
    > npm run start

3. If you require to hit the http://localhost/secured API ensure to have the user is a member of the occ_user role in keycloak.

4. If you require to hit the http://localhost/admin API ensure to have the client service account is a member of the occ_client role in keycloak.


Notes
-------

1. For booting up Keycloak for the first time,you will need to follow the instructions under the pdf file DA-Keycloak SPI-Documentation.pdf to configure the custom Keycloak SPI

2. The custom SPI is based on the following repo https://github.com/cooperlyt/keycloak-phone-provider