<#import "template.ftl" as layout>
<#import "lib/components.ftl" as components>

<@layout.registrationLayout title=msg("loginTitle",(realm.displayName!'')) displayMessage=!messagesPerField.existsError('username','password'); section>
    <#if section = "form">
        <@components.cardMain header='${msg("signIntoYourOrbitAccount")}'>

            <#if properties.hideRegistrationLinkForClients?? && properties.hideRegistrationLinkForClients?has_content>
                <#assign hideRegistrationLinkForClients=properties.hideRegistrationLinkForClients?split(",")>

                <#list hideRegistrationLinkForClients as hideRegistrationLinkForClient>
                    <#if hideRegistrationLinkForClient?trim == client.clientId>
                        <#assign hideRegistrationLink=true>
                    </#if>
                </#list>
            </#if>

            <#if realm.password??>
                <form onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">

                    <p class="text-center">
                        ${msg('phoneNumberOrEmailTitle')}
                    </p>

                    <#if !usernameHidden?? && !supportPhone??>
                        <@components.formField
                            type="text"
                            id="username"
                            name="username"
                            value="${(login.username!'')}"
                            autocomplete="off"
                            booleanAttributes=["autofocus"]
<#--                                labelText="${(!realm.loginWithEmailAllowed)?then(msg('username'), (!realm.registrationEmailAsUsername)?then(msg('usernameOrEmail'), msg('email')))}"-->
                            labelText="${(!realm.loginWithEmailAllowed)?then(msg('phoneNumberOrEmail'), (!realm.registrationEmailAsUsername)?then(msg('phoneNumberOrEmail'), msg('phoneNumberOrEmail')))}"
                            hasError=messagesPerField.existsError('username','password')
                            errorMessage="${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}"
                        />
                        <@components.formField
                            type="password"
                            id="password"
                            name="password"
                            labelText="${msg('password')}"
                            hasError=messagesPerField.existsError('username','password')
                            errorMessage="${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}"
                        />
                    </#if>

                    <div class="${properties.loginRememberMeForgotPasswordWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <@components.link href="${url.loginResetCredentialsUrl}">
                                    ${msg("doForgotPassword")}
                                </@components.link>
                            </#if>
                            <#if realm.rememberMe && !usernameHidden??>
                                <@components.formField
                                    type="checkbox"
                                    id="rememberMe"
                                    name="rememberMe"
                                    booleanAttributes=["${(login.rememberMe)???then('checked', '')}"]
                                    labelText="${msg('rememberMe')}"
                                />
                            </#if>
                        </div>

                     <#if supportPhone??>
                        <@components.formField
                            type="text"
                            id="phoneNumber"
                            name="username"
                            value="${(login.phoneNumber!'')}"
                            autocomplete="on"
                            booleanAttributes=["autofocus"]
                            labelText="${(!realm.loginWithEmailAllowed)?then(msg('phoneNumber'), (!realm.registrationEmailAsUsername)?then(msg('phoneNumberOrEmail'), msg('email')))}"
                            hasError=messagesPerField.existsError('phoneNumber','code')
                            errorMessage="${kcSanitize(messagesPerField.getFirstError('phoneNumber','code'))?no_esc}"
                        />


                         <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
                         <style>
                             .otp-field input {
                                 height: 3rem;
                                 width: 3rem;
                                 border-radius: 6px;
                                 outline: none;
                                 font-size: 1.125rem;
                                 text-align: center;
                                 border: 1px solid #ddd;
                             }
                             .otp-field input:focus {
                                 box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
                             }
                             .otp-field input::-webkit-inner-spin-button,
                             .otp-field input::-webkit-outer-spin-button {
                                 display: none;
                             }
                         </style>

                         <div>
                             <span class="${properties.kcFeedbackErrorIcon!}"></span>
                             <span class="text-danger" id="errorMessage"></span>
                         </div>

                         <input type="hidden" id="phoneActivated" name="phoneActivated" value="true">

                        <p class="text-center">
                            ${msg('enterOtpTitle')}
                        </p>
                        <div class="otp-field mb-4 d-flex flex-row justify-content-between">
                            <input type="number" />
                            <input type="number" disabled />
                            <input type="number" disabled />
                            <input type="number" disabled />
                            <input type="number" disabled />
                            <input type="number" disabled />
                        </div>

                        <input type="hidden" id="code" name="code">


                        <div class="${properties.btnWrapperClass!}">
                            <@components.button variant="secondary" onclick="sendVerificationCode();" id="sendVerificationCodeBtn">
                                ${msg("sendOtp")}
                            </@components.button>
                        </div>
                    </#if>


                    <#if auth.selectedCredential?has_content>
                        <@components.formField
                            type="hidden"
                            id="credentialId"
                            name="credentialId"
                            value="${auth.selectedCredential}"
                        />
                    </#if>

                    <div class="${properties.btnWrapperClass!}">
                        <@components.button type="submit" variant="primary" id="submit-btn">
                            ${msg("doLogIn")}
                        </@components.button>
                    </div>
                </form>
            </#if>

            <#if !usernameHidden?? && supportPhone??>
                <script type="text/javascript">
                    const inputs = document.querySelectorAll(".otp-field > input");
                    const button = document.querySelector("#submit-btn");

                    window.addEventListener("load", () => inputs[0].focus());
                    button.setAttribute("disabled", "disabled");

                    inputs[0].addEventListener("paste", function (event) {
                        event.preventDefault();

                        const pastedValue = (event.clipboardData || window.clipboardData).getData(
                            "text"
                        );
                        const otpLength = inputs.length;

                        for (let i = 0; i < otpLength; i++) {
                            if (i < pastedValue.length) {
                                inputs[i].value = pastedValue[i];
                                inputs[i].removeAttribute("disabled");
                                inputs[i].focus;
                            } else {
                                inputs[i].value = ""; // Clear any remaining inputs
                                inputs[i].focus;
                            }
                        }
                    });

                    document.getElementById("phoneNumber").addEventListener("keyup", (e) => {
                        document.getElementById("errorMessage").innerText = "";
                    })

                    inputs.forEach((input, index1) => {
                        input.addEventListener("keyup", (e) => {
                            document.getElementById("errorMessage").innerText = "";

                            const currentInput = input;
                            const nextInput = input.nextElementSibling;
                            const prevInput = input.previousElementSibling;

                            if (currentInput.value.length > 1) {
                                currentInput.value = "";
                                return;
                            }

                            if (
                                nextInput &&
                                nextInput.hasAttribute("disabled") &&
                                currentInput.value !== ""
                            ) {
                                nextInput.removeAttribute("disabled");
                                nextInput.focus();
                            }

                            if (e.key === "Backspace") {
                                inputs.forEach((input, index2) => {
                                    if (index1 <= index2 && prevInput) {
                                        input.setAttribute("disabled", true);
                                        input.value = "";
                                        prevInput.focus();
                                    }
                                });
                            }

                            button.setAttribute("disabled", "disabled");

                            let code = "";

                            inputs.forEach((input) => {
                                code = code + input.value;
                            });

                            document.getElementById("code").value = code;

                            const inputsNo = inputs.length;
                            if (!inputs[inputsNo - 1].disabled && inputs[inputsNo - 1].value !== "") {
                                button.removeAttribute("disabled");

                                return;
                            }
                        });
                    });
                </script>

                <script type="text/javascript">

                    function req(phoneNumber) {
                        const kcLocale = new URL (window.location).searchParams.get ('kc_locale');
                        const language = kcLocale ? kcLocale : "${locale.currentLanguageTag}"
                        const params = {params: {phoneNumber , language}}
                        axios.get(window.location.origin + '/realms/${realm.name}/sms/authentication-code', params)
                            .then(res => disableSend(res.data.expires_in))
                            .catch(e => {
                                document.getElementById("errorMessage").innerText = e.response.data.error
                            });
                    }

                    function disableSend(seconds) {
                        document.getElementById("sendVerificationCodeBtn").setAttribute("disabled", "disabled");
                        if (seconds <= 0) {
                            document.getElementById("sendVerificationCodeBtn").textContent = "${msg("sendOtp")}";
                            document.getElementById("sendVerificationCodeBtn").removeAttribute("disabled");

                        } else {
                            const minutes = Math.floor(seconds / 60) + '';
                            const seconds_ = seconds % 60 + '';
                            document.getElementById("sendVerificationCodeBtn").textContent ="${msg('otpExpiresIn')}"+" "+ String(minutes.padStart(2, '0') + ":" + seconds_.padStart(2, '0'));
                            setTimeout(function() {
                                disableSend(seconds - 1);
                            }, 1000);
                        }
                    }

                    function sendVerificationCode() {

                        const phoneNumber = document.getElementById('phoneNumber').value.trim();
                        if (!phoneNumber) {
                            document.getElementById("errorMessage").innerText = '${msg("requiredPhoneNumber")}';
                            document.getElementById('phoneNumber').focus();
                            return;
                        }
                        if (this.sendButtonText !== this.initSendButtonText) {
                            return;
                        }
                        req(phoneNumber);

                    }
                </script>
            </#if>

            <@components.socialProviders/>

            <#if realm.password && realm.registrationAllowed && !registrationDisabled?? && !hideRegistrationLink??>
                <div id="registration-link" class="hidden">
                    <hr>
                    <div class="${properties.textCenterClass!}">
                        <#--                    <span>-->
                        <#--                        ${msg("noAccount")}-->
                        <#--                    </span>-->
                        <@components.link href="${url.registrationUrl}">
                        <#--                        ${msg("doRegister")}-->
                            ${msg("registerNewAccount")}
                        </@components.link>
                    </div>
                </div>
                <script>
                    function showRegistrationLink() {
                        let host = new URL(new URL(document.location.toString()).searchParams.get("redirect_uri")).host;

                        let registrationLinkElement = document.getElementById("registration-link");

                        let array_of_hosts = "${properties.hideRegistrationLinkForRedirectUriHosts!''}".split(',').map(i=>i.trim());

                        if (!array_of_hosts.includes(host)) {
                            registrationLinkElement.classList.remove("hidden");
                        }
                    }

                    showRegistrationLink();
                </script>
            </#if>
        </@components.cardMain>
    </#if>
</@layout.registrationLayout>
