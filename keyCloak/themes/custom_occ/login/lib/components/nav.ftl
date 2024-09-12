<#import "../components.ftl" as components>

<#macro nav>
    <nav class="navbar px-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <@components.logo />
            </a>

            <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                <div class="nav-item dropdown" style="color: #0B6AEF">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        ${locale.currentLanguageTag?upper_case}
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end text-end">
                        <#list locale.supported as l>
                            <#if locale.current != l.label>
                                <li>
                                    <a class="dropdown-item" href="${l.url}">
                                        ${l.languageTag?upper_case}
                                    </a>
                                </li>
                            </#if>
                        </#list>
                    </ul>
                </div>
            </#if>
        </div>
    </nav>
</#macro>