<#macro cardMain header="">
    <div class="row m-0 justify-content-center align-items-center align-self-center">
        <div class="col-sm-12 col-md-6 col-lg-5">
            <div class="card my-5 border-0">
                <#if header?has_content>
                    <div class="card-header text-center border-0 bg-transparent">
                        <b class="h1">
                            ${header}
                        </b>
                    </div>
                </#if>
                <div class="card-body">
                    <#nested>
                </div>
            </div>
        </div>
    </div>
</#macro>