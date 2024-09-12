<#import "template.ftl" as layout>
<#import "lib/components.ftl" as components>
<#import "lib/commons.ftl" as commons>

<@layout.registrationLayout displayMessage=messagesPerField.exists('global'); section>
	<#if properties.showPasswordFieldForClients?? && properties.showPasswordFieldForClients?has_content>
		<#assign showPasswordFieldForClients=properties.showPasswordFieldForClients?split(",")>

		<#list showPasswordFieldForClients as showPasswordFieldForClient>
			<#if showPasswordFieldForClient?trim == client.clientId>
				<#assign showPasswordField=true>
			</#if>
		</#list>
	</#if>

    <#if section = "form">
		<@components.cardMain header="${msg('createNewOrbitAccount')}">
			<form action="${url.registrationAction}" method="post">

				<div class="text-center mb-4">
					${msg("registerWithMobileOrEmailAndPassword")}
				</div>

				<#if phoneNumberRequired??>
					<@components.formField
						type="text"
						id="phoneNumber"
						name="phoneNumber"
						value="${(login.phoneNumber!'')}"
						autocomplete="on"
						booleanAttributes=["autofocus"]
						labelText="${(!realm.loginWithEmailAllowed)?then(msg('phoneNumber'), (!realm.registrationEmailAsUsername)?then(msg('phoneNumberOrEmail'), msg('email')))}"
						hasError=messagesPerField.existsError('phoneNumber','registerCode')
						errorMessage="${kcSanitize(messagesPerField.getFirstError('phoneNumber','registerCode'))?no_esc}"
					/>
				</#if>
				<#if passwordRequired??>
					<#if showPasswordField??>
						<@components.formField
							type="password"
							id="password"
							name="password"
							autocomplete="new-password"
							booleanAttributes=["required"]
							labelText="${msg('password')}"
							hasError=messagesPerField.existsError('password')
							errorMessage="${kcSanitize(messagesPerField.get('password'))?no_esc}"
							onkeyup="updatePasswordConfirm(this);"
						/>
					<#else>
						<@components.formField
							type="hidden"
							id="password"
							name="password"
							onkeyup="updatePasswordConfirm(this);"
						/>
					</#if>
					<@components.formField
						type="hidden"
						id="password-confirm"
						name="password-confirm"
<#--						autocomplete="new-password"-->
<#--						booleanAttributes=[""]-->
<#--						labelText="${msg('passwordConfirm')}"-->
<#--						hasError=messagesPerField.existsError('password-confirm')-->
<#--						errorMessage="${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}"-->
					/>
				</#if>

				<#if termsAcceptanceRequired??>
					<@components.terms/>
					<@components.formField
						type="checkbox"
						id="termsAccepted"
						name="termsAccepted"
						booleanAttributes=["required", "${(login.termsAccepted)???then('checked', '')}"]
						labelText="${msg('acceptTerms')}"
						hasError=messagesPerField.existsError('termsAccepted')
						errorMessage="${kcSanitize(messagesPerField.get('termsAccepted'))?no_esc}"
					/>
				</#if>


				<@components.recaptcha/>

				<#if verifyPhone??>
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

					<#if messagesPerField.existsError('registerCode')>
						<div>
							<span class="${properties.kcFeedbackErrorIcon!}"></span>
							<span class="text-danger" id="errorMessage">
								${kcSanitize(messagesPerField.get('registerCode'))?no_esc}
							</span>
						</div>
					</#if>

					<input type="hidden" id="code" name="code">


					<div class="${properties.btnWrapperClass!}">
						<@components.button variant="secondary" onclick="sendVerificationCode();" id="sendVerificationCodeBtn">
							${msg("sendOtp")}
						</@components.button>
					</div>
				</#if>

				<div class="${properties.btnWrapperClass!}">
					<@components.button type="submit" variant="primary" id="submit-btn">
						${msg("doRegister")}
					</@components.button>
				</div>

			</form>

			<#if verifyPhone??>
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
						axios.get(window.location.origin + '/realms/${realm.name}/sms/registration-code', params)
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
							document.getElementById("sendVerificationCodeBtn").textContent = "${msg('otpExpiresIn')}"+" "+ String(minutes.padStart(2, '0') + ":" + seconds_.padStart(2, '0'));
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

			<script type="text/javascript">
				function updatePasswordConfirm (e) {
					document.getElementById("password-confirm").value = e.value;
				}

				function generatePassword() {
					var length = 10,
							charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+?|><~`:;'-=",
							retVal = "";
					for (var i = 0, n = charset.length; i < length; ++i) {
						retVal += charset.charAt(Math.floor(Math.random() * n));
					}
					return retVal;
				}

				document.addEventListener('readystatechange', event => {
					if (event.target.readyState === "complete") {
						let password = generatePassword();
						document.getElementById("password").value = password;
						document.getElementById("password-confirm").value = password;
					}
				});
			</script>

			<@components.socialProviders/>

			<hr/>
			<div class="${properties.textCenterClass!}">
				<@components.link href="${url.loginUrl}">
					${kcSanitize(msg("backToLogin"))?no_esc}
				</@components.link>
			</div>
		</@components.cardMain>
    </#if>
</@layout.registrationLayout>
