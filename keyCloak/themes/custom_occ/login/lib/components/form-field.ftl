<#macro formField
<#--Formfied required attributes-->
type
id
name
<#--Formfield boolean attributes-->
booleanAttributes=[]

labelText=""
hasError=false
errorMessage=""

helperTextBefore=""
helperTextAfter=""

<#--{'': 'Select an option', 'value-1': 'Label 1', 'value-2': 'Label 2'}-->
selectOptions={}
values=[]

<#--Formfield other key="value" attributes-->
otherAttributes...
>
    <#switch type>
        <#case "select">
            <div class="mb-3">
                <@label for=id labelText=labelText forRequiredField=booleanAttributes?seq_contains("required") />
                <@helperText text=helperTextBefore />
                <select
                        id="${id}"
                        name="${name}"
                        <@attributes attributes=otherAttributes booleanAttributes=booleanAttributes />
                        class="form-select ${hasError?then('is-invalid', '')}"
                >
                    <#if selectOptions??>
                        <#list selectOptions as value, label>
                            <option value="${value}" ${values?seq_contains(value)?then('selected', '')}>${label}</option>
                        </#list>
                    </#if>
                </select>
                <@helperText text=helperTextAfter />
                <@error for=id hasError=hasError errorMessage=errorMessage />
            </div>
            <#break>
        <#case "textarea">
            <div class="mb-3">
                <@label for=id labelText=labelText forRequiredField=booleanAttributes?seq_contains("required") />
                <@helperText text=helperTextBefore />
                <textarea
                    id="${id}"
                    name="${name}"
                    <@attributes attributes=otherAttributes booleanAttributes=booleanAttributes />
                    class="form-control form-control-lg ${hasError?then('is-invalid', '')}"
                >${otherAttributes.value!''}</textarea>
                <@helperText text=helperTextAfter />
                <@error for=id hasError=hasError errorMessage=errorMessage />
            </div>
            <#break>
        <#case "checkbox">
        <#case "radio">
            <div class="mb-3 form-check form-switch">
                <input type="${type}"
                       id="${id}"
                       name="${name}"
                        <@attributes attributes=otherAttributes booleanAttributes=booleanAttributes />
                       class="form-control form-control-lg form-check-input"
                />
                <@label for=id labelText=labelText forRequiredField=booleanAttributes?seq_contains("required") />
            </div>
            <#break>
        <#case "password">
            <div class="mb-3">
                <@helperText text=helperTextBefore />
                <div class="fom-floating">
                    <div class="form-control border-0" style="position: relative; padding: 0; display: flex; align-items: center">
                        <div class="form-floating form-control border-0 p-0">
                            <input type="${type}"
                                   id="${id}"
                                   name="${name}"
                                    <@attributes attributes=otherAttributes booleanAttributes=booleanAttributes />
                                   class="form-control form-control-lg ${hasError?then('border border-danger focus-ring focus-ring-danger', '')}"
                                   style="flex-grow:2; width: 100%"
                                   onkeyup="passwordValidation();"
                                   placeholder=""
                            />
                            <@label for=id labelText=labelText forRequiredField=booleanAttributes?seq_contains("required") />
                        </div>
                        <span style="position: absolute; right: 1rem; color: #2D77AF" onclick="toggle(this, '${id}');">
                        <svg class="" width="24" height="24" viewBox="0 0 24 24"
                             fill="none" class="toggle-icon">
                            <path
                                    d="M21.375 16.406C21.2893 16.4549 21.1948 16.4863 21.097 16.4986C20.9991 16.511 20.8998 16.5038 20.8047 16.4777C20.7097 16.4516 20.6207 16.407 20.5428 16.3464C20.465 16.2858 20.3999 16.2105 20.3512 16.1248L18.57 13.0123C17.5344 13.7125 16.392 14.24 15.1875 14.5741L15.7378 17.876C15.754 17.9732 15.7509 18.0727 15.7287 18.1687C15.7065 18.2647 15.6656 18.3554 15.6083 18.4356C15.551 18.5158 15.4784 18.5839 15.3948 18.636C15.3112 18.6882 15.2181 18.7233 15.1209 18.7395C15.0809 18.746 15.0405 18.7495 15 18.7498C14.8225 18.7495 14.6509 18.6863 14.5157 18.5715C14.3804 18.4567 14.2903 18.2976 14.2612 18.1226L13.7203 14.8807C12.5795 15.0395 11.4223 15.0395 10.2815 14.8807L9.74058 18.1226C9.71147 18.2979 9.62103 18.4573 9.48538 18.5721C9.34974 18.687 9.1777 18.75 8.99995 18.7498C8.95849 18.7496 8.91712 18.7462 8.8762 18.7395C8.77898 18.7233 8.6859 18.6882 8.60227 18.636C8.51864 18.5839 8.44611 18.5158 8.38882 18.4356C8.33153 18.3554 8.29061 18.2647 8.26839 18.1687C8.24617 18.0727 8.24309 17.9732 8.25933 17.876L8.81245 14.5741C7.60835 14.2389 6.46664 13.7105 5.43183 13.0095L3.6562 16.1248C3.55675 16.2981 3.39252 16.4248 3.19965 16.477C3.00678 16.5292 2.80107 16.5027 2.62776 16.4032C2.45446 16.3038 2.32777 16.1395 2.27555 15.9467C2.22333 15.7538 2.24987 15.5481 2.34933 15.3748L4.22433 12.0935C3.56573 11.5245 2.96013 10.897 2.41495 10.2185C2.34696 10.1426 2.29516 10.0536 2.2627 9.95704C2.23024 9.86045 2.2178 9.75824 2.22616 9.65668C2.23451 9.55512 2.26347 9.45632 2.31127 9.36632C2.35908 9.27633 2.42472 9.19701 2.5042 9.13323C2.58367 9.06944 2.67531 9.02252 2.77353 8.99533C2.87174 8.96815 2.97446 8.96126 3.07542 8.97509C3.17639 8.98892 3.27347 9.02318 3.36075 9.07578C3.44804 9.12838 3.52368 9.19821 3.58308 9.28102C5.13933 11.2066 7.86183 13.4998 12 13.4998C16.1381 13.4998 18.8606 11.2038 20.4168 9.28102C20.4755 9.19652 20.551 9.125 20.6386 9.07092C20.7261 9.01684 20.8238 8.98135 20.9257 8.96666C21.0275 8.95198 21.1313 8.9584 21.2306 8.98555C21.3298 9.01269 21.4224 9.05997 21.5026 9.12443C21.5828 9.1889 21.6489 9.26919 21.6968 9.36029C21.7446 9.45139 21.7732 9.55137 21.7807 9.65399C21.7883 9.75661 21.7746 9.85969 21.7406 9.95681C21.7066 10.0539 21.653 10.143 21.5831 10.2185C21.0379 10.897 20.4323 11.5245 19.7737 12.0935L21.6487 15.3748C21.699 15.4603 21.7319 15.555 21.7454 15.6533C21.7588 15.7516 21.7527 15.8517 21.7272 15.9476C21.7017 16.0435 21.6575 16.1334 21.597 16.2121C21.5366 16.2908 21.4611 16.3567 21.375 16.406Z"
                                    fill="#808080" />
                        </svg>
                        <svg class="hidden" xmlns="http://www.w3.org/2000/svg" width="32"
                             height="32" viewBox="0 0 32 32" fill="none">
                            <path
                                    d="M30.9137 15.595C30.87 15.4963 29.8112 13.1475 27.4575 10.7937C24.3212 7.6575 20.36 6 16 6C11.64 6 7.67874 7.6575 4.54249 10.7937C2.18874 13.1475 1.12499 15.5 1.08624 15.595C1.02938 15.7229 1 15.8613 1 16.0012C1 16.1412 1.02938 16.2796 1.08624 16.4075C1.12999 16.5062 2.18874 18.8538 4.54249 21.2075C7.67874 24.3425 11.64 26 16 26C20.36 26 24.3212 24.3425 27.4575 21.2075C29.8112 18.8538 30.87 16.5062 30.9137 16.4075C30.9706 16.2796 31 16.1412 31 16.0012C31 15.8613 30.9706 15.7229 30.9137 15.595ZM16 24C12.1525 24 8.79124 22.6012 6.00874 19.8438C4.86704 18.7084 3.89572 17.4137 3.12499 16C3.89551 14.5862 4.86686 13.2915 6.00874 12.1562C8.79124 9.39875 12.1525 8 16 8C19.8475 8 23.2087 9.39875 25.9912 12.1562C27.1352 13.2912 28.1086 14.5859 28.8812 16C27.98 17.6825 24.0537 24 16 24ZM16 10C14.8133 10 13.6533 10.3519 12.6666 11.0112C11.6799 11.6705 10.9108 12.6075 10.4567 13.7039C10.0026 14.8003 9.88377 16.0067 10.1153 17.1705C10.3468 18.3344 10.9182 19.4035 11.7573 20.2426C12.5965 21.0818 13.6656 21.6532 14.8294 21.8847C15.9933 22.1162 17.1997 21.9974 18.2961 21.5433C19.3924 21.0892 20.3295 20.3201 20.9888 19.3334C21.6481 18.3467 22 17.1867 22 16C21.9983 14.4092 21.3657 12.884 20.2408 11.7592C19.1159 10.6343 17.5908 10.0017 16 10ZM16 20C15.2089 20 14.4355 19.7654 13.7777 19.3259C13.1199 18.8864 12.6072 18.2616 12.3045 17.5307C12.0017 16.7998 11.9225 15.9956 12.0768 15.2196C12.2312 14.4437 12.6122 13.731 13.1716 13.1716C13.731 12.6122 14.4437 12.2312 15.2196 12.0769C15.9956 11.9225 16.7998 12.0017 17.5307 12.3045C18.2616 12.6072 18.8863 13.1199 19.3259 13.7777C19.7654 14.4355 20 15.2089 20 16C20 17.0609 19.5786 18.0783 18.8284 18.8284C18.0783 19.5786 17.0609 20 16 20Z"
                                    fill="#1A1A1A" />
                        </svg>
                    </span>
                    </div>
                </div>
                <@helperText text=helperTextAfter />
                <@error for=id hasError=hasError errorMessage=errorMessage />
                <div class="error-message mt-1 ml-1 d-none" id="password-validations">
                    <ul>
                        <li class="" id="password-length">
                            Password Must Contain At least eight letters
                        </li>
                        <li class="" id="password-uppercase">
                            Password Must Contain At least one Uppercase letter
                        </li>
                        <li id="password-special-letter">
                            Password Must Contain At least one special letter
                        </li>
                        <li id="password-number">
                            Password Must Contain At least one number
                        </li>
                    </ul>
                </div>
            </div>
            <#break>
        <#default>
            <div class="mb-3">
                <@helperText text=helperTextBefore />
                <div class="form-floating">
                    <input type="${type}"
                           id="${id}"
                           name="${name}"
                            <@attributes attributes=otherAttributes booleanAttributes=booleanAttributes />
                           class="form-control form-control-lg ${hasError?then('is-invalid', '')}"
                           placeholder=""
                    />
                    <@label for=id labelText=labelText forRequiredField=booleanAttributes?seq_contains("required") />
                </div>
                <@helperText text=helperTextAfter />
                <@error for=id hasError=hasError errorMessage=errorMessage />
            </div>
    </#switch>
</#macro>

<#macro label for labelText="" forRequiredField=false>
    <#if labelText?has_content>
        <label for="${for}">
            ${labelText?cap_first}
            <#if forRequiredField>
                <span class="text-danger">*</span>
            </#if>
        </label>
    </#if>
</#macro>

<#macro attributes attributes booleanAttributes=[]>
    <#if (attributes?size > 0)>
        <#list attributes as name, value>
            <#if value?has_content>
                ${name}="${value}"
            </#if>
        </#list>
    </#if>
    <#if (booleanAttributes?size > 0)>
        <#list booleanAttributes as attribute>
            <#if attribute?has_content>
                ${attribute}
            </#if>
        </#list>
    </#if>
</#macro>

<#macro error for hasError errorMessage="">
    <#if hasError>
        <label for="${for}" class="text-danger">
            ${errorMessage!"field error"}
        </label>
    </#if>
</#macro>

<#macro helperText text="">
    <#if text?has_content>
        <div class="form-text">
            ${text}
        </div>
    </#if>
</#macro>