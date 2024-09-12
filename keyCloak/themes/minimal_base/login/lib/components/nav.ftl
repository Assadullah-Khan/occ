<#import "../components.ftl" as components>

<#macro nav>
    <nav class="navbar bg-body-secondary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <@components.logo />
            </a>

            <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        ${locale.current}
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end text-end">
                        <#list locale.supported as l>
                            <#if locale.current != l.label>
                                <li>
                                    <a class="dropdown-item" href="${l.url}">
                                        ${l.label}
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