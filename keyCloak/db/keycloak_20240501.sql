PGDMP                      |            keycloak    12.17    16.1 �   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16384    keycloak    DATABASE     s   CREATE DATABASE keycloak WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE keycloak;
                keycloak    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                keycloak    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   keycloak    false    6            �            1259    17044    admin_event_entity    TABLE     �  CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);
 &   DROP TABLE public.admin_event_entity;
       public         heap    keycloak    false    6                       1259    17505    associated_policy    TABLE     �   CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);
 %   DROP TABLE public.associated_policy;
       public         heap    keycloak    false    6            �            1259    17062    authentication_execution    TABLE     �  CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);
 ,   DROP TABLE public.authentication_execution;
       public         heap    keycloak    false    6            �            1259    17056    authentication_flow    TABLE     t  CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);
 '   DROP TABLE public.authentication_flow;
       public         heap    keycloak    false    6            �            1259    17050    authenticator_config    TABLE     �   CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);
 (   DROP TABLE public.authenticator_config;
       public         heap    keycloak    false    6            �            1259    17067    authenticator_config_entry    TABLE     �   CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 .   DROP TABLE public.authenticator_config_entry;
       public         heap    keycloak    false    6                       1259    17520    broker_link    TABLE     L  CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);
    DROP TABLE public.broker_link;
       public         heap    keycloak    false    6            �            1259    16399    client    TABLE     �  CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);
    DROP TABLE public.client;
       public         heap    keycloak    false    6            �            1259    16773    client_attributes    TABLE     �   CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);
 %   DROP TABLE public.client_attributes;
       public         heap    keycloak    false    6                       1259    17779    client_auth_flow_bindings    TABLE     �   CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);
 -   DROP TABLE public.client_auth_flow_bindings;
       public         heap    keycloak    false    6                       1259    17654    client_initial_access    TABLE     �   CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);
 )   DROP TABLE public.client_initial_access;
       public         heap    keycloak    false    6            �            1259    16785    client_node_registrations    TABLE     �   CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);
 -   DROP TABLE public.client_node_registrations;
       public         heap    keycloak    false    6                       1259    17304    client_scope    TABLE     �   CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);
     DROP TABLE public.client_scope;
       public         heap    keycloak    false    6                       1259    17319    client_scope_attributes    TABLE     �   CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);
 +   DROP TABLE public.client_scope_attributes;
       public         heap    keycloak    false    6                       1259    17821    client_scope_client    TABLE     �   CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);
 '   DROP TABLE public.client_scope_client;
       public         heap    keycloak    false    6                       1259    17325    client_scope_role_mapping    TABLE     �   CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);
 -   DROP TABLE public.client_scope_role_mapping;
       public         heap    keycloak    false    6            �            1259    16411    client_session    TABLE     �  CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);
 "   DROP TABLE public.client_session;
       public         heap    keycloak    false    6            �            1259    17088    client_session_auth_status    TABLE     �   CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);
 .   DROP TABLE public.client_session_auth_status;
       public         heap    keycloak    false    6            �            1259    16779    client_session_note    TABLE     �   CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);
 '   DROP TABLE public.client_session_note;
       public         heap    keycloak    false    6            �            1259    16966    client_session_prot_mapper    TABLE     �   CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);
 .   DROP TABLE public.client_session_prot_mapper;
       public         heap    keycloak    false    6            �            1259    16417    client_session_role    TABLE     �   CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);
 '   DROP TABLE public.client_session_role;
       public         heap    keycloak    false    6            �            1259    17169    client_user_session_note    TABLE     �   CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);
 ,   DROP TABLE public.client_user_session_note;
       public         heap    keycloak    false    6                       1259    17570 	   component    TABLE     )  CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);
    DROP TABLE public.component;
       public         heap    keycloak    false    6                       1259    17564    component_config    TABLE     �   CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);
 $   DROP TABLE public.component_config;
       public         heap    keycloak    false    6            �            1259    16420    composite_role    TABLE     �   CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);
 "   DROP TABLE public.composite_role;
       public         heap    keycloak    false    6            �            1259    16423 
   credential    TABLE     $  CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);
    DROP TABLE public.credential;
       public         heap    keycloak    false    6            �            1259    16390    databasechangelog    TABLE     Y  CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);
 %   DROP TABLE public.databasechangelog;
       public         heap    keycloak    false    6            &           1259    18023    databasechangelog_tokencodee    TABLE     d  CREATE TABLE public.databasechangelog_tokencodee (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);
 0   DROP TABLE public.databasechangelog_tokencodee;
       public         heap    keycloak    false    6            �            1259    16385    databasechangeloglock    TABLE     �   CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);
 )   DROP TABLE public.databasechangeloglock;
       public         heap    keycloak    false    6                       1259    17837    default_client_scope    TABLE     �   CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);
 (   DROP TABLE public.default_client_scope;
       public         heap    keycloak    false    6            �            1259    16429    event_entity    TABLE     �  CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);
     DROP TABLE public.event_entity;
       public         heap    keycloak    false    6                       1259    17526    fed_user_attribute    TABLE     (  CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);
 &   DROP TABLE public.fed_user_attribute;
       public         heap    keycloak    false    6                       1259    17532    fed_user_consent    TABLE     �  CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);
 $   DROP TABLE public.fed_user_consent;
       public         heap    keycloak    false    6                        1259    17863    fed_user_consent_cl_scope    TABLE     �   CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);
 -   DROP TABLE public.fed_user_consent_cl_scope;
       public         heap    keycloak    false    6                       1259    17541    fed_user_credential    TABLE     �  CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);
 '   DROP TABLE public.fed_user_credential;
       public         heap    keycloak    false    6                       1259    17551    fed_user_group_membership    TABLE     �   CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);
 -   DROP TABLE public.fed_user_group_membership;
       public         heap    keycloak    false    6                       1259    17554    fed_user_required_action    TABLE       CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);
 ,   DROP TABLE public.fed_user_required_action;
       public         heap    keycloak    false    6                       1259    17561    fed_user_role_mapping    TABLE     �   CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);
 )   DROP TABLE public.fed_user_role_mapping;
       public         heap    keycloak    false    6            �            1259    16823    federated_identity    TABLE       CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);
 &   DROP TABLE public.federated_identity;
       public         heap    keycloak    false    6                       1259    17630    federated_user    TABLE     �   CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);
 "   DROP TABLE public.federated_user;
       public         heap    keycloak    false    6                       1259    17242    group_attribute    TABLE       CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);
 #   DROP TABLE public.group_attribute;
       public         heap    keycloak    false    6                       1259    17239    group_role_mapping    TABLE     �   CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);
 &   DROP TABLE public.group_role_mapping;
       public         heap    keycloak    false    6            �            1259    16829    identity_provider    TABLE     �  CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);
 %   DROP TABLE public.identity_provider;
       public         heap    keycloak    false    6            �            1259    16839    identity_provider_config    TABLE     �   CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 ,   DROP TABLE public.identity_provider_config;
       public         heap    keycloak    false    6            �            1259    16945    identity_provider_mapper    TABLE       CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);
 ,   DROP TABLE public.identity_provider_mapper;
       public         heap    keycloak    false    6            �            1259    16951    idp_mapper_config    TABLE     �   CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 %   DROP TABLE public.idp_mapper_config;
       public         heap    keycloak    false    6                        1259    17236    keycloak_group    TABLE     �   CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);
 "   DROP TABLE public.keycloak_group;
       public         heap    keycloak    false    6            �            1259    16438    keycloak_role    TABLE     b  CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);
 !   DROP TABLE public.keycloak_role;
       public         heap    keycloak    false    6            �            1259    16942    migration_model    TABLE     �   CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);
 #   DROP TABLE public.migration_model;
       public         heap    keycloak    false    6            �            1259    17226    offline_client_session    TABLE     �  CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);
 *   DROP TABLE public.offline_client_session;
       public         heap    keycloak    false    6            �            1259    17220    offline_user_session    TABLE     P  CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);
 (   DROP TABLE public.offline_user_session;
       public         heap    keycloak    false    6            '           1259    18029    phone_message_token_code    TABLE     
  CREATE TABLE public.phone_message_token_code (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    phone_number character varying(100) NOT NULL,
    code character varying(6) NOT NULL,
    type character varying(20) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    confirmed boolean DEFAULT false,
    by_whom character varying(80),
    ip character varying(21),
    port integer,
    host character varying(21)
);
 ,   DROP TABLE public.phone_message_token_code;
       public         heap    keycloak    false    6                       1259    17447    policy_config    TABLE     �   CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);
 !   DROP TABLE public.policy_config;
       public         heap    keycloak    false    6            �            1259    16810    protocol_mapper    TABLE     1  CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);
 #   DROP TABLE public.protocol_mapper;
       public         heap    keycloak    false    6            �            1259    16817    protocol_mapper_config    TABLE     �   CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 *   DROP TABLE public.protocol_mapper_config;
       public         heap    keycloak    false    6            �            1259    16445    realm    TABLE     �	  CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);
    DROP TABLE public.realm;
       public         heap    keycloak    false    6            �            1259    16463    realm_attribute    TABLE     �   CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);
 #   DROP TABLE public.realm_attribute;
       public         heap    keycloak    false    6                       1259    17252    realm_default_groups    TABLE     �   CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);
 (   DROP TABLE public.realm_default_groups;
       public         heap    keycloak    false    6            �            1259    16934    realm_enabled_event_types    TABLE     �   CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 -   DROP TABLE public.realm_enabled_event_types;
       public         heap    keycloak    false    6            �            1259    16472    realm_events_listeners    TABLE     �   CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 *   DROP TABLE public.realm_events_listeners;
       public         heap    keycloak    false    6            %           1259    17975    realm_localizations    TABLE     �   CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);
 '   DROP TABLE public.realm_localizations;
       public         heap    keycloak    false    6            �            1259    16475    realm_required_credential    TABLE       CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);
 -   DROP TABLE public.realm_required_credential;
       public         heap    keycloak    false    6            �            1259    16483    realm_smtp_config    TABLE     �   CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);
 %   DROP TABLE public.realm_smtp_config;
       public         heap    keycloak    false    6            �            1259    16849    realm_supported_locales    TABLE     �   CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 +   DROP TABLE public.realm_supported_locales;
       public         heap    keycloak    false    6            �            1259    16495    redirect_uris    TABLE        CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 !   DROP TABLE public.redirect_uris;
       public         heap    keycloak    false    6            �            1259    17183    required_action_config    TABLE     �   CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 *   DROP TABLE public.required_action_config;
       public         heap    keycloak    false    6            �            1259    17175    required_action_provider    TABLE     \  CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);
 ,   DROP TABLE public.required_action_provider;
       public         heap    keycloak    false    6            "           1259    17902    resource_attribute    TABLE       CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);
 &   DROP TABLE public.resource_attribute;
       public         heap    keycloak    false    6                       1259    17475    resource_policy    TABLE     �   CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);
 #   DROP TABLE public.resource_policy;
       public         heap    keycloak    false    6                       1259    17460    resource_scope    TABLE     �   CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);
 "   DROP TABLE public.resource_scope;
       public         heap    keycloak    false    6                       1259    17394    resource_server    TABLE     �   CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);
 #   DROP TABLE public.resource_server;
       public         heap    keycloak    false    6            !           1259    17878    resource_server_perm_ticket    TABLE     �  CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);
 /   DROP TABLE public.resource_server_perm_ticket;
       public         heap    keycloak    false    6                       1259    17432    resource_server_policy    TABLE     _  CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);
 *   DROP TABLE public.resource_server_policy;
       public         heap    keycloak    false    6            	           1259    17402    resource_server_resource    TABLE     �  CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);
 ,   DROP TABLE public.resource_server_resource;
       public         heap    keycloak    false    6            
           1259    17417    resource_server_scope    TABLE       CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);
 )   DROP TABLE public.resource_server_scope;
       public         heap    keycloak    false    6            #           1259    17921    resource_uris    TABLE     �   CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 !   DROP TABLE public.resource_uris;
       public         heap    keycloak    false    6            $           1259    17931    role_attribute    TABLE     �   CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);
 "   DROP TABLE public.role_attribute;
       public         heap    keycloak    false    6            �            1259    16498    scope_mapping    TABLE     �   CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);
 !   DROP TABLE public.scope_mapping;
       public         heap    keycloak    false    6                       1259    17490    scope_policy    TABLE     �   CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);
     DROP TABLE public.scope_policy;
       public         heap    keycloak    false    6            �            1259    16504    user_attribute    TABLE     �   CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);
 "   DROP TABLE public.user_attribute;
       public         heap    keycloak    false    6            �            1259    16957    user_consent    TABLE     7  CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);
     DROP TABLE public.user_consent;
       public         heap    keycloak    false    6                       1259    17853    user_consent_client_scope    TABLE     �   CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);
 -   DROP TABLE public.user_consent_client_scope;
       public         heap    keycloak    false    6            �            1259    16510    user_entity    TABLE     =  CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.user_entity;
       public         heap    keycloak    false    6            �            1259    16519    user_federation_config    TABLE     �   CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);
 *   DROP TABLE public.user_federation_config;
       public         heap    keycloak    false    6            �            1259    17073    user_federation_mapper    TABLE     $  CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);
 *   DROP TABLE public.user_federation_mapper;
       public         heap    keycloak    false    6            �            1259    17079    user_federation_mapper_config    TABLE     �   CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);
 1   DROP TABLE public.user_federation_mapper_config;
       public         heap    keycloak    false    6            �            1259    16525    user_federation_provider    TABLE     ;  CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);
 ,   DROP TABLE public.user_federation_provider;
       public         heap    keycloak    false    6                       1259    17249    user_group_membership    TABLE     �   CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);
 )   DROP TABLE public.user_group_membership;
       public         heap    keycloak    false    6            �            1259    16531    user_required_action    TABLE     �   CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);
 (   DROP TABLE public.user_required_action;
       public         heap    keycloak    false    6            �            1259    16534    user_role_mapping    TABLE     �   CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);
 %   DROP TABLE public.user_role_mapping;
       public         heap    keycloak    false    6            �            1259    16537    user_session    TABLE     �  CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);
     DROP TABLE public.user_session;
       public         heap    keycloak    false    6            �            1259    16852    user_session_note    TABLE     �   CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);
 %   DROP TABLE public.user_session_note;
       public         heap    keycloak    false    6            �            1259    16501    username_login_failure    TABLE       CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);
 *   DROP TABLE public.username_login_failure;
       public         heap    keycloak    false    6            �            1259    16550    web_origins    TABLE     }   CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
    DROP TABLE public.web_origins;
       public         heap    keycloak    false    6            ^          0    17044    admin_event_entity 
   TABLE DATA           �   COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
    public          keycloak    false    243   ��      {          0    17505    associated_policy 
   TABLE DATA           L   COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
    public          keycloak    false    272   ��      a          0    17062    authentication_execution 
   TABLE DATA           �   COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
    public          keycloak    false    246   ܊      `          0    17056    authentication_flow 
   TABLE DATA           q   COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
    public          keycloak    false    245   ��      _          0    17050    authenticator_config 
   TABLE DATA           C   COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
    public          keycloak    false    244   3�      b          0    17067    authenticator_config_entry 
   TABLE DATA           S   COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
    public          keycloak    false    247   �      |          0    17520    broker_link 
   TABLE DATA           �   COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
    public          keycloak    false    273   �      7          0    16399    client 
   TABLE DATA           �  COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
    public          keycloak    false    204    �      N          0    16773    client_attributes 
   TABLE DATA           C   COPY public.client_attributes (client_id, name, value) FROM stdin;
    public          keycloak    false    227   �      �          0    17779    client_auth_flow_bindings 
   TABLE DATA           U   COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
    public          keycloak    false    284   ��      �          0    17654    client_initial_access 
   TABLE DATA           n   COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
    public          keycloak    false    283   §      P          0    16785    client_node_registrations 
   TABLE DATA           K   COPY public.client_node_registrations (client_id, value, name) FROM stdin;
    public          keycloak    false    229   ߧ      p          0    17304    client_scope 
   TABLE DATA           Q   COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
    public          keycloak    false    261   ��      q          0    17319    client_scope_attributes 
   TABLE DATA           H   COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
    public          keycloak    false    262   g�      �          0    17821    client_scope_client 
   TABLE DATA           Q   COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
    public          keycloak    false    285   ��      r          0    17325    client_scope_role_mapping 
   TABLE DATA           F   COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
    public          keycloak    false    263   ��      8          0    16411    client_session 
   TABLE DATA           �   COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
    public          keycloak    false    205   }�      e          0    17088    client_session_auth_status 
   TABLE DATA           [   COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
    public          keycloak    false    250   ��      O          0    16779    client_session_note 
   TABLE DATA           J   COPY public.client_session_note (name, value, client_session) FROM stdin;
    public          keycloak    false    228   ��      ]          0    16966    client_session_prot_mapper 
   TABLE DATA           X   COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
    public          keycloak    false    242   Գ      9          0    16417    client_session_role 
   TABLE DATA           F   COPY public.client_session_role (role_id, client_session) FROM stdin;
    public          keycloak    false    206   �      f          0    17169    client_user_session_note 
   TABLE DATA           O   COPY public.client_user_session_note (name, value, client_session) FROM stdin;
    public          keycloak    false    251   �      �          0    17570 	   component 
   TABLE DATA           h   COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
    public          keycloak    false    281   +�      �          0    17564    component_config 
   TABLE DATA           I   COPY public.component_config (id, component_id, name, value) FROM stdin;
    public          keycloak    false    280   J�      :          0    16420    composite_role 
   TABLE DATA           ?   COPY public.composite_role (composite, child_role) FROM stdin;
    public          keycloak    false    207   W�      ;          0    16423 
   credential 
   TABLE DATA              COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
    public          keycloak    false    208   1�      6          0    16390    databasechangelog 
   TABLE DATA           �   COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
    public          keycloak    false    203   7�      �          0    18023    databasechangelog_tokencodee 
   TABLE DATA           �   COPY public.databasechangelog_tokencodee (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
    public          keycloak    false    294   �      5          0    16385    databasechangeloglock 
   TABLE DATA           R   COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
    public          keycloak    false    202         �          0    17837    default_client_scope 
   TABLE DATA           Q   COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
    public          keycloak    false    286   L      <          0    16429    event_entity 
   TABLE DATA           �   COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
    public          keycloak    false    209   h
      }          0    17526    fed_user_attribute 
   TABLE DATA           e   COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
    public          keycloak    false    274   �
      ~          0    17532    fed_user_consent 
   TABLE DATA           �   COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
    public          keycloak    false    275   �
      �          0    17863    fed_user_consent_cl_scope 
   TABLE DATA           N   COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
    public          keycloak    false    288   �
                0    17541    fed_user_credential 
   TABLE DATA           �   COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
    public          keycloak    false    276   �
      �          0    17551    fed_user_group_membership 
   TABLE DATA           e   COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
    public          keycloak    false    277   �
      �          0    17554    fed_user_required_action 
   TABLE DATA           k   COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
    public          keycloak    false    278         �          0    17561    fed_user_role_mapping 
   TABLE DATA           `   COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
    public          keycloak    false    279   3      S          0    16823    federated_identity 
   TABLE DATA           �   COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
    public          keycloak    false    232   P      �          0    17630    federated_user 
   TABLE DATA           K   COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
    public          keycloak    false    282   m      m          0    17242    group_attribute 
   TABLE DATA           D   COPY public.group_attribute (id, name, value, group_id) FROM stdin;
    public          keycloak    false    258   �      l          0    17239    group_role_mapping 
   TABLE DATA           ?   COPY public.group_role_mapping (role_id, group_id) FROM stdin;
    public          keycloak    false    257   �      T          0    16829    identity_provider 
   TABLE DATA             COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
    public          keycloak    false    233   *      U          0    16839    identity_provider_config 
   TABLE DATA           U   COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
    public          keycloak    false    234   G      Z          0    16945    identity_provider_mapper 
   TABLE DATA           b   COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
    public          keycloak    false    239   d      [          0    16951    idp_mapper_config 
   TABLE DATA           G   COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
    public          keycloak    false    240   �      k          0    17236    keycloak_group 
   TABLE DATA           J   COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
    public          keycloak    false    256   �      =          0    16438    keycloak_role 
   TABLE DATA           }   COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
    public          keycloak    false    210   N      Y          0    16942    migration_model 
   TABLE DATA           C   COPY public.migration_model (id, version, update_time) FROM stdin;
    public          keycloak    false    238   !      j          0    17226    offline_client_session 
   TABLE DATA           �   COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
    public          keycloak    false    255   V      i          0    17220    offline_user_session 
   TABLE DATA           �   COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
    public          keycloak    false    254   s      �          0    18029    phone_message_token_code 
   TABLE DATA           �   COPY public.phone_message_token_code (id, realm_id, phone_number, code, type, created_at, expires_at, confirmed, by_whom, ip, port, host) FROM stdin;
    public          keycloak    false    295   �      w          0    17447    policy_config 
   TABLE DATA           ?   COPY public.policy_config (policy_id, name, value) FROM stdin;
    public          keycloak    false    268   �      Q          0    16810    protocol_mapper 
   TABLE DATA           o   COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
    public          keycloak    false    230   �      R          0    16817    protocol_mapper_config 
   TABLE DATA           Q   COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
    public          keycloak    false    231   �#      >          0    16445    realm 
   TABLE DATA              COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
    public          keycloak    false    211   �0      ?          0    16463    realm_attribute 
   TABLE DATA           @   COPY public.realm_attribute (name, realm_id, value) FROM stdin;
    public          keycloak    false    212   �2      o          0    17252    realm_default_groups 
   TABLE DATA           B   COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
    public          keycloak    false    260   }7      X          0    16934    realm_enabled_event_types 
   TABLE DATA           D   COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
    public          keycloak    false    237   �7      @          0    16472    realm_events_listeners 
   TABLE DATA           A   COPY public.realm_events_listeners (realm_id, value) FROM stdin;
    public          keycloak    false    213   �7      �          0    17975    realm_localizations 
   TABLE DATA           F   COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
    public          keycloak    false    293   ]8      A          0    16475    realm_required_credential 
   TABLE DATA           ^   COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
    public          keycloak    false    214   z8      B          0    16483    realm_smtp_config 
   TABLE DATA           B   COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
    public          keycloak    false    215   �8      V          0    16849    realm_supported_locales 
   TABLE DATA           B   COPY public.realm_supported_locales (realm_id, value) FROM stdin;
    public          keycloak    false    235   9      C          0    16495    redirect_uris 
   TABLE DATA           9   COPY public.redirect_uris (client_id, value) FROM stdin;
    public          keycloak    false    216   #9      h          0    17183    required_action_config 
   TABLE DATA           Q   COPY public.required_action_config (required_action_id, value, name) FROM stdin;
    public          keycloak    false    253   6:      g          0    17175    required_action_provider 
   TABLE DATA           }   COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
    public          keycloak    false    252   S:      �          0    17902    resource_attribute 
   TABLE DATA           J   COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
    public          keycloak    false    290   �=      y          0    17475    resource_policy 
   TABLE DATA           A   COPY public.resource_policy (resource_id, policy_id) FROM stdin;
    public          keycloak    false    270   �=      x          0    17460    resource_scope 
   TABLE DATA           ?   COPY public.resource_scope (resource_id, scope_id) FROM stdin;
    public          keycloak    false    269   �=      s          0    17394    resource_server 
   TABLE DATA           k   COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
    public          keycloak    false    264   �=      �          0    17878    resource_server_perm_ticket 
   TABLE DATA           �   COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
    public          keycloak    false    289   >      v          0    17432    resource_server_policy 
   TABLE DATA           �   COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
    public          keycloak    false    267   5>      t          0    17402    resource_server_resource 
   TABLE DATA           �   COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
    public          keycloak    false    265   R>      u          0    17417    resource_server_scope 
   TABLE DATA           e   COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
    public          keycloak    false    266   o>      �          0    17921    resource_uris 
   TABLE DATA           ;   COPY public.resource_uris (resource_id, value) FROM stdin;
    public          keycloak    false    291   �>      �          0    17931    role_attribute 
   TABLE DATA           B   COPY public.role_attribute (id, role_id, name, value) FROM stdin;
    public          keycloak    false    292   �>      D          0    16498    scope_mapping 
   TABLE DATA           ;   COPY public.scope_mapping (client_id, role_id) FROM stdin;
    public          keycloak    false    217   �>      z          0    17490    scope_policy 
   TABLE DATA           ;   COPY public.scope_policy (scope_id, policy_id) FROM stdin;
    public          keycloak    false    271   w?      F          0    16504    user_attribute 
   TABLE DATA           B   COPY public.user_attribute (name, value, user_id, id) FROM stdin;
    public          keycloak    false    219   �?      \          0    16957    user_consent 
   TABLE DATA           �   COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
    public          keycloak    false    241   �?      �          0    17853    user_consent_client_scope 
   TABLE DATA           N   COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
    public          keycloak    false    287   �?      G          0    16510    user_entity 
   TABLE DATA           �   COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
    public          keycloak    false    220   �?      H          0    16519    user_federation_config 
   TABLE DATA           Z   COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
    public          keycloak    false    221   KA      c          0    17073    user_federation_mapper 
   TABLE DATA           t   COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
    public          keycloak    false    248   hA      d          0    17079    user_federation_mapper_config 
   TABLE DATA           _   COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
    public          keycloak    false    249   �A      I          0    16525    user_federation_provider 
   TABLE DATA           �   COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
    public          keycloak    false    222   �A      n          0    17249    user_group_membership 
   TABLE DATA           B   COPY public.user_group_membership (group_id, user_id) FROM stdin;
    public          keycloak    false    259   �A      J          0    16531    user_required_action 
   TABLE DATA           H   COPY public.user_required_action (user_id, required_action) FROM stdin;
    public          keycloak    false    223   B      K          0    16534    user_role_mapping 
   TABLE DATA           =   COPY public.user_role_mapping (role_id, user_id) FROM stdin;
    public          keycloak    false    224   6B      L          0    16537    user_session 
   TABLE DATA           �   COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
    public          keycloak    false    225   �B      W          0    16852    user_session_note 
   TABLE DATA           F   COPY public.user_session_note (user_session, name, value) FROM stdin;
    public          keycloak    false    236   C      E          0    16501    username_login_failure 
   TABLE DATA           �   COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
    public          keycloak    false    218   !C      M          0    16550    web_origins 
   TABLE DATA           7   COPY public.web_origins (client_id, value) FROM stdin;
    public          keycloak    false    226   >C      w           2606    17644 &   username_login_failure CONSTRAINT_17-2 
   CONSTRAINT     v   ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);
 R   ALTER TABLE ONLY public.username_login_failure DROP CONSTRAINT "CONSTRAINT_17-2";
       public            keycloak    false    218    218            \           2606    17956 ,   keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2 
   CONSTRAINT     �   ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);
 X   ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2";
       public            keycloak    false    210    210            O           2606    17783 )   client_auth_flow_bindings c_cli_flow_bind 
   CONSTRAINT     |   ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);
 S   ALTER TABLE ONLY public.client_auth_flow_bindings DROP CONSTRAINT c_cli_flow_bind;
       public            keycloak    false    284    284            Q           2606    17988 $   client_scope_client c_cli_scope_bind 
   CONSTRAINT     s   ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);
 N   ALTER TABLE ONLY public.client_scope_client DROP CONSTRAINT c_cli_scope_bind;
       public            keycloak    false    285    285            L           2606    17658 .   client_initial_access cnstr_client_init_acc_pk 
   CONSTRAINT     l   ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.client_initial_access DROP CONSTRAINT cnstr_client_init_acc_pk;
       public            keycloak    false    283            �           2606    17290 ,   realm_default_groups con_group_id_def_groups 
   CONSTRAINT     k   ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);
 V   ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT con_group_id_def_groups;
       public            keycloak    false    260            )           2606    17577 !   broker_link constr_broker_link_pk 
   CONSTRAINT     w   ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);
 K   ALTER TABLE ONLY public.broker_link DROP CONSTRAINT constr_broker_link_pk;
       public            keycloak    false    273    273            �           2606    17196 /   client_user_session_note constr_cl_usr_ses_note 
   CONSTRAINT        ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);
 Y   ALTER TABLE ONLY public.client_user_session_note DROP CONSTRAINT constr_cl_usr_ses_note;
       public            keycloak    false    251    251            C           2606    17597 +   component_config constr_component_config_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.component_config DROP CONSTRAINT constr_component_config_pk;
       public            keycloak    false    280            F           2606    17595    component constr_component_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.component DROP CONSTRAINT constr_component_pk;
       public            keycloak    false    281            ;           2606    17593 3   fed_user_required_action constr_fed_required_action 
   CONSTRAINT     �   ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);
 ]   ALTER TABLE ONLY public.fed_user_required_action DROP CONSTRAINT constr_fed_required_action;
       public            keycloak    false    278    278            +           2606    17579 *   fed_user_attribute constr_fed_user_attr_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.fed_user_attribute DROP CONSTRAINT constr_fed_user_attr_pk;
       public            keycloak    false    274            .           2606    17581 +   fed_user_consent constr_fed_user_consent_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.fed_user_consent DROP CONSTRAINT constr_fed_user_consent_pk;
       public            keycloak    false    275            3           2606    17587 +   fed_user_credential constr_fed_user_cred_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.fed_user_credential DROP CONSTRAINT constr_fed_user_cred_pk;
       public            keycloak    false    276            7           2606    17589 /   fed_user_group_membership constr_fed_user_group 
   CONSTRAINT     |   ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);
 Y   ALTER TABLE ONLY public.fed_user_group_membership DROP CONSTRAINT constr_fed_user_group;
       public            keycloak    false    277    277            ?           2606    17591 *   fed_user_role_mapping constr_fed_user_role 
   CONSTRAINT     v   ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);
 T   ALTER TABLE ONLY public.fed_user_role_mapping DROP CONSTRAINT constr_fed_user_role;
       public            keycloak    false    279    279            J           2606    17637 $   federated_user constr_federated_user 
   CONSTRAINT     b   ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.federated_user DROP CONSTRAINT constr_federated_user;
       public            keycloak    false    282            �           2606    17742 0   realm_default_groups constr_realm_default_groups 
   CONSTRAINT     ~   ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);
 Z   ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT constr_realm_default_groups;
       public            keycloak    false    260    260            �           2606    17759 8   realm_enabled_event_types constr_realm_enabl_event_types 
   CONSTRAINT     �   ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);
 b   ALTER TABLE ONLY public.realm_enabled_event_types DROP CONSTRAINT constr_realm_enabl_event_types;
       public            keycloak    false    237    237            j           2606    17761 4   realm_events_listeners constr_realm_events_listeners 
   CONSTRAINT        ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);
 ^   ALTER TABLE ONLY public.realm_events_listeners DROP CONSTRAINT constr_realm_events_listeners;
       public            keycloak    false    213    213            �           2606    17763 6   realm_supported_locales constr_realm_supported_locales 
   CONSTRAINT     �   ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);
 `   ALTER TABLE ONLY public.realm_supported_locales DROP CONSTRAINT constr_realm_supported_locales;
       public            keycloak    false    235    235            �           2606    16862    identity_provider constraint_2b 
   CONSTRAINT     f   ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);
 I   ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT constraint_2b;
       public            keycloak    false    233            �           2606    16790    client_attributes constraint_3c 
   CONSTRAINT     j   ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);
 I   ALTER TABLE ONLY public.client_attributes DROP CONSTRAINT constraint_3c;
       public            keycloak    false    227    227            Y           2606    16562    event_entity constraint_4 
   CONSTRAINT     W   ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.event_entity DROP CONSTRAINT constraint_4;
       public            keycloak    false    209            �           2606    16864     federated_identity constraint_40 
   CONSTRAINT     v   ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);
 J   ALTER TABLE ONLY public.federated_identity DROP CONSTRAINT constraint_40;
       public            keycloak    false    232    232            b           2606    16564    realm constraint_4a 
   CONSTRAINT     Q   ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.realm DROP CONSTRAINT constraint_4a;
       public            keycloak    false    211            P           2606    16566     client_session_role constraint_5 
   CONSTRAINT     s   ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);
 J   ALTER TABLE ONLY public.client_session_role DROP CONSTRAINT constraint_5;
       public            keycloak    false    206    206            �           2606    16568    user_session constraint_57 
   CONSTRAINT     X   ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.user_session DROP CONSTRAINT constraint_57;
       public            keycloak    false    225            �           2606    16570 &   user_federation_provider constraint_5c 
   CONSTRAINT     d   ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.user_federation_provider DROP CONSTRAINT constraint_5c;
       public            keycloak    false    222            �           2606    16792 !   client_session_note constraint_5e 
   CONSTRAINT     q   ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);
 K   ALTER TABLE ONLY public.client_session_note DROP CONSTRAINT constraint_5e;
       public            keycloak    false    228    228            H           2606    16574    client constraint_7 
   CONSTRAINT     Q   ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.client DROP CONSTRAINT constraint_7;
       public            keycloak    false    204            M           2606    16576    client_session constraint_8 
   CONSTRAINT     Y   ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.client_session DROP CONSTRAINT constraint_8;
       public            keycloak    false    205            t           2606    16578    scope_mapping constraint_81 
   CONSTRAINT     i   ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);
 E   ALTER TABLE ONLY public.scope_mapping DROP CONSTRAINT constraint_81;
       public            keycloak    false    217    217            �           2606    16794 '   client_node_registrations constraint_84 
   CONSTRAINT     r   ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);
 Q   ALTER TABLE ONLY public.client_node_registrations DROP CONSTRAINT constraint_84;
       public            keycloak    false    229    229            g           2606    16580    realm_attribute constraint_9 
   CONSTRAINT     f   ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);
 F   ALTER TABLE ONLY public.realm_attribute DROP CONSTRAINT constraint_9;
       public            keycloak    false    212    212            m           2606    16582 '   realm_required_credential constraint_92 
   CONSTRAINT     q   ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);
 Q   ALTER TABLE ONLY public.realm_required_credential DROP CONSTRAINT constraint_92;
       public            keycloak    false    214    214            ^           2606    16584    keycloak_role constraint_a 
   CONSTRAINT     X   ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT constraint_a;
       public            keycloak    false    210            �           2606    17746 0   admin_event_entity constraint_admin_event_entity 
   CONSTRAINT     n   ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.admin_event_entity DROP CONSTRAINT constraint_admin_event_entity;
       public            keycloak    false    243            �           2606    17101 1   authenticator_config_entry constraint_auth_cfg_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);
 [   ALTER TABLE ONLY public.authenticator_config_entry DROP CONSTRAINT constraint_auth_cfg_pk;
       public            keycloak    false    247    247            �           2606    17099 0   authentication_execution constraint_auth_exec_pk 
   CONSTRAINT     n   ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT constraint_auth_exec_pk;
       public            keycloak    false    246            �           2606    17097 +   authentication_flow constraint_auth_flow_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.authentication_flow DROP CONSTRAINT constraint_auth_flow_pk;
       public            keycloak    false    245            �           2606    17095 '   authenticator_config constraint_auth_pk 
   CONSTRAINT     e   ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.authenticator_config DROP CONSTRAINT constraint_auth_pk;
       public            keycloak    false    244            �           2606    17105 4   client_session_auth_status constraint_auth_status_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);
 ^   ALTER TABLE ONLY public.client_session_auth_status DROP CONSTRAINT constraint_auth_status_pk;
       public            keycloak    false    250    250            �           2606    16586    user_role_mapping constraint_c 
   CONSTRAINT     j   ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);
 H   ALTER TABLE ONLY public.user_role_mapping DROP CONSTRAINT constraint_c;
       public            keycloak    false    224    224            R           2606    17740 (   composite_role constraint_composite_role 
   CONSTRAINT     y   ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);
 R   ALTER TABLE ONLY public.composite_role DROP CONSTRAINT constraint_composite_role;
       public            keycloak    false    207    207            �           2606    16982 /   client_session_prot_mapper constraint_cs_pmp_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);
 Y   ALTER TABLE ONLY public.client_session_prot_mapper DROP CONSTRAINT constraint_cs_pmp_pk;
       public            keycloak    false    242    242            �           2606    16866 %   identity_provider_config constraint_d 
   CONSTRAINT     {   ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);
 O   ALTER TABLE ONLY public.identity_provider_config DROP CONSTRAINT constraint_d;
       public            keycloak    false    234    234                       2606    17454    policy_config constraint_dpc 
   CONSTRAINT     g   ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);
 F   ALTER TABLE ONLY public.policy_config DROP CONSTRAINT constraint_dpc;
       public            keycloak    false    268    268            o           2606    16588    realm_smtp_config constraint_e 
   CONSTRAINT     h   ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);
 H   ALTER TABLE ONLY public.realm_smtp_config DROP CONSTRAINT constraint_e;
       public            keycloak    false    215    215            V           2606    16590    credential constraint_f 
   CONSTRAINT     U   ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.credential DROP CONSTRAINT constraint_f;
       public            keycloak    false    208            �           2606    16592 $   user_federation_config constraint_f9 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);
 N   ALTER TABLE ONLY public.user_federation_config DROP CONSTRAINT constraint_f9;
       public            keycloak    false    221    221            ^           2606    17882 ,   resource_server_perm_ticket constraint_fapmt 
   CONSTRAINT     j   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT constraint_fapmt;
       public            keycloak    false    289                       2606    17409 )   resource_server_resource constraint_farsr 
   CONSTRAINT     g   ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT constraint_farsr;
       public            keycloak    false    265                       2606    17439 (   resource_server_policy constraint_farsrp 
   CONSTRAINT     f   ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT constraint_farsrp;
       public            keycloak    false    267            &           2606    17509 %   associated_policy constraint_farsrpap 
   CONSTRAINT     �   ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);
 O   ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT constraint_farsrpap;
       public            keycloak    false    272    272                        2606    17479 "   resource_policy constraint_farsrpp 
   CONSTRAINT     t   ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);
 L   ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT constraint_farsrpp;
       public            keycloak    false    270    270                       2606    17424 '   resource_server_scope constraint_farsrs 
   CONSTRAINT     e   ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT constraint_farsrs;
       public            keycloak    false    266                       2606    17464 !   resource_scope constraint_farsrsp 
   CONSTRAINT     r   ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);
 K   ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT constraint_farsrsp;
       public            keycloak    false    269    269            #           2606    17494     scope_policy constraint_farsrsps 
   CONSTRAINT     o   ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);
 J   ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT constraint_farsrsps;
       public            keycloak    false    271    271            }           2606    16594    user_entity constraint_fb 
   CONSTRAINT     W   ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.user_entity DROP CONSTRAINT constraint_fb;
       public            keycloak    false    220            �           2606    17109 9   user_federation_mapper_config constraint_fedmapper_cfg_pm 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);
 c   ALTER TABLE ONLY public.user_federation_mapper_config DROP CONSTRAINT constraint_fedmapper_cfg_pm;
       public            keycloak    false    249    249            �           2606    17107 -   user_federation_mapper constraint_fedmapperpm 
   CONSTRAINT     k   ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);
 W   ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT constraint_fedmapperpm;
       public            keycloak    false    248            \           2606    17867 6   fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm 
   CONSTRAINT     �   ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);
 `   ALTER TABLE ONLY public.fed_user_consent_cl_scope DROP CONSTRAINT constraint_fgrntcsnt_clsc_pm;
       public            keycloak    false    288    288            Y           2606    17857 5   user_consent_client_scope constraint_grntcsnt_clsc_pm 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);
 _   ALTER TABLE ONLY public.user_consent_client_scope DROP CONSTRAINT constraint_grntcsnt_clsc_pm;
       public            keycloak    false    287    287            �           2606    16976 #   user_consent constraint_grntcsnt_pm 
   CONSTRAINT     a   ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);
 M   ALTER TABLE ONLY public.user_consent DROP CONSTRAINT constraint_grntcsnt_pm;
       public            keycloak    false    241            �           2606    17257    keycloak_group constraint_group 
   CONSTRAINT     ]   ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);
 I   ALTER TABLE ONLY public.keycloak_group DROP CONSTRAINT constraint_group;
       public            keycloak    false    256            �           2606    17264 -   group_attribute constraint_group_attribute_pk 
   CONSTRAINT     k   ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);
 W   ALTER TABLE ONLY public.group_attribute DROP CONSTRAINT constraint_group_attribute_pk;
       public            keycloak    false    258            �           2606    17278 (   group_role_mapping constraint_group_role 
   CONSTRAINT     u   ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);
 R   ALTER TABLE ONLY public.group_role_mapping DROP CONSTRAINT constraint_group_role;
       public            keycloak    false    257    257            �           2606    16972 (   identity_provider_mapper constraint_idpm 
   CONSTRAINT     f   ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.identity_provider_mapper DROP CONSTRAINT constraint_idpm;
       public            keycloak    false    239            �           2606    17158 '   idp_mapper_config constraint_idpmconfig 
   CONSTRAINT     v   ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);
 Q   ALTER TABLE ONLY public.idp_mapper_config DROP CONSTRAINT constraint_idpmconfig;
       public            keycloak    false    240    240            �           2606    16970 !   migration_model constraint_migmod 
   CONSTRAINT     _   ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);
 K   ALTER TABLE ONLY public.migration_model DROP CONSTRAINT constraint_migmod;
       public            keycloak    false    238            �           2606    17963 1   offline_client_session constraint_offl_cl_ses_pk3 
   CONSTRAINT     �   ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);
 [   ALTER TABLE ONLY public.offline_client_session DROP CONSTRAINT constraint_offl_cl_ses_pk3;
       public            keycloak    false    255    255    255    255    255            �           2606    17233 /   offline_user_session constraint_offl_us_ses_pk2 
   CONSTRAINT     �   ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);
 Y   ALTER TABLE ONLY public.offline_user_session DROP CONSTRAINT constraint_offl_us_ses_pk2;
       public            keycloak    false    254    254            �           2606    16860    protocol_mapper constraint_pcm 
   CONSTRAINT     \   ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT constraint_pcm;
       public            keycloak    false    230            �           2606    17151 *   protocol_mapper_config constraint_pmconfig 
   CONSTRAINT     ~   ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);
 T   ALTER TABLE ONLY public.protocol_mapper_config DROP CONSTRAINT constraint_pmconfig;
       public            keycloak    false    231    231            q           2606    17765 &   redirect_uris constraint_redirect_uris 
   CONSTRAINT     r   ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);
 P   ALTER TABLE ONLY public.redirect_uris DROP CONSTRAINT constraint_redirect_uris;
       public            keycloak    false    216    216            �           2606    17194 0   required_action_config constraint_req_act_cfg_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);
 Z   ALTER TABLE ONLY public.required_action_config DROP CONSTRAINT constraint_req_act_cfg_pk;
       public            keycloak    false    253    253            �           2606    17192 2   required_action_provider constraint_req_act_prv_pk 
   CONSTRAINT     p   ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.required_action_provider DROP CONSTRAINT constraint_req_act_prv_pk;
       public            keycloak    false    252            �           2606    17103 /   user_required_action constraint_required_action 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);
 Y   ALTER TABLE ONLY public.user_required_action DROP CONSTRAINT constraint_required_action;
       public            keycloak    false    223    223            d           2606    17930 '   resource_uris constraint_resour_uris_pk 
   CONSTRAINT     u   ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);
 Q   ALTER TABLE ONLY public.resource_uris DROP CONSTRAINT constraint_resour_uris_pk;
       public            keycloak    false    291    291            f           2606    17938 +   role_attribute constraint_role_attribute_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.role_attribute DROP CONSTRAINT constraint_role_attribute_pk;
       public            keycloak    false    292            y           2606    17190 +   user_attribute constraint_user_attribute_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.user_attribute DROP CONSTRAINT constraint_user_attribute_pk;
       public            keycloak    false    219            �           2606    17271 +   user_group_membership constraint_user_group 
   CONSTRAINT     x   ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);
 U   ALTER TABLE ONLY public.user_group_membership DROP CONSTRAINT constraint_user_group;
       public            keycloak    false    259    259            �           2606    16870 #   user_session_note constraint_usn_pk 
   CONSTRAINT     q   ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);
 M   ALTER TABLE ONLY public.user_session_note DROP CONSTRAINT constraint_usn_pk;
       public            keycloak    false    236    236            �           2606    17767 "   web_origins constraint_web_origins 
   CONSTRAINT     n   ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);
 L   ALTER TABLE ONLY public.web_origins DROP CONSTRAINT constraint_web_origins;
       public            keycloak    false    226    226            F           2606    16389 0   databasechangeloglock databasechangeloglock_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.databasechangeloglock DROP CONSTRAINT databasechangeloglock_pkey;
       public            keycloak    false    202                       2606    17376 '   client_scope_attributes pk_cl_tmpl_attr 
   CONSTRAINT     q   ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);
 Q   ALTER TABLE ONLY public.client_scope_attributes DROP CONSTRAINT pk_cl_tmpl_attr;
       public            keycloak    false    262    262            �           2606    17335    client_scope pk_cli_template 
   CONSTRAINT     Z   ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.client_scope DROP CONSTRAINT pk_cli_template;
       public            keycloak    false    261            l           2606    18034 4   phone_message_token_code pk_phone_message_token_code 
   CONSTRAINT     r   ALTER TABLE ONLY public.phone_message_token_code
    ADD CONSTRAINT pk_phone_message_token_code PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.phone_message_token_code DROP CONSTRAINT pk_phone_message_token_code;
       public            keycloak    false    295            
           2606    17720 "   resource_server pk_resource_server 
   CONSTRAINT     `   ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.resource_server DROP CONSTRAINT pk_resource_server;
       public            keycloak    false    264                       2606    17364 +   client_scope_role_mapping pk_template_scope 
   CONSTRAINT     x   ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);
 U   ALTER TABLE ONLY public.client_scope_role_mapping DROP CONSTRAINT pk_template_scope;
       public            keycloak    false    263    263            W           2606    17842 )   default_client_scope r_def_cli_scope_bind 
   CONSTRAINT     w   ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);
 S   ALTER TABLE ONLY public.default_client_scope DROP CONSTRAINT r_def_cli_scope_bind;
       public            keycloak    false    286    286            i           2606    17982 ,   realm_localizations realm_localizations_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);
 V   ALTER TABLE ONLY public.realm_localizations DROP CONSTRAINT realm_localizations_pkey;
       public            keycloak    false    293    293            b           2606    17910    resource_attribute res_attr_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.resource_attribute DROP CONSTRAINT res_attr_pk;
       public            keycloak    false    290            �           2606    17650    keycloak_group sibling_names 
   CONSTRAINT     o   ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);
 F   ALTER TABLE ONLY public.keycloak_group DROP CONSTRAINT sibling_names;
       public            keycloak    false    256    256    256            �           2606    16917 /   identity_provider uk_2daelwnibji49avxsrtuf6xj33 
   CONSTRAINT     ~   ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);
 Y   ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33;
       public            keycloak    false    233    233            K           2606    16598 #   client uk_b71cjlbenv945rb6gcon438at 
   CONSTRAINT     m   ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);
 M   ALTER TABLE ONLY public.client DROP CONSTRAINT uk_b71cjlbenv945rb6gcon438at;
       public            keycloak    false    204    204                       2606    17795    client_scope uk_cli_scope 
   CONSTRAINT     ^   ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);
 C   ALTER TABLE ONLY public.client_scope DROP CONSTRAINT uk_cli_scope;
       public            keycloak    false    261    261            �           2606    16602 (   user_entity uk_dykn684sl8up1crfei6eckhd7 
   CONSTRAINT     y   ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);
 R   ALTER TABLE ONLY public.user_entity DROP CONSTRAINT uk_dykn684sl8up1crfei6eckhd7;
       public            keycloak    false    220    220                       2606    17972 4   resource_server_resource uk_frsr6t700s9v50bu18ws5ha6 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);
 ^   ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6;
       public            keycloak    false    265    265    265            `           2606    17967 7   resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);
 a   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt;
       public            keycloak    false    289    289    289    289    289                       2606    17711 2   resource_server_policy uk_frsrpt700s9v50bu18ws5ha6 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);
 \   ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6;
       public            keycloak    false    267    267                       2606    17715 1   resource_server_scope uk_frsrst700s9v50bu18ws5ha6 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);
 [   ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT uk_frsrst700s9v50bu18ws5ha6;
       public            keycloak    false    266    266            �           2606    17958 )   user_consent uk_jkuwuvd56ontgsuhogm8uewrt 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);
 S   ALTER TABLE ONLY public.user_consent DROP CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt;
       public            keycloak    false    241    241    241    241            e           2606    16610 "   realm uk_orvsdmla56612eaefiq6wl5oi 
   CONSTRAINT     ]   ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);
 L   ALTER TABLE ONLY public.realm DROP CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi;
       public            keycloak    false    211            �           2606    17639 (   user_entity uk_ru8tt6t700s9v50bu18ws5ha6 
   CONSTRAINT     q   ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);
 R   ALTER TABLE ONLY public.user_entity DROP CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6;
       public            keycloak    false    220    220            �           1259    17999    idx_admin_event_time    INDEX     i   CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);
 (   DROP INDEX public.idx_admin_event_time;
       public            keycloak    false    243    243            '           1259    17664    idx_assoc_pol_assoc_pol_id    INDEX     h   CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);
 .   DROP INDEX public.idx_assoc_pol_assoc_pol_id;
       public            keycloak    false    272            �           1259    17668    idx_auth_config_realm    INDEX     Z   CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);
 )   DROP INDEX public.idx_auth_config_realm;
       public            keycloak    false    244            �           1259    17666    idx_auth_exec_flow    INDEX     Z   CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);
 &   DROP INDEX public.idx_auth_exec_flow;
       public            keycloak    false    246            �           1259    17665    idx_auth_exec_realm_flow    INDEX     j   CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);
 ,   DROP INDEX public.idx_auth_exec_realm_flow;
       public            keycloak    false    246    246            �           1259    17667    idx_auth_flow_realm    INDEX     W   CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);
 '   DROP INDEX public.idx_auth_flow_realm;
       public            keycloak    false    245            R           1259    17989    idx_cl_clscope    INDEX     R   CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);
 "   DROP INDEX public.idx_cl_clscope;
       public            keycloak    false    285            I           1259    17973    idx_client_id    INDEX     E   CREATE INDEX idx_client_id ON public.client USING btree (client_id);
 !   DROP INDEX public.idx_client_id;
       public            keycloak    false    204            M           1259    17708    idx_client_init_acc_realm    INDEX     _   CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);
 -   DROP INDEX public.idx_client_init_acc_realm;
       public            keycloak    false    283            N           1259    17672    idx_client_session_session    INDEX     [   CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);
 .   DROP INDEX public.idx_client_session_session;
       public            keycloak    false    205                       1259    17872    idx_clscope_attrs    INDEX     Y   CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);
 %   DROP INDEX public.idx_clscope_attrs;
       public            keycloak    false    262            S           1259    17986    idx_clscope_cl    INDEX     S   CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);
 "   DROP INDEX public.idx_clscope_cl;
       public            keycloak    false    285            �           1259    17869    idx_clscope_protmap    INDEX     Z   CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);
 '   DROP INDEX public.idx_clscope_protmap;
       public            keycloak    false    230                       1259    17870    idx_clscope_role    INDEX     Z   CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);
 $   DROP INDEX public.idx_clscope_role;
       public            keycloak    false    263            D           1259    17674    idx_compo_config_compo    INDEX     [   CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);
 *   DROP INDEX public.idx_compo_config_compo;
       public            keycloak    false    280            G           1259    17945    idx_component_provider_type    INDEX     Z   CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);
 /   DROP INDEX public.idx_component_provider_type;
       public            keycloak    false    281            H           1259    17673    idx_component_realm    INDEX     M   CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);
 '   DROP INDEX public.idx_component_realm;
       public            keycloak    false    281            S           1259    17675    idx_composite    INDEX     M   CREATE INDEX idx_composite ON public.composite_role USING btree (composite);
 !   DROP INDEX public.idx_composite;
       public            keycloak    false    207            T           1259    17676    idx_composite_child    INDEX     T   CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);
 '   DROP INDEX public.idx_composite_child;
       public            keycloak    false    207            T           1259    17875    idx_defcls_realm    INDEX     U   CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);
 $   DROP INDEX public.idx_defcls_realm;
       public            keycloak    false    286            U           1259    17876    idx_defcls_scope    INDEX     U   CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);
 $   DROP INDEX public.idx_defcls_scope;
       public            keycloak    false    286            Z           1259    17974    idx_event_time    INDEX     W   CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);
 "   DROP INDEX public.idx_event_time;
       public            keycloak    false    209    209            �           1259    17393    idx_fedidentity_feduser    INDEX     c   CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);
 +   DROP INDEX public.idx_fedidentity_feduser;
       public            keycloak    false    232            �           1259    17392    idx_fedidentity_user    INDEX     V   CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);
 (   DROP INDEX public.idx_fedidentity_user;
       public            keycloak    false    232            ,           1259    17768    idx_fu_attribute    INDEX     b   CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);
 $   DROP INDEX public.idx_fu_attribute;
       public            keycloak    false    274    274    274            /           1259    17789    idx_fu_cnsnt_ext    INDEX     }   CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);
 $   DROP INDEX public.idx_fu_cnsnt_ext;
       public            keycloak    false    275    275    275            0           1259    17954    idx_fu_consent    INDEX     Y   CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);
 "   DROP INDEX public.idx_fu_consent;
       public            keycloak    false    275    275            1           1259    17770    idx_fu_consent_ru    INDEX     [   CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);
 %   DROP INDEX public.idx_fu_consent_ru;
       public            keycloak    false    275    275            4           1259    17771    idx_fu_credential    INDEX     Z   CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);
 %   DROP INDEX public.idx_fu_credential;
       public            keycloak    false    276    276            5           1259    17772    idx_fu_credential_ru    INDEX     a   CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);
 (   DROP INDEX public.idx_fu_credential_ru;
       public            keycloak    false    276    276            8           1259    17773    idx_fu_group_membership    INDEX     j   CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);
 +   DROP INDEX public.idx_fu_group_membership;
       public            keycloak    false    277    277            9           1259    17774    idx_fu_group_membership_ru    INDEX     m   CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);
 .   DROP INDEX public.idx_fu_group_membership_ru;
       public            keycloak    false    277    277            <           1259    17775    idx_fu_required_action    INDEX     o   CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);
 *   DROP INDEX public.idx_fu_required_action;
       public            keycloak    false    278    278            =           1259    17776    idx_fu_required_action_ru    INDEX     k   CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);
 -   DROP INDEX public.idx_fu_required_action_ru;
       public            keycloak    false    278    278            @           1259    17777    idx_fu_role_mapping    INDEX     a   CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);
 '   DROP INDEX public.idx_fu_role_mapping;
       public            keycloak    false    279    279            A           1259    17778    idx_fu_role_mapping_ru    INDEX     e   CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);
 *   DROP INDEX public.idx_fu_role_mapping_ru;
       public            keycloak    false    279    279            �           1259    18000    idx_group_att_by_name_value    INDEX     z   CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));
 /   DROP INDEX public.idx_group_att_by_name_value;
       public            keycloak    false    258    258            �           1259    17679    idx_group_attr_group    INDEX     T   CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);
 (   DROP INDEX public.idx_group_attr_group;
       public            keycloak    false    258            �           1259    17680    idx_group_role_mapp_group    INDEX     \   CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);
 -   DROP INDEX public.idx_group_role_mapp_group;
       public            keycloak    false    257            �           1259    17682    idx_id_prov_mapp_realm    INDEX     _   CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);
 *   DROP INDEX public.idx_id_prov_mapp_realm;
       public            keycloak    false    239            �           1259    17681    idx_ident_prov_realm    INDEX     V   CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);
 (   DROP INDEX public.idx_ident_prov_realm;
       public            keycloak    false    233            _           1259    17683    idx_keycloak_role_client    INDEX     T   CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);
 ,   DROP INDEX public.idx_keycloak_role_client;
       public            keycloak    false    210            `           1259    17684    idx_keycloak_role_realm    INDEX     R   CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);
 +   DROP INDEX public.idx_keycloak_role_realm;
       public            keycloak    false    210            �           1259    17993    idx_offline_css_preload    INDEX     m   CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);
 +   DROP INDEX public.idx_offline_css_preload;
       public            keycloak    false    255    255            �           1259    17994    idx_offline_uss_by_user    INDEX     s   CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);
 +   DROP INDEX public.idx_offline_uss_by_user;
       public            keycloak    false    254    254    254            �           1259    17995    idx_offline_uss_by_usersess    INDEX        CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);
 /   DROP INDEX public.idx_offline_uss_by_usersess;
       public            keycloak    false    254    254    254            �           1259    17949    idx_offline_uss_createdon    INDEX     `   CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);
 -   DROP INDEX public.idx_offline_uss_createdon;
       public            keycloak    false    254            �           1259    17983    idx_offline_uss_preload    INDEX     }   CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);
 +   DROP INDEX public.idx_offline_uss_preload;
       public            keycloak    false    254    254    254            �           1259    17685    idx_protocol_mapper_client    INDEX     [   CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);
 .   DROP INDEX public.idx_protocol_mapper_client;
       public            keycloak    false    230            h           1259    17688    idx_realm_attr_realm    INDEX     T   CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);
 (   DROP INDEX public.idx_realm_attr_realm;
       public            keycloak    false    212            �           1259    17868    idx_realm_clscope    INDEX     N   CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);
 %   DROP INDEX public.idx_realm_clscope;
       public            keycloak    false    261            �           1259    17689    idx_realm_def_grp_realm    INDEX     \   CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);
 +   DROP INDEX public.idx_realm_def_grp_realm;
       public            keycloak    false    260            k           1259    17692    idx_realm_evt_list_realm    INDEX     _   CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);
 ,   DROP INDEX public.idx_realm_evt_list_realm;
       public            keycloak    false    213            �           1259    17691    idx_realm_evt_types_realm    INDEX     c   CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);
 -   DROP INDEX public.idx_realm_evt_types_realm;
       public            keycloak    false    237            c           1259    17687    idx_realm_master_adm_cli    INDEX     Y   CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);
 ,   DROP INDEX public.idx_realm_master_adm_cli;
       public            keycloak    false    211            �           1259    17693    idx_realm_supp_local_realm    INDEX     b   CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);
 .   DROP INDEX public.idx_realm_supp_local_realm;
       public            keycloak    false    235            r           1259    17694    idx_redir_uri_client    INDEX     S   CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);
 (   DROP INDEX public.idx_redir_uri_client;
       public            keycloak    false    216            �           1259    17695    idx_req_act_prov_realm    INDEX     _   CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);
 *   DROP INDEX public.idx_req_act_prov_realm;
       public            keycloak    false    252            !           1259    17696    idx_res_policy_policy    INDEX     V   CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);
 )   DROP INDEX public.idx_res_policy_policy;
       public            keycloak    false    270                       1259    17697    idx_res_scope_scope    INDEX     R   CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);
 '   DROP INDEX public.idx_res_scope_scope;
       public            keycloak    false    269                       1259    17716    idx_res_serv_pol_res_serv    INDEX     j   CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);
 -   DROP INDEX public.idx_res_serv_pol_res_serv;
       public            keycloak    false    267                       1259    17717    idx_res_srv_res_res_srv    INDEX     j   CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);
 +   DROP INDEX public.idx_res_srv_res_res_srv;
       public            keycloak    false    265                       1259    17718    idx_res_srv_scope_res_srv    INDEX     i   CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);
 -   DROP INDEX public.idx_res_srv_scope_res_srv;
       public            keycloak    false    266            g           1259    17944    idx_role_attribute    INDEX     P   CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);
 &   DROP INDEX public.idx_role_attribute;
       public            keycloak    false    292                       1259    17871    idx_role_clscope    INDEX     Y   CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);
 $   DROP INDEX public.idx_role_clscope;
       public            keycloak    false    263            u           1259    17701    idx_scope_mapping_role    INDEX     S   CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);
 *   DROP INDEX public.idx_scope_mapping_role;
       public            keycloak    false    217            $           1259    17702    idx_scope_policy_policy    INDEX     U   CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);
 +   DROP INDEX public.idx_scope_policy_policy;
       public            keycloak    false    271            �           1259    17952    idx_update_time    INDEX     R   CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);
 #   DROP INDEX public.idx_update_time;
       public            keycloak    false    238            �           1259    17382    idx_us_sess_id_on_cl_sess    INDEX     g   CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);
 -   DROP INDEX public.idx_us_sess_id_on_cl_sess;
       public            keycloak    false    255            Z           1259    17877    idx_usconsent_clscope    INDEX     f   CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);
 )   DROP INDEX public.idx_usconsent_clscope;
       public            keycloak    false    287            z           1259    17389    idx_user_attribute    INDEX     P   CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);
 &   DROP INDEX public.idx_user_attribute;
       public            keycloak    false    219            {           1259    17997    idx_user_attribute_name    INDEX     Y   CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);
 +   DROP INDEX public.idx_user_attribute_name;
       public            keycloak    false    219    219            �           1259    17386    idx_user_consent    INDEX     L   CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);
 $   DROP INDEX public.idx_user_consent;
       public            keycloak    false    241            W           1259    17390    idx_user_credential    INDEX     M   CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);
 '   DROP INDEX public.idx_user_credential;
       public            keycloak    false    208            ~           1259    17383    idx_user_email    INDEX     G   CREATE INDEX idx_user_email ON public.user_entity USING btree (email);
 "   DROP INDEX public.idx_user_email;
       public            keycloak    false    220            �           1259    17385    idx_user_group_mapping    INDEX     [   CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);
 *   DROP INDEX public.idx_user_group_mapping;
       public            keycloak    false    259            �           1259    17391    idx_user_reqactions    INDEX     W   CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);
 '   DROP INDEX public.idx_user_reqactions;
       public            keycloak    false    223            �           1259    17384    idx_user_role_mapping    INDEX     V   CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);
 )   DROP INDEX public.idx_user_role_mapping;
       public            keycloak    false    224                       1259    17998    idx_user_service_account    INDEX     q   CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);
 ,   DROP INDEX public.idx_user_service_account;
       public            keycloak    false    220    220            �           1259    17704    idx_usr_fed_map_fed_prv    INDEX     l   CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);
 +   DROP INDEX public.idx_usr_fed_map_fed_prv;
       public            keycloak    false    248            �           1259    17705    idx_usr_fed_map_realm    INDEX     \   CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);
 )   DROP INDEX public.idx_usr_fed_map_realm;
       public            keycloak    false    248            �           1259    17706    idx_usr_fed_prv_realm    INDEX     ^   CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);
 )   DROP INDEX public.idx_usr_fed_prv_realm;
       public            keycloak    false    222            �           1259    17707    idx_web_orig_client    INDEX     P   CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);
 '   DROP INDEX public.idx_web_orig_client;
       public            keycloak    false    226            j           1259    18035 %   phone_message_token_code_phone_number    INDEX     |   CREATE INDEX phone_message_token_code_phone_number ON public.phone_message_token_code USING btree (realm_id, phone_number);
 9   DROP INDEX public.phone_message_token_code_phone_number;
       public            keycloak    false    295    295            �           2606    17110 1   client_session_auth_status auth_status_constraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 [   ALTER TABLE ONLY public.client_session_auth_status DROP CONSTRAINT auth_status_constraint;
       public          keycloak    false    205    250    3405            �           2606    16871 $   identity_provider fk2b4ebc52ae5c3b34    FK CONSTRAINT     �   ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 N   ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT fk2b4ebc52ae5c3b34;
       public          keycloak    false    3426    211    233                       2606    16795 $   client_attributes fk3c47c64beacca966    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);
 N   ALTER TABLE ONLY public.client_attributes DROP CONSTRAINT fk3c47c64beacca966;
       public          keycloak    false    3400    227    204            �           2606    16881 %   federated_identity fk404288b92ef007a6    FK CONSTRAINT     �   ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 O   ALTER TABLE ONLY public.federated_identity DROP CONSTRAINT fk404288b92ef007a6;
       public          keycloak    false    220    3453    232            �           2606    17030 ,   client_node_registrations fk4129723ba992f594    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);
 V   ALTER TABLE ONLY public.client_node_registrations DROP CONSTRAINT fk4129723ba992f594;
       public          keycloak    false    3400    204    229            �           2606    16800 &   client_session_note fk5edfb00ff51c2736    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 P   ALTER TABLE ONLY public.client_session_note DROP CONSTRAINT fk5edfb00ff51c2736;
       public          keycloak    false    228    205    3405            �           2606    16911 $   user_session_note fk5edfb00ff51d3472    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);
 N   ALTER TABLE ONLY public.user_session_note DROP CONSTRAINT fk5edfb00ff51d3472;
       public          keycloak    false    3472    236    225            n           2606    16613 0   client_session_role fk_11b7sgqw18i532811v7o2dv76    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 Z   ALTER TABLE ONLY public.client_session_role DROP CONSTRAINT fk_11b7sgqw18i532811v7o2dv76;
       public          keycloak    false    206    205    3405            w           2606    16618 *   redirect_uris fk_1burs8pb4ouj97h5wuppahv9f    FK CONSTRAINT     �   ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);
 T   ALTER TABLE ONLY public.redirect_uris DROP CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f;
       public          keycloak    false    204    216    3400            {           2606    16623 5   user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 _   ALTER TABLE ONLY public.user_federation_provider DROP CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8;
       public          keycloak    false    211    222    3426            �           2606    17008 7   client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 a   ALTER TABLE ONLY public.client_session_prot_mapper DROP CONSTRAINT fk_33a8sgqw18i532811v7o2dk89;
       public          keycloak    false    242    3405    205            u           2606    16633 6   realm_required_credential fk_5hg65lybevavkqfki3kponh9v    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 `   ALTER TABLE ONLY public.realm_required_credential DROP CONSTRAINT fk_5hg65lybevavkqfki3kponh9v;
       public          keycloak    false    211    214    3426            �           2606    17911 /   resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 Y   ALTER TABLE ONLY public.resource_attribute DROP CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr;
       public          keycloak    false    290    3596    265            y           2606    16638 +   user_attribute fk_5hrm2vlf9ql5fu043kqepovbr    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 U   ALTER TABLE ONLY public.user_attribute DROP CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr;
       public          keycloak    false    220    219    3453            |           2606    16648 1   user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 [   ALTER TABLE ONLY public.user_required_action DROP CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd;
       public          keycloak    false    220    3453    223            r           2606    16653 *   keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c    FK CONSTRAINT     �   ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);
 T   ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c;
       public          keycloak    false    3426    210    211            v           2606    16658 .   realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 X   ALTER TABLE ONLY public.realm_smtp_config DROP CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o;
       public          keycloak    false    211    3426    215            s           2606    16673 ,   realm_attribute fk_8shxd6l3e9atqukacxgpffptw    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 V   ALTER TABLE ONLY public.realm_attribute DROP CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw;
       public          keycloak    false    3426    211    212            o           2606    16678 +   composite_role fk_a63wvekftu8jo1pnj81e7mce2    FK CONSTRAINT     �   ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);
 U   ALTER TABLE ONLY public.composite_role DROP CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2;
       public          keycloak    false    210    207    3422            �           2606    17130 *   authentication_execution fk_auth_exec_flow    FK CONSTRAINT     �   ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);
 T   ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT fk_auth_exec_flow;
       public          keycloak    false    3529    246    245            �           2606    17125 +   authentication_execution fk_auth_exec_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 U   ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT fk_auth_exec_realm;
       public          keycloak    false    3426    246    211            �           2606    17120 &   authentication_flow fk_auth_flow_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 P   ALTER TABLE ONLY public.authentication_flow DROP CONSTRAINT fk_auth_flow_realm;
       public          keycloak    false    211    245    3426            �           2606    17115 "   authenticator_config fk_auth_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 L   ALTER TABLE ONLY public.authenticator_config DROP CONSTRAINT fk_auth_realm;
       public          keycloak    false    3426    244    211            m           2606    16683 +   client_session fk_b4ao2vcvat6ukau74wbwtfqo1    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);
 U   ALTER TABLE ONLY public.client_session DROP CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1;
       public          keycloak    false    205    3472    225            }           2606    16688 .   user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 X   ALTER TABLE ONLY public.user_role_mapping DROP CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l;
       public          keycloak    false    224    3453    220            �           2606    17816 .   client_scope_attributes fk_cl_scope_attr_scope    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);
 X   ALTER TABLE ONLY public.client_scope_attributes DROP CONSTRAINT fk_cl_scope_attr_scope;
       public          keycloak    false    261    262    3583            �           2606    17806 .   client_scope_role_mapping fk_cl_scope_rm_scope    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);
 X   ALTER TABLE ONLY public.client_scope_role_mapping DROP CONSTRAINT fk_cl_scope_rm_scope;
       public          keycloak    false    3583    263    261            �           2606    17202 +   client_user_session_note fk_cl_usr_ses_note    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 U   ALTER TABLE ONLY public.client_user_session_note DROP CONSTRAINT fk_cl_usr_ses_note;
       public          keycloak    false    205    3405    251            �           2606    17801 #   protocol_mapper fk_cli_scope_mapper    FK CONSTRAINT     �   ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);
 M   ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT fk_cli_scope_mapper;
       public          keycloak    false    230    261    3583            �           2606    17659 .   client_initial_access fk_client_init_acc_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 X   ALTER TABLE ONLY public.client_initial_access DROP CONSTRAINT fk_client_init_acc_realm;
       public          keycloak    false    211    3426    283            �           2606    17603 $   component_config fk_component_config    FK CONSTRAINT     �   ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);
 N   ALTER TABLE ONLY public.component_config DROP CONSTRAINT fk_component_config;
       public          keycloak    false    280    281    3654            �           2606    17598    component fk_component_realm    FK CONSTRAINT     |   ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 F   ALTER TABLE ONLY public.component DROP CONSTRAINT fk_component_realm;
       public          keycloak    false    211    281    3426            �           2606    17291 (   realm_default_groups fk_def_groups_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 R   ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT fk_def_groups_realm;
       public          keycloak    false    211    3426    260            �           2606    17145 .   user_federation_mapper_config fk_fedmapper_cfg    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);
 X   ALTER TABLE ONLY public.user_federation_mapper_config DROP CONSTRAINT fk_fedmapper_cfg;
       public          keycloak    false    248    249    3538            �           2606    17140 ,   user_federation_mapper fk_fedmapperpm_fedprv    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);
 V   ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT fk_fedmapperpm_fedprv;
       public          keycloak    false    3463    248    222            �           2606    17135 +   user_federation_mapper fk_fedmapperpm_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 U   ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT fk_fedmapperpm_realm;
       public          keycloak    false    211    248    3426            �           2606    17515 .   associated_policy fk_frsr5s213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);
 X   ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy;
       public          keycloak    false    267    3606    272            �           2606    17500 )   scope_policy fk_frsrasp13xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 S   ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy;
       public          keycloak    false    271    3606    267            �           2606    17883 8   resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog82sspmt;
       public          keycloak    false    289    264    3594            �           2606    17726 5   resource_server_resource fk_frsrho213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 _   ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy;
       public          keycloak    false    264    265    3594            �           2606    17888 8   resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog83sspmt;
       public          keycloak    false    3596    289    265            �           2606    17893 8   resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog84sspmt;
       public          keycloak    false    3601    289    266            �           2606    17510 .   associated_policy fk_frsrpas14xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 X   ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy;
       public          keycloak    false    267    3606    272            �           2606    17495 )   scope_policy fk_frsrpass3xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);
 S   ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy;
       public          keycloak    false    271    3601    266            �           2606    17916 8   resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy;
       public          keycloak    false    267    289    3606            �           2606    17721 3   resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 ]   ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy;
       public          keycloak    false    264    267    3594            �           2606    17465 +   resource_scope fk_frsrpos13xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 U   ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy;
       public          keycloak    false    265    269    3596            �           2606    17480 ,   resource_policy fk_frsrpos53xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 V   ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy;
       public          keycloak    false    270    265    3596            �           2606    17485 ,   resource_policy fk_frsrpp213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 V   ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy;
       public          keycloak    false    270    3606    267            �           2606    17470 +   resource_scope fk_frsrps213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);
 U   ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy;
       public          keycloak    false    3601    269    266            �           2606    17731 2   resource_server_scope fk_frsrso213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 \   ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy;
       public          keycloak    false    266    3594    264            p           2606    16703 +   composite_role fk_gr7thllb9lu8q4vqa4524jjy8    FK CONSTRAINT     �   ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);
 U   ALTER TABLE ONLY public.composite_role DROP CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8;
       public          keycloak    false    207    3422    210            �           2606    17858 .   user_consent_client_scope fk_grntcsnt_clsc_usc    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);
 X   ALTER TABLE ONLY public.user_consent_client_scope DROP CONSTRAINT fk_grntcsnt_clsc_usc;
       public          keycloak    false    287    3516    241            �           2606    16993    user_consent fk_grntcsnt_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 G   ALTER TABLE ONLY public.user_consent DROP CONSTRAINT fk_grntcsnt_user;
       public          keycloak    false    220    241    3453            �           2606    17265 (   group_attribute fk_group_attribute_group    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);
 R   ALTER TABLE ONLY public.group_attribute DROP CONSTRAINT fk_group_attribute_group;
       public          keycloak    false    258    256    3563            �           2606    17279 &   group_role_mapping fk_group_role_group    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);
 P   ALTER TABLE ONLY public.group_role_mapping DROP CONSTRAINT fk_group_role_group;
       public          keycloak    false    257    256    3563            �           2606    16937 6   realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 `   ALTER TABLE ONLY public.realm_enabled_event_types DROP CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j;
       public          keycloak    false    211    237    3426            t           2606    16713 3   realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 ]   ALTER TABLE ONLY public.realm_events_listeners DROP CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j;
       public          keycloak    false    211    3426    213            �           2606    16983 &   identity_provider_mapper fk_idpm_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 P   ALTER TABLE ONLY public.identity_provider_mapper DROP CONSTRAINT fk_idpm_realm;
       public          keycloak    false    239    3426    211            �           2606    17159    idp_mapper_config fk_idpmconfig    FK CONSTRAINT     �   ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);
 I   ALTER TABLE ONLY public.idp_mapper_config DROP CONSTRAINT fk_idpmconfig;
       public          keycloak    false    240    239    3511            ~           2606    16723 (   web_origins fk_lojpho213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);
 R   ALTER TABLE ONLY public.web_origins DROP CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy;
       public          keycloak    false    204    226    3400            x           2606    16733 *   scope_mapping fk_ouse064plmlr732lxjcn1q5f1    FK CONSTRAINT     �   ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);
 T   ALTER TABLE ONLY public.scope_mapping DROP CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1;
       public          keycloak    false    3400    217    204            �           2606    16876    protocol_mapper fk_pcm_realm    FK CONSTRAINT     ~   ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);
 F   ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT fk_pcm_realm;
       public          keycloak    false    3400    230    204            q           2606    16748 '   credential fk_pfyr0glasqyl0dei3kl69r6v0    FK CONSTRAINT     �   ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 Q   ALTER TABLE ONLY public.credential DROP CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0;
       public          keycloak    false    208    3453    220            �           2606    17152 "   protocol_mapper_config fk_pmconfig    FK CONSTRAINT     �   ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);
 L   ALTER TABLE ONLY public.protocol_mapper_config DROP CONSTRAINT fk_pmconfig;
       public          keycloak    false    3483    230    231            �           2606    17843 -   default_client_scope fk_r_def_cli_scope_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 W   ALTER TABLE ONLY public.default_client_scope DROP CONSTRAINT fk_r_def_cli_scope_realm;
       public          keycloak    false    211    3426    286            �           2606    17197 )   required_action_provider fk_req_act_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 S   ALTER TABLE ONLY public.required_action_provider DROP CONSTRAINT fk_req_act_realm;
       public          keycloak    false    252    3426    211            �           2606    17924 %   resource_uris fk_resource_server_uris    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 O   ALTER TABLE ONLY public.resource_uris DROP CONSTRAINT fk_resource_server_uris;
       public          keycloak    false    265    3596    291            �           2606    17939 #   role_attribute fk_role_attribute_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);
 M   ALTER TABLE ONLY public.role_attribute DROP CONSTRAINT fk_role_attribute_id;
       public          keycloak    false    210    3422    292            �           2606    16906 2   realm_supported_locales fk_supported_locales_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 \   ALTER TABLE ONLY public.realm_supported_locales DROP CONSTRAINT fk_supported_locales_realm;
       public          keycloak    false    3426    235    211            z           2606    16768 3   user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);
 ]   ALTER TABLE ONLY public.user_federation_config DROP CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5;
       public          keycloak    false    222    3463    221            �           2606    17272 (   user_group_membership fk_user_group_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 R   ALTER TABLE ONLY public.user_group_membership DROP CONSTRAINT fk_user_group_user;
       public          keycloak    false    220    259    3453            �           2606    17455 !   policy_config fkdc34197cf864c4e43    FK CONSTRAINT     �   ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 K   ALTER TABLE ONLY public.policy_config DROP CONSTRAINT fkdc34197cf864c4e43;
       public          keycloak    false    3606    267    268            �           2606    16886 +   identity_provider_config fkdc4897cf864c4e43    FK CONSTRAINT     �   ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);
 U   ALTER TABLE ONLY public.identity_provider_config DROP CONSTRAINT fkdc4897cf864c4e43;
       public          keycloak    false    3493    234    233            ^      x������ � �      {      x������ � �      a   �  x��Z�v7��-��!��%�	� @G7��+������H�gd;im���g$OwW�@�
dj����E��
cr
y6����_�u#_�~����;��9e����T� �F�Q��%�~#ԧ����j(%��]J��[�1�uݤ�7k����RY}��C��+T{�z���b��_�<~���%ߤoP:Kʹ��c�
#	R��,=%`�������������������v������aJ���ܽ�:Ղ+T���0�ɖ,Z���zU9�<��$1ek���-���<�Yԇ���U|�d�Q̡�6�YUd*�Z���.�G�$�{�,���?XX��P<ϲSM+��5j($+(@��'^;����'|��N���^��r��9!�:%o5V�o���f���а0(J�ЫQ�K�c�7�y�����?��SQ���݇/H�c��ކS��R��!e��H6~]^W����;�� ��2���
ki1����}��>=���\��Ã|z
��;�'ͻc���� �J&xV�A���W���^�2T+�\� V2�[�&�eqw��st_����b��"7d�R���M�*���i<��!�g����ki���#
�-ר��������|Ɔ����$)m��q�:8�bq;���f*;E	_��O�{΋:��/.
������p�$a*]�sna4W��ZO]��?�=>=��탿�R�X���i�� �zO!2i�-�����FyM�B�3�0��yA�Z�Xil��Il)�R�������xN�VK�;�ϋ�য়�a?��"���s�Z���� I2j�+��Vi?��K/�yul����{2�a�m##S
.#]�y�2x~�)���r}p��}ǭ��Y�W�N���8��ϴ����?�dᵪ�
��j�CX
x������*��*�*P_���O;�NrO>>������s9.��8~k$[���A�������}he��A���On �A��&�#p����WEuVDq:.̔&P�����Ȯ�U�V��z_;�&�- �U,[+"�XE���[�tEx.ͣM��)�ؖIoir +@rL����;M�uBG�&�[�i�c+�GS��]P��]��t�b����a�ۖ����@��^�r�o�y�ir.Ff��J|� ��g��&-/1�x�$��t:Ɗ�*��F�.`"2��j�X�:S_n/.�6ކȦ�:S]Sk,y����?��众�xQH�)�Ad`�$�l��A}�������[����*u"4)7Z���3@��q\J9[%�,9�R��:�*��N�dJ��E����ǝ��M���xP�s�%.h�L\v�+n�`Ih��{6�Y5E^�E�-e@��`ky�e���m�W)�R�������`���9��:���=-��P	t*z;
�RU�0$�t�Q�iA��4@���SA�Bss֖UD�k\O�����|���/�{η������Bݑ��z�@�9��X�-�I&��A  ��h;�+%�%���� �Sxk1F}Z��"WiG�\%�u@zs{�4����ajx��� �r��� ��|�n ���w�~;����`�;�]+(E��] 0P˭j+��A���=|�$���E����(�ix9�`�Y�C]�@	M�R���L�ט��O�����|�-8��Mp���)�o�d�Ǫ,E,->����N�K����)��Ʉ���h�	����E7��PiE����4c����wu_#�O�p��\���T�n�7�	�����a�`��RnG���	�w,�r�L��"�kKCOT� �z��������B�X��a�_E�t�YzOp�!���@���;��r���� ��1��͌��ആ6�����W}��;x��v%ztR��-����k�����CO+�� Aeh�L�� 0�P��!@��zn�v?ê�3xq��-C5�:|'�us���^��Ø�����"4��N���_�ZU0,��0��G$��OkU؟Q��=������A<Z�����	�@9�zIk)S�O,ԑYޠ)Z�X�3�C��5�
�Y�;L��y.�	*��Gdt4h��u6T5��!t��^�u4�Z����]a/�:��At{p���`Q�E�A����m�a��ցk3.h���ʐ+:���yM0g�Y�ҲG��g���ӂQ�Q��=O��q���>��$ߍ�Q���[x�q�́(&4�,H3���Q��ӓ�=?�&�����K�F!Ŵii���-�^�����Cв�zd<Hx���<Ѭ"�Fq��!��.mm��0[��PO�hr�3���[���I�m��2\���1qE��;t^�C!{��n}@�{��F�ll�O%]G��Q#�� ��d�:f}������A��zG8n'}�� |B�|%p+zQ�#KjR��~���vM��7x<h�� m��L���f�n�"�q2�ެ���A3#՘�5�r9
�&������H)]�&+:z��:[Y��U���V5�4�����*Vvl�^�d�3*��[c�a�	j��7��*z �!J�e�� ����y��ޛ5��@�B' �5ޓ�1>k�#��;�l-ڻ�|K���5Ĵ|q-�W{�Gp��V~�]:���]D�����T�	|��qzO�!xq��o+ݘkǓC�B��!eo�E���(����/�e�][̷��c����؄h�m
���)�l3"���]��sY)$B�b����N�\��iȋa�!���Bvm�z89�U�;-s�0������Q��PEq�4�뒢��Z�ɪ�N�ܠd5*�A�������j{@�s�(9�`򀛫�g��HZܳ�lJ�K�s�~�}����?@���5xo��gL�+E��7���
��K��1+�'�} c�˙�6_�yZEx����Jۉ@�I�	��eM��<��&����B��s��gTpE+�vH���o��ׄR�Kn���h�u{��B���a��gK^O��gܧ0"d�V�	-Prs�7g�|ﶢp�}~i�M�ɨEju�����^7�����E`����w`�� \��h����{(����/�����~���eK��B���)�f��ݍ�]z���,�WZ��:/H<j�Lo��^C�'c�V)�c6���g�/�EU����fD�W�'Z<�ڷ�3Dy�\#���c�M�puU\1����.Ι�Y!	
/�22<�=�~����%�ՙ%��J���� �����g.�g���?�g�Z�eM���.V3�%/y��jZ���7����yvh�YѢj�-��W�����L�S�~��Oǖ��>ٜ���{){�a:#�ưU��}��	���N Ӡ��B/��@4�{��i��C�؞"ʰ�a�T{��4�w�/�>�~��� 	�T����lH��u-rf�AD/�>]���'�)�Ѷ�߻����] U����S*�a������]�}��������H��`���6�8~��?;Zt���z>t���Ÿ�݇`��2�z��B)A�%��n1Û�oA����Ѣk��8t8a��8Î%� 7[������Ѣk�9{��4���{��^�O\�j��]�����E��&{!�u�-���[��!��l���r��6SQ����O�{�Ӝ�i�����̯_�������~h2      `   z  x��X]s�|^�
� A��x�M)Q%.+t�'�����-s�����і�T��H.=��%==�3K:�:�,u�^:��̑��*�1��!�!���=����L{��n�K�.S�e���BɎJ�TX:OUR�I*�}���8�ɩȶ�o�eX^DC��:�ZC��y��c��r�2'��ͻ�����R\�~;��K1/ׂ�/����ͯ���.�l�VZ��t%Z�H�icx���2|�@��m���i#~����-��XfQy�݇i�bj���bڋ��fځ7@<����uȶoK��u%骳�Z26[)E����Բ��m��k޾;��}���ͮ �����aϚH��Eg�e���NS��*����*��$ΎH�|#R3��o����Td�h�
:�:�j�v|1���O����Y�רm+Z;�����9F�n����e���'�w�~gC����z�� 1Y%��8�K�&���E����~8�r�����H����y韧�o�*�o?��r�^���U��)AzO�i�L�x���|A�
���_�7�*2��u;/�����g����w�o��gܭ��RkǦ����98hMWͣ����~�����T���$ �Ϳ3bt�K��CMsA7(q:��\+5��M��"P���|1m�ץ��]�VP���6q;��Ne,w�z7�����f����S��Ir���L�+�2h���ߕ�LW��I��UpMpݴL��8��H��>�E|��v ]���W����m筼�rT:m��D�����Z��\�J7�����Y�gF�
_۰xs��/���K:ȳ�'-︓���ǰ�a��?д���䢸��gC(Eo��r
?i���1C��κ6�tb7�n#>�nj���J~D����Q6�h�	h��f�V5$����.��ڠ��m(p��uxw�� ��S>p�s~��s�2Ps���4�
���u��$þtB���qJ~;�jd�  �τ(3:N������ȶ
�.��ϯ��x��{�~7�	B�9�o���J��h��	V��X��dr��blC��թ��u��@��N��P�>�A4m����ޯB;Ҳ�`s�A�djkC����Ϩ=>����KJ�H�Z�Tr��Q�T�Ԩ�gr��@�h�(�U1'="ſb�rj�K�J�p�݊���ݗÌ�*_�+]�۲�
C�Q$�xs��Ii?j�8�9)�}F{������(�b �`����j��o��V�&�6�<��i��'h�mC�Q�a!V+���
���܃��#0�g�j,*#��l���XUȅ1��BfL��=R�����z�f�2�%��3z��AW<q����w(�=��G�ЊuB? ?s-�!z,�pnF_ړG�'x8Z�VE�01�9m!H#�p6&tY:���B���Y��I���Z�ɓ�(K�^T刚o��p�5�'O����&~T2��[H�44M���\�z�T!�#�h��a�.��)Z^�:oMV*�MA�%��B��9t����L ��?z�����ѓK���:74�a�y$�U�Oz���?��rp������Z@�SfD9U�~�7;k�j��X��
�B��N�7�w�}�3�50~}��ŋ��b;N      _   �   x���AN�0E��S�Fq7�]�؎�*�(3p}rl���O�ъM�΃
f�adk�Υ]��<�k};oy���k/uW�{h��Q�#	.�1/���6�Šq2Hk��}�8����{��������&�{���t�́����ƨ�f!����s��0��I�E�E,U�R�g���(5���5:Yv�*�?�����eY��aq�      b   �   x���1r� E��ދˀ{I#@�0��?��l?Y@Ҽ򼻱D���E�s�!����
��@�[>k��>�����j��K�s��s=g��@��(�8R���G��,nQ��,M�޵M�{�~Z1�2�f����ƣ>�j�Z�
��ܬ@��I	>i��F�L�x��yR�g �)���N����f]��jig      |      x������ � �      7   �  x��Vˮ�F]�_�EV��y�,��"@v
���#�uE�%�E`��s�[�0d�:<�<"U#1�`�%���٦�-f	��i�Ö��0
m��O���i��1Sq�����5�H6�9r���ˇ��Y�n���(�	w��c��:k�W�VR �8@��BK�v6���%XI�w�&YP����c���է#�;)�?�n݀����t���ˑ��'ȯW�|�����t����������7-9�
�e�jB4�}�g�~�o��uN���ħ�	�0Շ*��l�T��%����d|��n+8B_�2W��$���#A�D�"	�uJ�,�
�<�����v����r�ܒ��G������3���M��"B�Iպ�F�t�T,�r��1�f}��x����74ߠLV�B�(XLV7	CIVs��'�5�By����@��&ߝh��j����)�j/�p�5�4�����j&�4���Q�!���*sI�G�]��Y5��1b(�Z�%�z�\z]Q/J!��.���h��
�����g��$���!�'����颫,K�J����t� 6�7����?G�T�[�h��K��k������\�i��?L[:W�o����,4�Ǟ.g�si��%�y��s�����26��%�@q	^,�I�Vvӫ�2��6����\��%&�,���cj�K�G9�G�z�x�^�K��e��	�
�o>��::;]D�:�A[��_��ܴ��c6��_W��7��P�      N   �  x��V�n�0<ۿR,!����@�$��Er�H������"��4
������RJ+I&��-��-�$�R�RfC�p�Yt����b�Ҏ�g���t�r��Ϲ1�ZL6	���
��٢���L"��v��$i>��UYw���%���P��!VD�	��6[��b��jmE`U�`\Ȑ(�ؔTcp>�MdL����m`7�� 58�R���~��f�Zǁ�#�t��ac
�,B16hNQ�+ �.� M,lw�4�n�L:NI&�
��
��|���pڒEn���YP���r��M�"w-q�Dy�Y��s;�bn� =3e�&��J���}Oݛ���i������a���J;�;|\��~za����Eހ�|R��Sˎ��al�j��g���#s����Pk��$f���-<���t�N����T�D̓B�Q�F-����14�uH`�y����EG)SIW��������o2�m{��.�}ۅ�L� u���V��}*7��G5��n���_��2��.�^���ȬP<�������mq^���__�4�d��*.��4�mm3�$Ұ��3���_�N����eQ�y���y������q�`S����f�?	%�(A��ZiT�'���p�b�&���WB��      �      x������ � �      �      x������ � �      P      x������ � �      p   [  x��VM�#E='�������?�!��Xq �����^z�G�������Y-�Y��K�D]����=�S��r���BA�^J�Ҽ��-"�8�;$��a�_X}2�*1���lcZ�\�Rv?������w�<3�v7NG��@�-3\����=<��T�8����y(�
8�ѹ�Ri�.�����:@�|����tf8�9�ʹ��՞(��N���	l�%���yw�.2N��k?պx_iėb���Z���:I�mø��MP<T������PEЪrN�X�" �{t�q���[I����X�2tv
&�ZM��c�LR����2oԑs���������]����G����^����A����pw��,��p\��{L������Tr�t2���mr�P-Y���r�����:�1�[ �iZ�Zux�zR$i��5A�*�����mNܴ�����H���
�p���~rj����~��볆V�☠�D��T��a��Lѫ�-آux�w��|	��2
���P�ZYx���'_���EU�A��B�����"��1b�bbK@�>jNzՓA$4�%̯
W�!�a��j�jƢ���
0z��ǀ��g2Q�]*�(�k��5jM���k�s�^���_��q7Y��S)i�!�zbQ=�Y?�'C�*�/1�W�L��2��-4�"��|泫��b��pk@0V�uHF=�kg}�\�i:D��w�˂Sל�5y��48u�F�!
����q�l"��J�=D��b$�"Q��6��`Dc���������Z%��FR=qA�뾡?���E��d.��-����gt�-&`oT�EæD���n��J�?F�f�h����~�7!�{      q     x�����"W���s�:�ZN�'�S����0�-4�>��,Mw�N�@��k�[J��jL5A��!*(���������O�����	�<\���or�nt9�d��\TOǳ�@$��/ty����*�?��z�ۏ;,�Z(X�B#Bk� ��()�����?�~�����>�йPϑ���+�/�Un��X���b��׋O��u<����hO^~��o�?�����eP_�=�=h	�:�-aS��C>��4'k>�Y�E��CG�F Iм�%!��9�����2_��|>�a��z?*���� C����\����%l�a����<ن�Q-�"���'�m��_�J-Gq�����b�W��jMO���#�s�V� ݓN�IN]*��	+�5������ $QL�"vkӔ`�`_�+��)`
��]�!`�IK�Q:	!{��f/@�>e��4 ��ad��UY�2UZ�1X��3���m�é���S�.�6��j�5N�!��g�,k���u,�<kTKՈ6��mA�^���{����@X�6r®!ێ�"S����j��\�x#�>S�~(�ԭ�b��F��С�zq"�şl���g7'�ͮ��lC�^ �8�vv���j����b�tA�+�%��b��3b���B�A����dd�+Ff��ҽ/�Sv泝��B�]��d�0���V���y���)Ƌ��w-�ֽ�?SE�f<ͤ姃�2�}�7S�-�fN�G. �٨5ۑ-��M`�̓Y֧���I�p��v_ �^��      �   b  x���Kn�8@�q�6D����P�����kw �|cS�	~H.Y_�O�M�=M��,w��G���~N~��69�j,��F��{*��z�����I��.g�"��K���ңr랯���Y���z�M\Ǔz֔Uw����-O�h뎼n?U��#u�*���:ǝm�2h�,��ߑ{<y���b�����&m�YԳո��:��Ը�jg�v[�a?�Zi\W�C��lc����YZ_�����z/w�!VG��?��w��sJ[v|���lœ�*�~���oǭ���4�I5I�k1��e���yd�E�Y�VQZe-f��U6/f��UԂVQZE-h5i��S�MWji��k�d��+���UԂVY�YE-h�͋YE-h��UԂVQZ}u�>�II3���e�>�7��[��F����Z�*jA�l^�*jA������Z���Gt˒�L�y����as���9�*jA��Ŭ����Ŭ���Z�*jA���6��Qd�f�d�6)ݞ�\B�R������Z�*���Z�*jA�����{]Z�OZ�X���b��Jw�����{xw��J�)�6e�s%�|�� ��=j�3��z��wl@�gl7�v�޷��棭�vr?��p�e�n<h��Qh%�K[3ޥή&IόE)�5V��e�X7�a��,km�HƓ5��,&�7����q�֭-�$�������kKKӚ%]��tW�Q��>��>7�qK��}V�9���w����:��9���W��z�-m�,�.���R�C�t�d�]_z���DMy����T�7ZZ���9�7�����Z�*jA����y1������Z�j��؝���Q���#�����&��Z�*jA�������Ŭ���Z�*jA�3&oD���|�8�%��״����ҵJ����Z�*jA����y1������Z�\5�e�!=���}{\���y,�w�s���JZ�\%-z��=WѼ�JZ�\%-z����ˎ����`o}_Y�N�&��r�5V�Mj��UԂVQZE-h�͋YE-h��UԂVu�Ql&e�X_�e罘L���B-h��UԂVQZe�bVQZE-h����j�ev�Ż�i�O��F[n��� �����Z�*jA�l^�*jA���������߿��l      r   q   x���1��*�q����V@�!�@��ISE��h�"�f�����(%��`�e�&\�+ϴKTiý%ZĥA7�����V�����{��H�B�Xw���D��g���9&_      8      x������ � �      e      x������ � �      O      x������ � �      ]      x������ � �      9      x������ � �      f      x������ � �      �     x��X�n[7]�_��or�E��@�"H��f8�B$]UWN��\�M+�E�
��A�9�סZI��1���X�T�(�rf�v��p;�-�� fB�Td���E0�F�bȕ�8� ps׫OrǛ�>�F9|^��+ެew<��z<�v���Y����������?��M�aw�n�++6%v0���%Vݖ�G��(�7�nT��{��v}�6��O(8��z)��"		�E!"@�<v*��\�?�n6�_y�����Hu3W�8a^L[6\���6�4�67UU�#���ey"�?����<�-}������,��s�T4m��KM�c�X)�f�m6���}��q�a�|K�����2��t�����W����<����E3��t Qp�!�n�W�'�S�^(�����o�(/'��<1%����L>�ր�D^S�o�7
_�~��ʹ�}R��y���t3F��wr���l��f����FRH�K��iB��
.#����0A汜C����'�����nr�w��_��I�@1��XKȐRł9Ql��Xv��=�=M��k���4M#�O�@L2�K侸���?�<M�%Y�*��Gh����`#sr���`�!Okb�Ch�6rZ��)��	�Ø㣎B��Z��C���-�j�_ס�X�`�:��Q���{��zJԏ�T!�6eD�M�b��X�􈣘��,��B}��E��F�C�,��(�Yh�h�a��u��H���^��tj�.Ԡrj��j�TM@�-<x��bx�7˥�������Z���l�!S|׷Z�_��<�g_�
M~L-{u��t�ڥ\vIz���?��E����%�:��&�h,�c���a��k����겡��Զ���E���%4D��2���=W��fm��  �#to#5K���Yy�Y7N�k��i��+�7ӯ'6����D��{`@�}x����,Y�F)����h��'n�ǜ1=�γ���mύ�%��dU�	ꪚ���C \U7$M���<;�K��ܘ?����� ?�xd      �      x�ͻ�ңL�-z��*2�����`B��Av�ڂ`b�x���kwW��չ��6;y�I@���|��PJd��3�i`4��X�e9F�P��,�� I��X�b$Ie����0à�@��s@��4݊�Y�f�ް���i������<�$�#&PD��y A�d��?R�� H!F�M���I�1�rď�{���6����zO#���E�9C_���`�׹3�`x�p�e��b F��B��r����aSe��c���,8Kr<�S��X��� d	���4�,��$���2N�!��<@n h*>a!&pLB	`������n�`נY�>���u��l~��`��*����o�I'���(ȵ,F�)r2NX����i*�&t��ׄW�f͟�@�f���O�0�<�x�1�I�$KȄ��;�M�����\�T��q�����0�;!�,�,�{W�-@1�g4	1���2�$$��A.�9ʊ��|n����I$d�B0gq�,�D�@� G����&Úꏜ�c���4&<��$I`�D1��\���A����5f����&�%xV� M� �R�q��X!OX�$��&~����h�T�Z�3�='�#�8�� �(��1�@ah���$�$$C08�y 3C��|��9�b&M2�9�g?^`���>�$���d�14�`	�Y� �P(��$���l�d?R�2��q�&�(X�n�&Y�('���Z#���s���S(�X.CC@a� @�.A�I1�xT<hA��ɲ�sD�T�0�M���E�K��2,� �Q�(�~�	�,�h��Y��̿s���A�N�4B7�GQ����A�Q9E�C*%�(�#$9��$E���;�}>���4�9�N2#i�/�(�Жh%hJ�I��F�?Z@2$N�Z��J�� Ƴ(�T�!AQY±���SPB��0!��h-�%X��\�fOi��mv�	Յ�$���81�@)�N@H��跭ßPQ��R�EH��1
a�r8 D��6�	&� �b����[̷� ��~�cՍ���A 8c��y��
��9Os8����ڰ��sg?<C�ɱ���+F$	�+�P
��Q��&E���_�0��
�)�a���eY�-Y*���}��Z���9��JV\ݷ&*��r�Uqc%p]ES��#2�S	m�vW[1h�wWkw������پA��=FQ��%���g$��h޻(҆�����)v�N	��0����=�����z�t��d�;�`w���s�n�tf,�`�Ote�U��z�����D��v�1'؅��A�/�~��A��p�c�IT0��3�t~��#)��x�O?|�9BL����ޣ�8�g�	�!�G�]��6Rzն���YX�Kw�?��1�����蓫�I��^��{�b���pH�yCJ��JǕ��$�>�24S�F<��6"�:GL ��d�ax��,͟'�}��>%��J�>�~�&|����O��`w�)K���(���KE��6g�{�m�U/�+*���h�� �s�%=3���]���x�
˹9�r)���iN<x�1�/	�gUb�N���~��Z9?���\��)��B-�[�;n�-�W��"7�3��+���썇�&�F�J^:�
��|h!��7W�R�d>)�v���tn��ڮ�J�x�5Իv��[�������EW�u�t��Z��]���ZֺQ��ӄG-,wJ�ɒ'�c�<z峚�~�����0_�����~�!|��Y�"m���߈�,]8������|%�/
k�����k��*�Dr�������4���x_���d�X$Pq*e�_�
AJi3�|�Z�
�-�)�U��:��H����+���2��R�v`���c�;ם�`�2��9-���<�T�	�=�oX�>@4l<��Pe�}l�W:Ac�m��w|J��Z�G���a#�{����!��N8&h�U��t)�(^��o4�w�,	&Ǔ-���Xi���g	
�ٻ�����M.�ִha�ٳ��6�c�<T �٬�4���X������5�O�~y~����*8������L��ݟ���H�CIa?��S����8-���W���OX5����j(�+J��j�֨
�����dCt�Jd�^d�H���仡 j\N4K�/=D�\"�I��]�>��=Ç�f�K8��A�V��Z�n9U�����sHUAx�^g�����3+��:�˳x��>��4u���!����d�������?|&9����p��Kۈ��	Q�b{�mj�~2'�>��c=Vw^���D=,�ٕ�D��� ����F*����n�p�.��-ά�M���'���t��ܵ���%^�q��q������Wɓ�]8�Y+������(��E����"-��#2�[-|W���i�5���<�$���&�oc�)�+�)(�/u�%K>B�����FTfz�	�V���hݩ��.��ԫ=��Hvj�
��W��Z��ۡ�;�Q6��{݇�b�%?��Y6]y�{�c-���g1���c6|�_V�E�Qr��4��}��M�J��6(��WT��$�N�5?��ʖ��<�޼���\��b��l624�>Z������8M��{J�iE��_�4����x/|�LB��6x�`��D���g�`x�__�CD�"o���܊H:�)�??yn�͠��5��Οm��o�cu�[���_ڱ}�F�WB�7�,lx��<]�q�N�Ba�v�:�>�d����13	<�Pv������pC���>����4�M��ڭ�R!ϻ�����Gv}����Bc.s��.A��}t��E.���E�2+�"m��0cd�s��
̦;�~���yU4�,i7G�;��,������8O��6%`}�����.cT\ʳ��Ƥ{!~�!��Y������}�7��EE)=�b���6��eq;���qw��n�̆� R�Z��V�]=d�S�n!~u���j��I�;0�[ܠr�j�$L`K�%%7��5���Q:t�I�|Z8�Ͻ�n���<���&PI�4�5�vT�m��1�DH�SI���W�#���X�&Rf)2F@G���Үt�.QHFB� �\��IJ�,��dd)�,� \Hw�=$�Y�Pߍ��׆}V���$�)�	�*!�l �,F�)�f����92<%���Д�L���4��)` ��ڔ����C#�[⹥�lRQ^b�X�Ǆ�c�#�RA��<�gi��7Adt
s��~�BB,��>�� �,F2 �����&����U[�IS3:ǐe�����^�HB�s%p�8(h��2��7O�Q����V��<�MO���G�"Y�C���oDD���rω� �ѓb���S�Z����?=y���!�*��n�V���%i��julT����<�{˻��!O������:���ky�Y�Іr��ެ�K�{~/��v�O6���Z����=#�~H�@�^*�>I'_ޕ�*��e%k>?}�.���oq��'Ǣ<u�+Υy<�q8y�+��|�:�O�k�v.��i�7�D�N��t���"�xZ�F��G����6e}E�v�q�z�	&kzD�4T���[���ܛ��a�9���ԡ�q��b�f���yMȊ���5��9�8����:���7*�����'��Ϛ��Z�y��Aw�i����q��+��2o�����q�)1o��" ���}�d|�ϚB��9h�n���˭ث��覭��&z��<�35S����O��+��;y♫�KKam���F�q�݋'��:=ba�7��zG���S#Z���=<u��pD�k�˚/�SoI0=��o�Y���ɇ�@P���>B�X�qVx��˅Ze�z}-/�G���Ǘ�{��;ɪF-���'��.>!1�Os��R�F��PxB� ~-���3�s�w�7G����m:># ��y"K2��a��6����&C�����2h�%�ˈbf�CZ�s�-x�����fj�$i-�-�����В!��j2�;��q�g��O{�޴L?�vx]ь )�H�獔��}���9g    �R��u"GI�����%��,�g�*��J����~	5<ms��6^^:z>]:o��Im���+��z�g2�ٚI����-��~��O��>e�DnE�.�)�*D�J����g�0xS=�I�]���F��j��Ee+�à����
�&�Q�%�?iq�ϱ�k"?��]���2�f)<��=�`Y�(�\Y���9-�*P�
�����jK�n*0�}���?�R-���w�LG�[�C����?E]�Y3��_
��C�]�Y����^�� �Ud�gj>͞��rZ�g��$���i��1��'�?l�J�v�8�H7.^���sm�+�<�x��;����R�'��{��F���E�	�k �Vwfh�O�3�����1�V���������s?"P�̩��-�T���|u}�U�x�t-_����2�:�)֍[��/%<��["�c^sʍ���t���՟�TR�HP��H.|�ʌ�v[����n]�J��'κ�T��ġ)�� t�g^\s�mיA�&&&�S� +��a*Ƭ�H���މ��?YW�>~!����|oD�eS=z�u�x�x#��3y��ޙ|�����SQ�r��R���@u�� ����R��h�Fe�:1ޡ�^ �Uz.3�_&n�,;�1�����,A�Q5�(0o7;��%����ao;�u��XȌ�b�Z]�]���3��{<��wf��@ϴ�C~x/G%�Tր8���UΑ���%��<{I.~��AG���GQ'�И��{Z��$<��~��C��үE�lȻ!��أ��<�3ɨ�V����GU�=u�omE^�5GTҮ3Ϝ;yd/��C��������q9��ev6Yo�٧���g�WW�`�%(�ky,
�y��Rj�L�M}r#�<�w	<�Q{Ϲ�Nq�1f�
m��;�G�ўJ��� �����&�ؼ����
���K�}ek��]��"�x_(6�����+s�W�# �����j�����W��u#�J�g��6^���	q���l�hG���r��TZ�!�Qa���J�M����E�@.\�ֽQ�1���)(���_��3K2�wT^�{$�b0��,��<c2���QL����
�&a�c���X���!�30���������p�}7�]zd$�u�	o��.��g��Ѥ�������s��J%��~���Z+�o93��\�Wl��������o�R`UacI2eI�N�5;��SH4�4͠:��0��
z�T�^`��$Mѿ6�肓G2�OY�3d�	$Cc�|$I&�p�5ǥR8ԯ��Uh9i( aA��۬A� ��� �h�����Q����HX�>8>����3.0�H����s��92��dWN2X��.��&8-�o��_baY"g)��Ш���b�!�Dñ�^�f��?�! R@����0(R��8Ȕf�9R�8�a �oc�i�t-K�<��r�������-�=!C�%L��@��a�.Q8���L@����r�~8����h�l��LF	��=]���o��L�$+��~�c$A�<N�y��͎���K��2�B��pDz�'��s��H��	���a���M3�|@�������C��TNp�&!M��G����=h!|ӏ%�g��� 2H�,G�d���0)@�����S* \J:�&� ���6����i���9���$���	�R�T0i��H�{c��u
A5)(�8�d	�	
IJR\��̈́?��y���xNB�	L�����1T&��(98�;Z@)|aJ�#�`�W��(șhu�A<	�)�y�22�x2�?���
�ES 79�f#h�j5
��?k�sh2�8*���dȿ8`�?��@F����Yp��cN�ٌ@8C3$�%4�`8�bH��\�����B"i�pir(|��,��uϩ��o{�19��w@����|K`Q%�x�H���fǿ�=h�;��仏��="Gȗ�T	�$���?�qY ãp��Ju��y�$�!�A�@H����O�	������rH
�М�$4�Q�
�o	��z)��4��!>��_����A�&!HP0	�"ԃ4A�9滿�B�H�$�(㉀�,��<%$�3�F�D�ђ"��	s�,Ea$�}��1�{��"P��i�#���)��h��s|J�X��(�
O�o����	��ڰ��3��V�:b�m;���kg�j��^�i��e�������#(-I�H�3���+�?��x7�3��ŮD�c����K�;&Y�q$�#g	JȔ�Z�*NJ��f�?
�<%�{�b8��8�c�C��
 H�4�"�EP/ ���&#�~�*���X����8D��α	��0��E�O1P�B8B�G�� |���a����N|Y�!�.�]�����
��c�~�sׄ+��J��\.��dO�x!_48�?�kwE���g�(YU����\��.���t�kV~���$��ܙx>*������ٻ��jl�o_5������#�ũ7ΐ�@e�p=[�,gA��u�������6��ACsI��SeC/� 1��5��ݺ���5Z�Re�_��f�3y�X�g�"��L�`�����A%�k�U�	׆h=�]i{e�#�q����@|�';�j�3 �ۇ���I\��v��pm}�*ιWBJ�9�|R@�(�==%��= �p^{���#5/tL�T��Z�|B�{�o3�a|D��E�n<'
>_�.�7�*�7�U2h�5N/�;�=C��u�)���6�+��`%���"�,8t�B�O�~�05�Z�H�q[C:�J��a#_q�I��y�Y�d�~�5����a���X����m�p�ә�������~φ����^���R���_��q��' �ֺ|���[r�ު�?E]|>�����6��5S#�M���C�tI��PUۧw�|?�49�
q.��i!��sao�"�Ǫ'�}7� �M|�Q���Gi�����c��{V%'�ŧ��,k?�̉m��y��M��u�>�e�V�n䞒}*���t)�U�tgcL˱��^������}z����^���ǻ*��2ȮY�E>���rY[/!�����|lpM��!�%�wǖ����T�9����<1��Y(�0��M�7�� |R2��~�e���׎�績�Y��se�ܠ������B5pO�^;g�b���3��������Ň���jd����e8�w_=����*�|\�Jޭuu��c����wǻ���y��!�%���?�&��F6�d���7��m��Յŕ�{{l�
�>��g$�fb	6^�������<�C�y$�\���j �-�®|��H�P��ng�e�Ki��!k�-̨�}Th�W�K��
�sJ��Tg�|e�ltWZ��˨��Q%��57�$`2Sw#�,+��@�ee�͎~YE%�m�[j�C���Fw=n�=��)x�=�Z�1��y�B�H��X�i`?t{n�+�h���Z7�;~�vͼ�Cu!�T���';|V�IE�1ҫ����3���GQ�f������w���CQ���������E�Z}�/�0&�>ώ�X^gἠ���s����4������nN����kt����#�q��@�ZhTޅU��|����[��/�b���N\��w,w]��{��^b��'����������?����;S�H�Ĭ}�M������t[q�)]�߳�7����^@Rv�}:R�.Ȟ�1��p�iy	��aho��p���s����.�ilR�o�K���>4���z�p��3읬�ұ�v�I�����E��f����0�ʾ�!�פ??���,��>4b����~���'�'}_8%�zm�o�oM:*b�U����IN5�6n�(`F�A�_�(D�Q�L�z����z6^���"�����(ǹ=����]\�0�]f�o�˪���.���o�0Q]|���C��_�5�Q9.���N��WY��U��ޣ�]�"��Qr-�{ש�c�z�Eħ�Ѝ�ǥ��`�[�ݎ�th���{��0�@6��:���IĈ���Ǫ � �  �\��S)$aޜ��?}���H�i�⌰J�Q6O��C�c�bR�(���L� ;8�b�����O��/G8z��2n�p]*��(���Q�i{/./<��n�*2 /<�Z��p��jRg�YB2�'��l9I=]{I���k�F��I�K�/?S�IhA0
H|�)�^H�g<�I2���4D��� �&�������TT"0���Q����� $���{�Fh q�I��d�r�$�(���b@#s_��$ #h�A2�)I�U� H�T��92��X
K6� +d<����?2�n������4��E�1D��<Mi���_���7��!�P�.�-n�ii0�w��b����������x�cp�m���I|��f��m$��c�9�q,�39��� �HY"忝�G�K�,����ĺ���_��K����2���j'8�|)�$�s@���;��,��,E�����2�� M��	G�#��a��r@���*~�|�I9��ߗ�Qhf՛HC���T>��v:N>�>��y��q�]�<9
��'�¶���b�T���Vuݧ���`K�;��Mƭ:���v|%�o�X9"�z���8I��+!nR���wsf0^�W�=ѬܹWyp��Q�$��߇C���nJ�?��jb��B� �N���O\[�A)ǧ�#��C���V�0� W���͋\>u���Y,e���i�xx���:�c�c^�Z|�S�j�<��8�����p䝨�4�U�}�2�<6�-�N�ח��rp����,0Β�>�����{S�{����R�7���H'/^�]<�7�r��ҕ�c�Qj�w�h=^�x�&H��XO�Z8�؋�T|�\�-�ȐkG�����}ƕ9P$�����Y���s�F4/N/Ș8��΋0Q6��;�9^����?*�'���e�b�������:}��[v`-�o�^��� ��^�W�-oxTt�7��K;�C,<��Gz̊�,mp}mٓ�k�����:F�3ED���W\Νө�i��忞t����T����/?I����E@�q���y�27�_F���cp�c���%
�n���E
C�.Cū�#wʳJ2�3�W
���^4�L�A�t����%Kd)�-H`<�V�|P�I���v�_���C�����R�3��#ˑ��I�}�\p'p�v-7z�����Vν;�E�o�i��z�W��N,���֘K��.�)B����^���Ǆ���};0����K����'^I8I�ڣHD+�>o�=�gÚ��%F�md#pw&mA�u�����+E3[��%<��b,�%�����(�[��̶���(x�L��D)&����c�Ԩ�,�#�D�\�{�Ե�Im �L9�c;��9O�`�wx���p\�>�_O��)�O�2L_^`k�1���Y�L���\�Q�`_�����؟����.�S��)A��\��ٯ��T;:b�!��!�W.�x&�������ҏ�^(���M��Ɠ"lR�CL�5��`�r+�%�v�<����fҴo��i��Dy;IU{Ak>�ڛ���iIƛj��n�U�'~�8K.����XS&�z�#��������S��7�$��B!X���W��=�ٯU="��vT�}XM��Wޝ��Ze�}�Cm����O��̡���Pp��9�'�/�-��a�h���ĕ�<�z��O�X8I��LC V�>�6�li=~5OyP^�X���g��?T�mqu���{"�B�ɮ�����[�+=?��TM�d�1f:P�Ÿ��)ՕdO=�:~��O@��D���� �NC9b.%���uL�#��l�Ha�u���/�L�����D����N\��%�2��"&Su�NW�����N%w��NŤ=�s����Hhx�`R��*+�m��t8��Ӵ.ZpjU��*���ч�T/y��Z^[<3��'�.�^���9ſ�
��^ճK
ѽ�'>Z;�0�*��0:���sW��Ts_���~�Db�`*΄'�x�T�P�Lަ��h�V%�TliI��t��Dc�Z�Ob`���j���>-�����ϣ+�w!���Ɋ-��KR���6a%��j�L����Qb�>�)/��Ӷ����J+��e�"r�����a��q��x�l�����ƴղ<�_�j��i+։8z'���p�)
eå~��*����r ��@��C���"Ɇ�v��W&=�۴\�Ew���K�>Z�w'��'U�P���/�5�m����BA_�j��(��!�;���������?�BAA�      :   �  x��XKv;
'{�;� ������Z��x�&79��
0H���;��FWV�yN3ڳ�u���֏��;+�k'�<��{6[:9r�Z�^������@:�[�u��M�;1��dK�RT��(�l��h�iE	q�|C�#��m2!���C����\���!�軐 ���ߡ)��Lv�bz�I�\�n��6"^�3��s�E���]2r�9ۜ5p���8���~��ݍ���Y͍�:q5�z��}͠���N�Vѡf]qR:WЦ�~%RX�R��!"�%P'F�<�#�ىt���t��W�HsT���:�ѻC��|�0��<��:��>EI1�c\���H.��� ge*�\���}w��m$���`Z��)�����4<$.�n�N��.�u��*8�����i}�h�PB�`KѴ���k?y��.��?0-4�-D��'�����E��\�i�7cft�����_�_Dz�8n7˾��&ⱚ�4�	��UA��8���Ʋ�ٵ9������������=Ŵ�&������1d���(x⛻�C?G��a��CpՑw���}����qc���.�H�_��Z�w^�lc�O���j%F�ԗ����qZ��^��8<����&�
'��)y�J��@��T�6��=��7$L?*H������Ը4�2�����>�M�D+_m�8}�\�G��M>m�d�}o�Y�&���)U����Β@8l�F���Q$�cvW�`���¡���O��u�S=����gZڄCP��9��y{T�kq��j� 9:�.�x���g'?:r�Gf�Y5�י��c�,�KtB�����T������{Α���G���:�ƿ����OE�
����
L��M�ĺ��SI�$�� u��A%7������_ 
?���3��@�����g�b	���t�9��5�d�]	�����c�:�:b}���5�������������2a�����8���� ��1�p渀^�1_}+����3)��bB���hY����O+��fgM�τ^�!�	�a
�ߗ1��z�bzBz���
!� �F��dÛ̂�1���GwY���@���t%���M�.C��2D�в 1���q�]��㵱wa!S�O�'�g�CB77��H�!�B�B�ց�6*>W�L�]���(+چ
�l��S\��y#�?�����[
`����i�@�{�}Ceb��O���;��4�­���ǘ�MLg����5�q ԐhePM����fVݫ�81
]7�M��X�^cҾ'z�� y���=@����z�H�kA��AbT��u{���+ӥx��K?=!���jǳphuXH8H�u!ŏ1=���8�V}���}É�HX�%4�		K���-�@g�΄r
�`�:|ސ&�kş��.HNG�]��*���y���m�����Ge��u[����7�u��0���퀼'+hm�!aɇ��;���O��/�[� ߴ�xw�?ؑ!K1?��������V;m�z>N0c����܉�E��H=a�P�������83GWY���� S�������o6���w� m��~�ބq�^P�E�'���ih��(b�i����u�Fl��?/R������:��9Nw�X��E�ߐ��(���O��VHw���D"����_x����́}��D�����w��y|�tK,6|���}s��2v)��%����?����	���      ;   �   x�}��n�0�gx�q��v���F��J]�,?�RJ���5/P�t���|�1�s3/���jRh-�sp�{�c~�^9��g0�	��+�%+ J�Pr!�J����ĊJ)��F�/�������S��}^ҋH���$��&�'>��W��6h�ԃ�ޯjh��I����5�va�Y�T5T��zh��{�ַ�ݞ�`���lJC�y��ھ��.wٷ*(6%P�;G<����7�^g      6      x��=�R[G��O��`�}���V��$"	;ٚ*U_m���x�~����s"���$U��>�ݯ�!��tvc�:{?wφ�;�	\���/�����5�Gn~]��&ǝ���?�yk:���_:�y��߮�
�� �!�fA�/�)��,p���׽��N
�1�BXx"8��1�"���-��c���s`��_\���Ǔ�p0=�_�M���Yo��7��g��`R��t��a�v��ϫ:<����^��Q�V���8::*�
vD�I��?(��`N��e4�t���f�a\���x�q:: �QRr��I�	B�`�t �i��$\��߅{��x=M� =B�I
�)_<"�cFz��R��h��2=U�W�Y�J\�{��t9�LF�w��&x��`8�$0|���'�%����������f5���b�?��	�DV�`�drH.%U�POb�1�+IQ(��[Cp~]�����)�f�?�}3��߬>{��jdb���Г'&���]�bZ�NYkN(/�&�V(�Np�	��y���I��âk��}�b4��ó�9�_o�rش;���W�nf�VD*S�̈́"c�
���9��;���0#ʝ��q��J�?	UG�Q�>,��ֲ�U�JN�*�$I�Mւ/�"���T��H�$I�Z����Wj}z�~����OV�nz�*���:"1��f�ڔ"o��������ބh��Qx� ���H+��-|wWs�^|��0�\(^�M�q'm��y�7*��Q��e,��í7%���}�h ��}���S0�1+0�+��D`����O���8Fd���N�}R�t�=>9�73!ۏ2��2�
�q��bX���(�P��*���2Ǘ����xr9n���2L�2�]K��G8�zHQ6J������3k��R��:|?��u���
�L�J)q^i.�uH�(5��|���O�TQF�i\̯1/�o�wB���`^%�R`-q�
�x�<(&1JQBH��:r�5*�B�%t�����N����1��&Fِ�������?�M��Ǳ�䀧^,f�f��c����o��fvs�N&R��|xP�8��H6��=($:����T!] �7T�������s�d���nD�""�v�
7�7���[Ip���6*�.�9CLh�āpg��Z��/淭)�rM췍,���ݳ��KXtG0����O[1�+��0�82k=�^9�UD�ĂVi���Kd(������m��쏬�?)���MBx����#��������ʫP�Rb�G�ˋ*���r���?��E�F>eT��-�{�;��?�+����O���݄�V47~�?��53����@��6��!���NG���#
��)h�O�-O	,���I�����[�Zd�����Ë�'u1�����O���S�w���ɦz�I}ߊ6�"ܮ%�&�7��{�D�Z2�@�U��
����x�y���d��&x�g����&x�%�ݘ���Cy�,���$)�Jg��r��w�p����<�8���eǽ��93C���ʓz_��� g���d��uԣ��'�I�Ǉ͜4�Z���Z{���-���pw���������Q��Ӭu��� #� y5P��0��+5��Qm�cq=�����ܛ��ی/F�OIF��x�aͼ�wg���Ӻ�Ѥ�
���y/�]�$��O�'���0ȧb��(FIJ��\� �������w"�XXU�����D"3�XK��N=�LJ�E�W£�Cڿ��7��smg~ZE������m�qe�MD��MWug�2?�r���Z�T�[�\w�$�����:�~��׾7&UR�P& �&Yl��	y�t�R$�M,�1��"aè7^��`�{�O+��.qz<�mX��f��!���r��Ǘj2��X���%V���ñ�]�,���m�ď��PؘTM%Fw5��&�gDα��M�!�pp��`$*��9PCP��M$��l5s��X��+���Q *���W*�(�1�,���65!�*X��h� :�>VQ��w����8�idbњT�����Y�iΨ��H*.�CRG���YpE��L}DX{DP�1@�"��<>Hի�t�ç�y�}��W��O�g��*7�~:_�ٗ�S*ƚ���k�L��ʦ��l
�QR��8���sG5C	μ0R"CJ��M�� 8�x+k������5�Յ%���҆��k>j;�"2m��^eSRS��h�C6	�c1Zb0��I��L
tنo߰ս*U��RŎ�����-�LS��p�s�E�9aC�%H��!Ղ��LU�a_��p3ss:�qW��z}uc�o� �� �t�9��k��<Q��G���F!�B�s~�wG���U�	t��%]���?ס�b�����+����5�PF���a�����ű���<Ok{I� �GD��V&P��
�ʁ�R��Z���j��"tµ�]u�no������:��-��ߎn`���L)$*�+<��0��Y9E�7DQo��.��c@:_��N��kr�
�f��΀6�QR���P���FI�7E��e�j��tp|������^y]���p���,�0�*�"�!gi4�A���T)i)ݶ��Z�2�m��g�T`�
��#$���;�8��;�]2 ?��m7 u'�~k̚�Zכ),a�mZ'MUT6J��7�E�D���3�6ٽ*��V�1>���n,s;;���v���������%	n-�Si�;�!.��7���"$��ﲤ�h	���Fؗ��렱.��͵$�<ƫ�M�܅����_Hͨ��<�P(��R�!�&nY��n�Ӿ�?�$Ơ�`�̧�F0�P�y��"<*C-c,Y]o�^�ϭ�M�Cy���yU�B����&7�.C�f��E������{&��p'���l$��4���d#�k�|��(�;E��?,\���/���~[o�sk���re~���߾$'�9A��p5�a!����PARhP�K]A(jA�]QV��ی}����e���J�S�¬}���h֊,s.mjn���� ���7�"��ik���t��^���I|dv�	A�����1F�Q̡ԩ��՗O���G���vAX/����n�g�lZpU�o��k3��y��rs�OU��o��<���\HK�����A=���m���)�l�Q)��x��^�|�b�MF�$�ڹ�7�k�|�p~*B����Y��Va.�	���X/��A����ݴ0�u�I�Ƹ�Y:�A��$�K��^�	�l��{[��,�>����Z�����k���3y�D|��uY���V�}#���E��zJi�8<K�/3��zmS�\F���B"+1�)��^>Gޖ��;���U�a|�[E�����Cy���"m(�Gv9��2\ %
�B�k�p6D+��"ujs���DR�ѱ[�ھu������j�D�F�B&	�2��������:#\�5�6:l�/�X������ݵ$K\
U�,�Р�	fD����9Q�S��0��d-Il7��&o��b�)+-9��y�`@!��ǜ)""#+}�:V�`<�Q:6����w��I�Q�&��<��3w�l���Y�xpyѹ���t&���z��6E�{�0�m��J��IP��F+��
�e��֞�X��:��#���S<�9#�U���A;�b�H�%�%ǈ[BעM��/?_~:�b8��_~�?W��ϣ�N��I+���6_�2����7�-:q.�:lۣ���^8e���Ry�Y[���6����O�lۈ�zI�}�M�o��s�1%y�#��V����ꢖ�߄_w�^�]�Z���q��;`V�&��n�i�E�B8���vR=M��!Tb^����*�G9A�5�F�(��J����Eot>���{�}��.�'���֪-��f�2�9�G�ӟ�?�σ�����ǰ�}��no�/��rj5�
�E0!.A�C�eTt* m�p�0�>�W �  Ϭ�{�pD j��ӟ߂�� �>X����|�(�������i��L��S���1�J������P�1��0x7M�u9��F{�T��m̭Ƶ��sjc�1�,��6�I���ڟ-�֌�amEA.�������"@@g� �99�v�<��)���%ҷN�f�k0�$��1-~5�|�-�ͩVSL�����Yd�!��Fx�D�Z�VNKR���P7?^�!h�w'��ͥd�
+Ϡɔ����L-��Y���5�C$�<ٿh#�˂Ud�1ߋ�9X|�V���j�$�5����)�C�*�L`�ipƜ�ƺ�ks�d}� V���y4����B��$�T`� tTy	�Ρ*��N5ldyZ�h6o[Jwm���Y�Z9hr�Trv�B�󟓇�a�2�a~�0��HS�("|~��iA:yԎy!x���VCNbe����-���us�R����/v���l�܄��w_fW_�M+i�>i���T��e����F�&Lh�Ed�Q�`7Lz�_���D�[HW��a�(D��GN��S��{a�r\�AY��j��.@���S#_~����x�r��)���.4�L6��b���,���#�6K�ʤKQ��U��JQ�)��1�)�)��<J(،B3�cc�l<NϏ���O{��D��I����!�fj���'��ҵ���I�r-=�'+p����dm�|��!��� -XLj��&	�����M,U�Z���n�t��|����/���]�L�z�@��(d��$1id-��y����[���u*�����A��KOcr��tn������]Px��b���M6N�tĀ̈(��VSb�%����s	�^s�!txM,dv� 3 L$JhN�ӆp��8-E^�����_s�p�:hW�N�Y@ :u����N�x�����'t���I~�iuSO�����Kf^�F���Kf6�����h2�+J=5�ܛ/O����[R���h�.H�Mr��8��s�c�M��G�/NR�z���j�W���W����gw�W�;���#�#!�x!�"Uw�E���d	��<�Т��#1B�9�����bm�;���ǻp0T>.dvǰ��r���8�t_e�"d�?8Em�W)K�s�{��!ϩ?M���֮5�IWT{��#��f���tl�;�ۡ$#B�%�&n�F0�!�5�)삒�x�R��á�"���Ѹ��k�_�eVM@�k?rM��9��v$[��Rʄ������Fi���� )�5k�#�M�`=X�5q��R)k�kk��Vu��m����x����P��4#���Z����Κ}����b�`���-tD�`A!:�NXt0>�g��K���9��Y�T߶�*Յ�.��Z�R��F�HSo�A���D��,�k�+�@"}
�n�Y60q("8,.�E#p`���xH���9�F6����(�~	�k�Lu� �r*��(�(K�>�^h0�`RU�H���{b(r�Q,�0��i]#ꛯ�y��+t��-��z�K�,f��;�z�#�"�љ3/��:u<;V$U��p�J�[6��O��	�8e�}�(~}<����?��i�Kg^C�#>��Ð��H��ϐ>=S�s����~M��]���;: �-Tm��LF$xD[���(�E�۝F�]<������������?��'�3�0�}��?�w���Z?he���[]b����s5w�j�/s?��t�bt0�4�PYI$�h�ĺt��Q�c�@�K�Vv<$���g���xQ�F0Q;�~�=�,�W�Y�ẳ�����Ĩ��b��T=Tq�E醻h�h�eݡ�֧�20�H������Y�AH�(a�G����4\�J��ǥ�����CM�i6����V}@(�KBe�3�x�5�B8Me�1:��J8ā�H���
�xz1��F�&Ӭk`����������#��Iw��tӼ����1�Z�>�s�����T���z�*�����[O]�Q�z��6WJ����D#ɴF@2����y�0� �7��A4�uԮ[����Wȩh|��o������x\�a�6��OL
�����1
�,F�[!��Ҡ�Rx��s{'�J�W��s�����b�C��|�ή�U�K��G���bz� ��F�ŘꗥlJ��X�n��V�J��r�Ҥ�y~<7���ss`��o׮��D*Ω�#��c�g��Q��E"ZA-��#x[U1O~�F�T�i���}�;��v��4��'�*�����U�Eg���X7���\�   %YDX�J`��$����p�l+���k�z�^�{&�/pnru���s+b��|Z.�f�=�F�|]O#a@E�Bg��j�=��^��.��jLm�����w��L<"Y
6��_B�*f�|��Y��Yn�p���S��Y���pDH�mE�;��n���E���w��h	9�xb*/�r�#f���)�n�������+�AC� x�n���k)���-0q8�Θ����������!�$��]Xt�=�N�p�&#P��4�	YX���'�,e�Fi��Fpm<��5]����бs°�}�`��w���c�M��lٙgaq0"pz�) "K�G%�����@ Y .NE�bb�kj0��m&���W��7M(_��5w륑��Zm�4��=֑[)�e��UI����Uqp�I��[sk���[�O�{=�	�-�1(^�rj.Z�I��e3�n�0Y�"I\��H���$]���:4�U*����t�\ju��^��U�F��NZx���T�h���aHP%9 ���s&��^h�sJ��Hd��þ���ew��\V^�^��i���/���a�9���G�	�R/��Q�Fp(��G��^�lO?`5�z�
�X3K}	�Ip������D,�0u��]q��o�ur�!���7
Zen`z�3Fq�������[�5���@_�+lX�B�&L S�����i����T�2��0�gj�ز#��udcZ��%3_%R��##��J�?���jp5�A�dz_w~iP8JCc:�ȕ�X�huzo(Xy����O�3�^/�f��o��Gq��5s��AQd9~RXz.BloI0������/Oפ�I�������:��w[b5���0�K��5��|��6�"6@}�=���(�8$J\C=1�%��P�>g�[�n�JV_D��-Y/��B�x�:YY	n��TAZ_B�Xr�N�~j�LL�(D���T�b^�&VY�� ���a�;�U����h6y⥥�G<��@"f<j�>���k��Z�Τ>{+�V�b���E겒D���,mM��F�4���&���������2�ik�v&��]�Z��%��`�C(	�,�_�LG������$CdH���;S����?�~����v$�      �   7  x��Q�N�@}^����B�zYm�K�&MȲ;�D.�I�{�5�M}��LΙ33G�/XY�Vh�mJd]�!��YtۓϢ�aQ�z��մeA��r\����g��J�#�>!ᠯ`�\��d,S�/U�<v�
�#�A�1Y���b$J�YN㈧�Z�x��s��x¯M�Բ�KѴslMYW��y�O�y����mf��w�W��X�^���%�l"���l貮`�Q���1��%�o��;�sS� (u�/ ��J���eFQd���ʷ�Dh��{<~�x+���FO��4^��؍m�;@��      5      x�3�L��".Cd�!����� �p�      �     x����$9D�ݾ0�|�_��Xz,Х�JA�"�Dꮲi��'� �)0��$]̟$�����{�����Xl�r~�/,%q^]���fgX+t�kt}�{c�]�fl��(^�I�o0����U��6#Լ]�� �d���F�+k󞵴�2i��xv_G��^}�kܨ9�B�j ^�>���I�K�+�[H[���#<�o��`���������7���W&��	q���uye����FJUڥs��b^Jk�S�Y���J��B8EFܕ#��惻/�Y��u?+�ߪ�u��3?�ke��E���= ���NY+��3k��*o���G�9r+����^;^Y�k�Ӎn]���U�0G�_e��A����F{�`�mu%�]}e���0$�=�n����+&v���+��g�$�Vk��E�"D6)��%R�u'��o#z�{)�<S;I4:_o}I�Q��j�TKp���)��WV_��Bf���[�#K�:i�ieM�-�
Ƒ�~�l-y�Ь�9����|����x�}      <      x������ � �      }      x������ � �      ~      x������ � �      �      x������ � �            x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      S      x������ � �      �      x������ � �      m      x������ � �      l   s   x��� �g/\DV�^�#��p�&�L22�P����u�v���
N>~���ɗ����mU�ye��9�
v�g��H���HwϥirG~\>gv�0#S)����:�~��� G&�      T      x������ � �      U      x������ � �      Z      x������ � �      [      x������ � �      k   �   x���An1EיSpW�Ğ8wA�l�FHh@ܿ���Ko����3Np�DA0$�gJ3�k��5����r�ߏr*l�+��m+�h��L]Y�R=�q�4����mh�v�庿���V�'y�����" [Kh�j�[��~���?�eY~ =�Q�      =   �  x��[�r�]S_�E�p� ~"��]��}�f��r�I��s0$eR���a�JEf0�s��q�m�'��)���\Br]zr#���Y.��艼�.�ICݐН�\�5?bk��o������js|��wkp��ŋ��0���vۊ?��ޥ0,Vc����Q��\����(�2rډp臫��]������'&4��G�k�{�^�J�vB�[������o�G{���RlE�����ؒ�Pj���RB�`���������0ŵX�E߬�V�L�����d�m�6]�Pm����'������ērQӝ����<��﯏�탆\Ss�d�yM�/{[�f�Z�~��wv{����X�9�:�-�BL�N�Q��:f���3��?���N1�$R�6�b�$��ӄť�{�,G�_�!\#jt1Nd�8�k4�rK�$:����������/|�?~p�AAk�)(�,�/�k⨊�9Ǻq�����?��^�w�_�||���{�B�ifɮ��X T���v��
#�;��0>������c�se"r�x-�X��8S�9��<�����`�F��;C1%�0]���/1xߤ# ΃�%�Ԉ{�uIPk�]k�\�2����y��Ћ��)Ԋ�%7��A����x���h=�}-}�c���z@�.�"��@ 9v(uŝ2�|�Q_���=8�&MHA��͆�@>u�}ֹ�&䝦�����������8�".�2@L`1nY@�fC�+*���KL�]�$)�2��E��&�|A��J�_�?��^�/߷��X��z)%��8'��A�����/�F���u�B$�����Z�􎝟�.b��2J��Z\V���`�V��� t�%�@��W��HG۠o��Ҥ��_w���́*8�f�R���Sn�������-����<��5�7��=�~|w}��_w_����h�����4�LP�� ��s�k������JN��T?�`#�p$s�r��Ȋ�e����A�:�s� =��磃��:�M��X*���,Z�����y{�r|,��S*ܒ���: *�0��(l�ȧ�~ʞ�g���Q���t���<���ed��N�j�v�,�SI����'*�{TI~�����ڨ��&ߐe���vA�p��;|TWu�7�2��_o���J��Ad��ݥ ��#�Ƅy�%����wV۫�@�n>>R�Ãir�R����%/�iT���0[r6m;��7s"��|�������=L�v��<���Da8��f�P���������x����[{ ΂Sd"�>Cr�V��9�����.
�����P����\".'�,d�����m�=��1�1�����I�bͥYt��m�H����;��@��as�Hpdx���y �V�e]HލZ�kJI�"��w�Kx+�1���S/@ �.����h:��=�ͻ]
fJ:�-�"�u�`��'�2G���~Cx+t�CjG�i_O���pz�KR��u��z�[��ZJk5�h�!���A78.Z��xA�;��AG��Z�pO�ta�'�A�4榼��jK�w�1]��<@�a�K���R������[�E=
�8g|(㬭�(؍D-�J�tP�z�,#����E�Fum�P
��O�i�[�כg�mX=C�fT�!���2����{�ھ�
�Q+*�B�'|��+��ս9�����/�9�>����=ip�h$�!��&��}�|��4 ��lq=s5�����iK �������c���$ܖ�O\m%�p�r����G����2G�)��II��A�@�T�������}�9*(�TT�

n��*� GKH�1䳀��}�|饕)�l�_2
��+�\�s�noxk�z+��R����iiW�	�,&�\P���f�����BG����/%��D�9��*�T�,����r���s����%� ���c������q9n�r��V´qwy��.�߯�{c��C�C&B[c�cp��pmN�ީ�;��w�;��j(�a�L҈ Q�X��9���+u'�M��᱑2�_��T8�ys>Oᜇ�������ǧO�N�(�����⤝��߃A�U~� K�y�Tؖ��& �h]���Y]_g{�l�:e�����5c����z���
5)���i�;�8��lT�5��,T�bQ09|�0�gԟ6K�ol�R�����'��ǩ����2�wG^(��Ĭj�'&�G|�98Ձ��
��Mv(�	�1�ĉ(X�3x6F5�����tޞ��g��s
$AQ�����y�3
��2�-Q�B�F#�P�uy��%z:`�յܠMC�p�t�׺i�W&����:J࠼��:O�)�L)r��l�L���r�y�{H�����>���y����p(|�qۡ����?a��Qk�#K4�}�	��������^2	�12 C@�RJR[�쬐���<Ԡb:�@0C��j��=G S--3�����α=�094��)��;t��]��ם����ձitF��u�,��B�:b�z��(tm{�۟��C�K�h��!���(���1c��=�@��(�`�Z�:F�k��(�:�B������o<3<���:����ޯ'X	s�}S���4�E�\�ѱ���5��`f����ݣ�`o����{��b��jQ��8{��� �E�)O�Q�&���u��
o>�	��+��)�Fi�
�d1\��2�-�R>���)
�3f�e��8�p�W�2c^������>����w�V�l�2�#TJc_B�z��o9px�)`5�1j�������n��N !Fz�iʦ��F�s�\��{��/Ԇ��W-5W��ӟ�=:��%U��6�uH�SY�`G��^�@������x�f��J��w
-�+�g��b���}����mR����D�͡/����D	�,�4eg����޶����ݻw���+�      Y   %   x�+K.���42�3�3�4474164642����� m�      j      x������ � �      i      x������ � �      �      x������ � �      w      x������ � �      Q   �	  x��Y�r#�<7�B?P��::�}��̥�*�2L�
J����;1��8bv�C�.�(B�ITVV&��f]Ǡ�Q��''
#�Tgα�&�z�󰇫=_N�l�<���4.糍��r�A�.�_ѣ<=�u�ᒣ2U(��b�4C��Y���Cd��P����IR��ҹ��S�.CN_���]/j'���뱿��!O��j��M)M'��"������~A��Q�J�2%��.�ݨ}qq��z9������=��������ۯw���&�Gő�8)����(�j/)�C�֊&��Ȝv�)F3�$u�0X��z:=�����{}J��/�5����k�މ$�A��V��8�zP�&�:�4 P-�8�����~nS��������{qT���$*�AA�Q*�戮��l�����0\��ǔAL�U�FM| �)��b��ǣ*���8�M��$�}2�%ɤ�*H�9�:��q��=A� ��
J����l$��b�W@�ۺ�{���k�����r� �s�t��s�q{�^���%a7+�çF=H�B�Z�h���?,v۞�����nr�b9s�Cu`D+�>�����\Fsm�������jdԀ�ԇH��I]�k1�if*�n����;A�:;�E
M�&�b�޹�=֭�/?���F��(�+��7��4�0�H�����َ�yy7�4�Q�R)O��5�R���o��{!t5��%�)���=X��#Gm��>�R胼�/!��<�VS���,Y�d��Wκ٣O7 �]Ҍp"����u����WT@3���A,\J%��LN��p#��!x�d��<��(�4 x��[�Xq�%v8-Y��)+�I�e��r��MTaО�n��>�⾱E?�$l?8��%�X@5d��5�r�0p�0�NV"�;�RZ�M�u�=���x8�>���=����䊁޺sa0��.�
�Z@�Ru���11�g�����͈�>��*8��2�c�� �j�#��jrz|X��e���on�w ��#����&ƹŔ-�C,1W�r٭>�����ԃ��f_�q��م�m�MP\��d	m�d�q�:\G��j1�}�c/k�j�P!d�e��]�w���N���a���������~Y�e�V�n���+�h�K�w M�������o�3Z��&Щ�e9 �j���	==��T ���C��w�Q^|2�!R �%�˪�_Ll:���m��ק�H��/�����/�&`���3�g� Yq����"'�d_u���	�z-� ����_a�B�^�p� JT��XJ�8T�Q� �6�:�c�$��'ȇR��S2?5dsSG�blA�|]�S��b�ܳ����{��CR�HF�ncQ��GC��{�x���n�0+�����x�lEԈ�_s�湆I[���F.��� �����]�?��0�0�0R9cr�خ<�;��.#Wg	���M�>w��/�εg���\�Gs$w���Ce��������Hc�x�*�6�R0NSFM"+�7$,��>ӹF�9�����jYF�=���1�S�=}��b��6�rE��H�p����SΣ�ηg�]|gL�(q��A)�j��Y)�D�E����Ѐ�glG�O^����jo�$�}ja�i�%V�$��1t|7��Wᆃ�]�N�xr�O(�y�燓�Hh�r�ھ�L����:�M��:3
���d���{Όv��B�� �.1L�bN}6�Hw�����b�����r�`Db�A�А����6���u���r�}�e8L�R�/���V�	�'��(C�)�Yw��h�w`����4d`+3R�H���aX��Dg�yB�Ҁ�:Ġ��YR�����n�#�}��6æ�T��
�#5Ҕ93��3x�A�%C�E��Na�FȐ�[�����<�:��@��)X7�����MK˳��×����@å����:�8�ǂZ�r���0�a��;�/C�Oy���	Ï�I����\P���)�T�A�M���0���OLK0nútE犏	s�{
DmŸD�� ��mj��'�<�O,9gR��g��M��n����{^��:�HL-�� Ѵ)U�.���QaM�����"� ���N�5h��op�DLH��:CE����"R���2�C�v�	$��E�/5�u�c=��U'��U��C�jZ�'Q<k���1��k^Ki�uV��*���!�Gه�cr����&�ȋBE�T1:6�\���������y������I]7����r~������P�3"�0�ma��D	r�*{̧�� ����[��UC��o]����Á�i�V�f=#Q�
���:#v��8�qy�c�7��@�l�<�/vS
,7:�[��G�|s5Js�ׁ*��0��	��8�P���5d�Z��k.�H�@Y������ۙ�H�z�o���	׺���W'	lȩ�pe/�\Sw� HY�8֬�P��_��P�fL>�2
�:1��`�#L��J~&ɇ���?P<�      R     x��\M��=ۿ#����9%�=$AN�Ez��HI��&�O�ǻ葪���{F�{�؏dɢl����jS�š�8C���C�9]>�.����t���/�������s?=�c9<�b��k�N�~<�r|#x*���P_o}Ó�Sri�_��C<�ʳP�_�i����y=����K:�ڏ�{�5p�<8E�RT�bm�(���Q����J�c�!�X�������M�8_��M��˙Z��YY��:��>��`t&Ue��y�C�9�%�?��G�|ߩ6� w�f:��_�=�Y",߳��i��zC>#��db�Qs�M�nk_�K���%�������\>���y�E��'	��I����ΚN�+�1�t_��ծ�$�`}�'�T��NьQ"�˥�~�t����g"
�3u�`�A�;���wͶ�iP&c�jls�U����'�Ct��ǝ���I�<�J�N��PB\��C6��*:��,H��;%�/dAr��S2���s�$0�%o�*�+�&*�� kKQ/e�؇�TZsI���$�������`���S3c�&�3�D8ާ��E��)��B`4�R��:\Mr�'|.��nh �T�8%=��O	�ʛ�|O]�ᑂ��
e�Ilu%
z�̒s�fm��;���2��� M!�:���\�T$��>Ŷ�p1�p	�th?s���S�޷���Y�.Z��6I)��점Ѵ�Z����-��.*�`��__��:�p��jCp�jƪ-�����,�x~�
Mi�T���� �`�=��kV�9X�D����r����S2���3�D0~@a��U��6(S�hU;����ǪKb�%	�X���A?���$��|8���E������
�4�[��e���������Y���<����q�fΫ-��>IpK{����6Z~�>�8�H��^+��թO���$������4��;���S5��F�3�Dȅ1���J��K���R ���NkZi�~5��s�cJ���p|Qr�S17��z��I��=��\e�n�Pt:BF뚱j����ڗs������wB�C�{�64w*g������o�g����|>�rz�����
aZ�9�PB��Y�nuU5�OogL�������x����������2��Y��r����K;����4��z��]��.��/@��>��Bp��/�+���G�}���\����m5n���?�rɱC�� EyK,C�!%�p��W�P��������|}���M����S��/�7���	xak�b�Q.@���Gj���fM�XΣ��1�C#��[���;�s�5b�ߍcÁ�e!(�"�b�;
 ��2�"7Z5C��n��񲘃;��Gm(��$�Tu�h�r֫Y�����x;�R���D�q~<u?mos/�z~����;��ӎ�~�}9��.���݁��r!�SF�����S�ˈՙ�U���}9���P�˗?�K�$�K/�������Q,�iJO��&�����0�)��b�5a}�@����TkN�ܗ��f�s �����)��U��||��K��q��o����.�J0|/1ݵ᳇hl��P�W���E��:!�9�CR�b��ŸS&c���r~}y7~E��
���8 �ߒܔMյ��J����s�N tJ7��mZ4�l"T�ز�T��X�9��		��M� w*���vSD���`�𣃎�iA����z5�o��Hr~�K�p7eC#p�rn�K��M�E��Y7E�RC3e*���o��A����]2�1]��WgJ�K5��N�\y��pP#�.����]S�q#{]�(P|o�So�"�Ɇo��5V���."�೮�i!�b)xP	��*��[��Cp��Ḵ_���ǆ�N�\�M�<�� *��kZ���(95(.x�}j�<_���j	|��Q�wJ����h-�-T:6
HK0�����d)ڇ�P�޵a��Q��W:J�K��r��S3W�E��Q�[�i4�t�N��T'CK2��j���ζ���9|���7ȿ�I
d}ڠ��O�S�&���PH��!����(�?p�'9��T�A?���M��)paϿh��Jr�@����$�5(��S�����9��2��Kw&6��������We�y��-я�L'M뚦�b;(�(g1��U���uJ_�9�A>����I��'n�'�2%�
�t����L|&�M�ٹ���I_ږݠw�挒�?�9&�X��֝)��yZ�ڌ@�1�S�����9x�$�Ŋ����9�6h��xA��璝��jP����AE2�D�F���ʪUr�*|�ˆ�NՌU"0�E��U�QuG3h��Ӛ��#��N1}�����49k��|9}Cp�lƭ��a6�c�1��
���H�]��`q5Ős����m�z�)�ۭ� x�K-�-]�THCNO(G�gE�J��`jh��׶l ~p�S��ލ����P4=�^hZ����
�]{46���[9D���C�羕����l�m�uk(��*�^5�[�Đs,D)|)	ܠ�>HI�l��H~6/������
�d�a@�h ���p!���|9��l^�⭕����Ɲ��\����E���cԩ�
t7�jP�2���W�X3V�17V�b��?���,\%�X�Ar�ǘ�_%��Fa��׮Z��X�p�sp�Rlن!�B%Mڍ`GIeĦC[��.瘻-B1n˟����JE����m��f��Fi�	����IU[��(�X�ξ���{C�����X5S�-/luPṭQ�YqJ<]�T��P1,�\?��s�[���{CSp�~n�C���"o�B�
�d���1TZ��EF�!�W�Eղ�Ώ�g�Ώ�cm�(�����Y�%(�x�g���-( ~x�G�h��� �z�����:��;��j��n���\V�=r���a/��.��+Jg����a}֑���X�'�6o�ˤ�t��_%�=H�/��͞��J�|,qѩ�͒?-����^�~R՚ڱ&4��S@���ʼo������޷ȼ�-��rz!|�����'C��b�fj�%S����F�m���n1�>䊁\����y�� ��n*F��A���N9q����stz�������BP1���Q��76{^�)�.ԋ�Zuϕ�� �oJH(����r����䃂1���C�j>��|^�!A/~���4�XEn�'��[��8�	)V��D"�T�!�?�mH�l�ƖF��� �룫*����A@��M dZ�l_P ��k�$p�t�z�)�;(� x^�&��.�������U�F      >     x��R��1�����N��.)�(PP\�8qw���;��f�Q<ό������p�椀��A�"e`i������s/Q�~����x^��x��˻O�~($Y��9_�k�#�
8�/<�R璊r:�sM�����2��G����R��/F�{�Z�3*,1B2U�\Q,�>�bD�����=p7M�W��t��ks�� �|���Rm;)��&��D¹p�a��e�!>5`��c��伓6���<y�v�ϒh�OJ�����T��L�V�����N*"�כc�:��N˨�z�U�}�X췾(��nm +�E�"�*�s~������~s����<����q�Y3H��}�����5j�:���)�Ҽ�){�O=�]VA^ձX�[�
�B�u��=���P�%�t�i#��IJF$V8�i{]���Lޒ���:��VV'K$MW8��$p�gE��=�c+7�]u����`jX;�gl�n�)���tygK�2δ�w{xs��~\O�%      ?   o  x���mo"7�_�~
�7y��%̓�����H!�Vj�������T��w��)�p7N���<�����h�<��e`�V� ��p�;-���������c��N���i�C|�dY�x�'I��@;a�����a�:�X`�g%�J'��4��V�<� ��0���xe��`_���{6��lB�+��78������_6h/���{?bkxm߂���k�_��`�6���:��[,�g�?�<�o������hԏk���4���7���ݽa���Z���.�4fC8mԛ�4I�kBqYe0��K]0�l�����6��CF��L����ו�E������_��G�*#�B'I�B(QT�ϕ��=*��J�G��*n�X�O���߶��
)E���s��%H��EA�G�C4�!�f��f�H"L}�,K%�\y�)rw���d�/X*4��0�R��S�O��4�LLj\2kO��<�z�cS�wvbK��V����?O����(��U��P1�1:�C��3*h����V��\
�7c-��-�ވ�.W��.�Z��h�f�}�3����Q3��I3mŜ5Z�Q'��m��W�7�,�� 4!"��BDd�������8�BD���BDr�uBDB�V�h�{Y�l_"��BD�l"�����v�ۄ�d����	Q��m��$��8��Ǔ �ϥ�'��$�[!���}�+�޳üڍ��b�Dl�����GP`v���K/�H՗q_�݅��Ҭr��K�>y��5*Fj�E1&�9=Bz�����J9l���D����ͪ"v��yY�{�%Қ�s���_�$�yI����_T�w5[��l}��,�a����.�vp�3�qJ};�g�/`�_|���q�۱��`N���yϢڇ����!�t{R��C�QlG����goK�pRX��_Q��d� v��Nq�v�g��+�p����H���|Ĕ9�;�����<g�(Is�մ�X�.�=q���B����0�����_�'Amoҏ�#\��,!_��ep0�6�_0��Q�"+�%�q�+��`�����s���O�Ȏ�����0���	�\�� ��0��2��ג {P����?{��{?��翛����\���qE���      o   I   x����@ ���Y�����7�h�,M�
6��=�ӌz�-�}$��j���;�� OE���� �4��      X      x������ � �      @   Z   x�]�1�  �Y�RS���/.m�12��Dg�[N�URA0�
�� �(�h$�Q7��1'ܣ���,6$+��
d���SkĊ���_���}J�      �      x������ � �      A   _   x�m�1�0FṾ��S�Ⱦ�o���J�^6��oy���|�׼�B&|m��ٹ*vFg�P�&x��|\5��Ɖ�qu)l��P�x��i[��`s$      B      x������ � �      V      x������ � �      C     x�u�9n1���s� ̈�D�%E�@ /���?�"K�| �OL�d,��)��1�`�12C�������_���G�>��ˆ�E)Ps:H� cCHj�Z1����XWch�&H����՗���i�yy�~�]��:�$�Z���Z�X!�z�#�����-���%R�8�Վͣ�A��jG")��T�lP	�z�ȑ�:�ZG��N�0V�hld�kAɣw�1�i+ɂzp�z�k�Ы13���t����w���m_�r|�      h      x������ � �      g   A  x��V]O[I}���^y�gQ	U$
(�V+�y<�6%UT��_�R�.]ݗ����x�s撵ID�P-x��gt6ǒ���q������}8��e��Og_i}=3jaH��@��HF�9�� "��L��� A�oL����8�\2Q�h��8>Z�V����l���h/Ӌ����e|��ٹZ��3�d.|��1ؚ��w�g'��W��jy���mn����V�w���PNb�3G��]���Ň�6R�->r>���t�8~��v��m{{�?�N*�XZ!��&��4(Q���%��->\��ΎWZ��|9??�������M��i��~��ٍ���y��$�P8)׬ΠA�9�L�!7�HC�k��J�mno����rz���� &�,dD)��uf��P2��W�Z������W�;ٮ�7L:~�ҭ��[����Aĉ`󽉖���FJ��{+\����R�v����y���v���3]����)X�I���]C0�$�k*���vt�kO#���p^�n�����������&�Mp�� 蜎OS?!�Z��I�K{Y̡���F`r*˂j���W�!_E~!�T�R
��ok��Ȫ�fRqr}��F1yIK��4O�.�ubr�ѡ �H��Us}ϘKJ�m�ĸ�����)�Cdl�����4v���J*fGZ��U���׶8Ӎ}�:���:롖P:C�Y�9)�"�Z�1̜�)�X���?�0۱�� â�.�hժ-�-��ZF������g����)�^�M��!򵅬��?m��	>��h8���׌R��U)H�}�F޵-�7�8���W������.�:      �      x������ � �      y      x������ � �      x      x������ � �      s      x������ � �      �      x������ � �      v      x������ � �      t      x������ � �      u      x������ � �      �      x������ � �      �      x������ � �      D   �   x��ϻ�C1����B�lzR�%o��;@8�FE��$�ւ� �<9�i[��.��� �\�T�b?G��A�HR,�����F�|���-U�A,���u�-b�%�������S���n	ηS���ߤ�O�C�1����5��8��=�� ��I�      z      x������ � �      F      x������ � �      \      x������ � �      �      x������ � �      G   P  x����nc!�5�]\l�~�>A7�b)�$����_�l���B\�g_�O6�0| �^�ShQN���sK�����4&b��7�'O�s��YGv���4j���<*�*��c��܏���`s޿n/��?_W���sI��pnȈ̩Z$�C+9 �~Bj]�tͼ�$<H+�
�ꈷ
�HgX�*Zs	é�9���4,��`�l���j-�4�y�y�z��}N�>�e��8��;��o�v�2��b�4�Fd�$�5�3g�6(�A[��ֈT��1W/�@�,z9L�٨�ѻy��)��mF��B�G�-hE$���r|f�1�49����v��ՙ/      H      x������ � �      c      x������ � �      d      x������ � �      I      x������ � �      n   J   x���� �w��2e�^��@�/!��>���i3���$���uu�S��8j�aExء*J���h��Z� r��      J      x������ � �      K   �   x���˕ ϡ�a����q�%,%�>�Qip�p���t�X]�u����*�G9R΂D(v�9u�}'S�_L��G/�eݐ��� �i���ڛf��8!J?�k�qm9�ˋt{�=R�¥�~��oLqǼ�t�!�́����]����m��M�      L      x������ � �      W      x������ � �      E      x������ � �      M   z   x���C!��������`/����K�+`�h^�k�~ �3#�#n�κ�ʻj�b?��I >+WB��n�䘗㮝7��c_�;��E�ʓh�UjK҇�� ��a�]��?��Sk���&�     