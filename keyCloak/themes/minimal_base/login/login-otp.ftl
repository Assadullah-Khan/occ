<#import "template.ftl" as layout>
<#import "lib/components.ftl" as components>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('totp'); section>
    <#if section="form">
        <@components.cardMain header="${msg('doLogIn')}">
            <form action="${url.loginAction}" method="post">
                <#if auth?has_content && !usernameHidden?? && auth.showUsername() && !auth.showResetCredentials()>
                    <@components.formField
                        type="text"
                        id="username"
                        name="username"
                        value="${(auth.attemptedUsername!'')}"
                        autocomplete="off"
                        booleanAttributes=["disabled"]
                        labelText="${(!realm.loginWithEmailAllowed)?then(msg('username'), (!realm.registrationEmailAsUsername)?then(msg('usernameOrEmail'), msg('email')))}"
                        hasError=messagesPerField.existsError('username','password')
                        errorMessage="${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}"
                    />
                </#if>

                <#if otpLogin.userOtpCredentials?size gt 1>
                    <#list otpLogin.userOtpCredentials as otpCredential>
                        <@components.formField
                            type="radio"
                            id="${otpCredential.id}"
                            name="selectedCredentialId"
                            value="${otpCredential.id}"
                            booleanAttributes=["${(otpCredential.id == otpLogin.selectedCredentialId)?then('checked', '')}"]
                            labelText="${otpCredential.userLabel}"
                        />
                    </#list>
                </#if>

                <@components.formField
                    type="text"
                    id="otp"
                    name="otp"
                    autocomplete="off"
                    booleanAttributes=["autofocus"]
                    labelText="${msg('loginOtpOneTime')}"
                    hasError=messagesPerField.existsError('totp')
                    errorMessage="${kcSanitize(messagesPerField.get('totp'))?no_esc}"
                />

                <div class="${properties.btnWrapperClass!}">
                    <@components.button type="submit" variant="primary">
                        ${msg("doLogIn")}
                    </@components.button>
                </div>

                <#if auth?has_content && auth.showUsername() && !auth.showResetCredentials()>
                    <hr>
                    <div class="${properties.textCenterClass!}">
                        <@components.link href="${url.loginRestartFlowUrl}">
                            ${msg("restartLoginTooltip")}
                        </@components.link>
                    </div>
                </#if>
            </form>
        </@components.cardMain>
    </#if>
</@layout.registrationLayout>