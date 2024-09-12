<#macro cardMain header="">
    <div class="row m-0 justify-content-center align-items-center align-self-center">
        <div class="col-sm-12 col-md-6 col-lg-5">
            <div class="card my-5">
                <#if header?has_content>
                    <div class="card-header">
                        <h1 class="h2">
                            ${header}
                        </h1>
                    </div>
                </#if>
                <div class="card-body">
                    <#nested>
                </div>
            </div>
        </div>
    </div>
</#macro>