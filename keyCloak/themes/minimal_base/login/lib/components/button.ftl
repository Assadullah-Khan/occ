<#macro button type="button" variant="" disabled=false props...>
    <button
            <#switch variant>
                <#case "primary">
                    class="my-1 btn btn-primary"
                <#break>
                <#case "secondary">
                    class="my-1 btn btn-secondary"
                <#break>
                <#case "info">
                    class="my-1 btn btn-info"
                <#break>
                <#case "danger">
                    class="my-1 btn btn-danger"
                <#break>
                <#default>
                    class="my-1 btn btn-default"
            </#switch>

            type="${type}"
            ${disabled?then("disabled", "")}

            <#list props as attrName, attrVal>
                ${attrName}="${attrVal}"
            </#list>
    >
        <#nested>
    </button>
</#macro>