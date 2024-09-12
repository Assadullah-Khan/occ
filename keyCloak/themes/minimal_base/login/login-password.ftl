<#import "template.ftl" as layout>
<#import "lib/components.ftl" as components>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password'); section>
    <#if section = "form">
        <@components.cardMain header="${msg('doLogIn')}">
            <form onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <@components.formField
                    type="password"
                    id="password"
                    name="password"
                    booleanAttributes=["autofocus"]
                    labelText="${msg('password')}"
                    hasError=messagesPerField.existsError('password')
                    errorMessage="${kcSanitize(messagesPerField.getFirstError('password'))?no_esc}"
                />

                <div class="${properties.loginRememberMeForgotPasswordWrapperClass!}">
                    <#if realm.resetPasswordAllowed>
                        <@components.link href="${url.loginResetCredentialsUrl}">
                            ${msg("doForgotPassword")}
                        </@components.link>
                    </#if>
                </div>

                <div class="${properties.btnWrapperClass!}">
                    <@components.button type="submit" variant="primary">
                        ${msg("doLogIn")}
                    </@components.button>
                </div>
            </form>
        </@components.cardMain>
    </#if>
</@layout.registrationLayout>
