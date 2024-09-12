<#import "template.ftl" as layout>
<#import "lib/components.ftl" as components>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "form">
        <@components.cardMain header="${msg('loginAccountTitle')}">
            <#if realm.password>
                <form onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <#if !usernameHidden??>
                        <@components.formField
                            type="text"
                            id="username"
                            name="username"
                            value="${(login.username!'')}"
                            autocomplete="off"
                            booleanAttributes=["autofocus"]
                            labelText="${(!realm.loginWithEmailAllowed)?then(msg('username'), (!realm.registrationEmailAsUsername)?then(msg('usernameOrEmail'), msg('email')))}"
                            hasError=messagesPerField.existsError('username','password')
                            errorMessage="${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}"
                        />
                    </#if>

                    <div class="${properties.loginRememberMeForgotPasswordWrapperClass!}">
                        <#if realm.resetPasswordAllowed>
                            <@components.link href="${url.loginResetCredentialsUrl}">
                                ${msg("doForgotPassword")}
                            </@components.link>
                        </#if>
                        <#if realm.rememberMe && !usernameHidden??>
                            <@components.formField
                                type="checkbox"
                                id="rememberMe"
                                name="rememberMe"
                                booleanAttributes=["${login.rememberMe???then('checked', '')}"]
                                labelText="${msg('rememberMe')}"
                            />
                        </#if>
                    </div>

                    <div class="${properties.btnWrapperClass!}">
                        <@components.button type="submit" variant="primary">
                            ${msg("doLogIn")}
                        </@components.button>
                    </div>
                </form>
            </#if>

            <@components.socialProviders/>

            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                <hr>
                <div class="${properties.textCenterClass!}">
                    <span>
                        ${msg("noAccount")}
                    </span>
                    <@components.link href="${url.registrationUrl}">
                        ${msg("doRegister")}
                    </@components.link>
                </div>
            </#if>
        </@components.cardMain>
    </#if>
</@layout.registrationLayout>
