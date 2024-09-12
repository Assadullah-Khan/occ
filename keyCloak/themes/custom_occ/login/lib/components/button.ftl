<#macro button type="button" variant="" disabled=false props...>
    <button
            <#switch variant>
                <#case "primary">
                    class="my-1 btn btn-lg btn-primary"
                <#break>
                <#case "secondary">
                    class="my-1 btn btn-lg btn-secondary border-0" style="background: rgba(11, 106, 239, 0.10); color: #0B6AEF;"
                <#break>
                <#case "info">
                    class="my-1 btn btn-lg btn-info"
                <#break>
                <#case "danger">
                    class="my-1 btn btn-lg btn-danger"
                <#break>
                <#default>
                    class="my-1 btn btn-lg btn-default"
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