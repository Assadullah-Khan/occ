<#macro terms fullPage=false>
    <#if fullPage>
        ${kcSanitize(msg("termsText"))?no_esc}
    <#else>
        <div class="mb-3">
            <div class="form-label">
                ${msg("termsTitle")}
            </div>
            <div id="termsText" class="form-control" style="max-height: 10rem; overflow-y: auto;">
                ${kcSanitize(msg("termsText"))?no_esc}
            </div>
        </div>
    </#if>
</#macro>