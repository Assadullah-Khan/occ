<#import "template.ftl" as layout>
<#import "lib/components.ftl" as components>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "form">
        <@components.cardMain header="${msg('emailForgotTitle')}">
            <#if realm.duplicateEmailsAllowed>
                ${msg("emailInstructionUsername")}
            <#else>
                ${msg("emailInstruction")}
            </#if>
            <br><br>

            <form action="${url.loginAction}" method="post">
                <@components.formField
                    type="text"
                    id="username"
                    name="username"
                    value="${(auth.attemptedUsername!'')}"
                    autocomplete="off"
                    booleanAttributes=["autofocus"]
                    labelText="${(!realm.loginWithEmailAllowed)?then(msg('username'), (!realm.registrationEmailAsUsername)?then(msg('usernameOrEmail'), msg('email')))}"
                    hasError=messagesPerField.existsError('username')
                    errorMessage="${kcSanitize(messagesPerField.get('username'))?no_esc}"
                />

                <div class="${properties.btnWrapperClass!}">
                    <@components.button type="submit" variant="primary">
                        ${msg("doSubmit")}
                    </@components.button>
                </div>
            </form>

            <hr>
            <div class="${properties.textCenterClass!}">
                <@components.link href="${url.loginUrl}">
                    ${kcSanitize(msg("backToLogin"))?no_esc}
                </@components.link>
            </div>
        </@components.cardMain>
    </#if>
</@layout.registrationLayout>
