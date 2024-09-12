<#macro head title>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="robots" content="noindex, nofollow">

        <#if properties.meta?has_content>
            <#list properties.meta?split(' ') as meta>
                <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
            </#list>
        </#if>

        <title>${title}</title>
        <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />

        <#if properties.stylesCDN?has_content>
            <#list properties.stylesCDN?split(',') as styleCDN>
                ${styleCDN?no_esc}
            </#list>
        </#if>

        <#if properties.scriptsCDN?has_content>
            <#list properties.scriptsCDN?split(',') as scriptCDN>
                ${scriptCDN?no_esc}
            </#list>
        </#if>


        <#if properties.stylesCommon?has_content>
            <#list properties.stylesCommon?split(' ') as style>
                <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
            </#list>
        </#if>

        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
            </#list>
        </#if>
        <#if properties.scripts?has_content>
            <#list properties.scripts?split(' ') as script>
                <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
            </#list>
        </#if>
        <#if scripts??>
            <#list scripts as script>
                <script src="${script}" type="text/javascript"></script>
            </#list>
        </#if>
        <#if authenticationSession??>
            <script type="module">
                import { checkCookiesAndSetTimer } from "themes/minimal_base/login/lib/components${url.resourcesPath}/js/authChecker.js";

                checkCookiesAndSetTimer(
                    "${authenticationSession.authSessionId}",
                    "${authenticationSession.tabId}",
                    "${url.ssoLoginInOtherTabsUrl}"
                );
            </script>
        </#if>
    </head>
</#macro>