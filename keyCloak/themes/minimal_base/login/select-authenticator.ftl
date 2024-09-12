<#import "template.ftl" as layout>
<#import "lib/components.ftl" as components>

<@layout.registrationLayout displayInfo=false; section>
    <#if section = "form">
        <@components.cardMain header="${msg('loginChooseAuthenticator')}">
            <script type="text/javascript">
                function fillAndSubmit(authExecId) {
                    document.getElementById('authenticationExecution').value = authExecId;
                    document.forms[0].submit();
                }
            </script>

            <form action="${url.loginAction}" method="post">
                    <#list auth.authenticationSelections as authenticationSelection>
                        <div onclick="fillAndSubmit('${authenticationSelection.authExecId}')">
                            <b>
                                ${msg('${authenticationSelection.displayName}')}
                            </b>
                            <small>
                                ${msg('${authenticationSelection.helpText}')}
                            </small>
                            <span>
                                ↗
                            </span>
                        </div>
                    </#list>

                    <@components.formField
                        type="hidden"
                        id="authenticationExecution"
                        name="authenticationExecution"
                        value="${samlPost.SAMLRequest}"
                    />
            </form>
        </@components.cardMain>
    </#if>
</@layout.registrationLayout>

