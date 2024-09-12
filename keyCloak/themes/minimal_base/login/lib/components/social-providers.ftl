<#import "../components.ftl" as components>

<#macro socialProviders>
    <#if realm.password && social.providers??>
        <hr>
        <div class="text-center">
            <h4>${msg("identity-provider-login-label")}</h4>
            <ul class="list-group">
                <#list social.providers as p>
                    <li class="list-group-item list-group-item-action">
                        <@components.link href="${p.loginUrl}" style="text-decoration:none">
                            <img src="${url.resourcesPath}/img/social-${p.alias}.svg" alt="${p.alias}-icon" width="30rem" height="30rem">
                            <span class="ms-3">
                                ${p.displayName!}
                            </span>
                        </@components.link>
                    </li>
                </#list>
            </ul>
        </div>
    </#if>
</#macro>