<#import "lib/components.ftl" as components>

<#macro registrationLayout title=realm.displayName!'' displayMessage=true>
<!DOCTYPE html>
<html <#if realm.internationalizationEnabled> lang="${locale.currentLanguageTag}" <#if locale.currentLanguageTag == 'ar'> dir="rtl" </#if></#if>>

<@components.head title=title/>

<body class="d-flex flex-column" data-bs-theme="${properties.theme!'light'}">
    <@components.nav/>

    <div class="flex-grow-1 d-flex flex-column justify-content-center">
        <main>
            <@components.alerts displayMessage=displayMessage/>

            <#nested "form">
        </main>
    </div>

<#--    <@components.footer/>-->

    <script>
        const loginID = document.getElementById('loginId');
        const password = document.getElementById('password');
        const submitBtn = document.getElementById("submit-btn");
        const passwordValidations = document.getElementById('password-validations');
        var passwordHasMinLength;
        var passwordHasNumber;
        var passwordHasSpecialLetter;
        var passwordHasUpperCase;
        var isVaildLoginId = true;
        var isVaildPassword;
        function submit() {
            const isCorrect = isVaildLoginId && isVaildPassword;
            if (isCorrect) {
                const loader = document.getElementById("loader");
                const formContainer = document.getElementById('wrapper');
                loader.classList.remove("d-none");
                formContainer.classList.add("d-none");
                setTimeout(() => {
                    document.getElementsByClassName("loader")[0].classList.add('d-none');
                    document.getElementsByClassName("success-loader")[0].classList.remove('d-none');

                }, 3000);
            }
        }
        function hideShowPassword() {
            const showPasswordIcon = document.getElementById('show-password-icon');
            const hidePasswordIcon = document.getElementById('hide-password-icon');
            const password = document.getElementById('password');
            if (showPasswordIcon.classList.contains('d-none')) {
                showPasswordIcon.classList.remove("d-none");
                hidePasswordIcon.classList.add("d-none");
                password.type = 'text';
            } else {
                showPasswordIcon.classList.add("d-none");
                hidePasswordIcon.classList.remove("d-none");
                password.type = 'password';
            }
        }
        function passwordValidation() {
            passwordHasUpperCase = hasUpperCase(password.value);
            passwordHasMinLength = hasMinLength(password.value);
            passwordHasSpecialLetter = hasSpecialChar(password.value);
            passwordHasNumber = hasNumber(password.value);
            if (!passwordHasMinLength || !passwordHasNumber || !passwordHasSpecialLetter || !passwordHasUpperCase) {
                isVaildPassword = false;
                passwordValidations.classList.remove('d-none');
            } else {
                isVaildPassword = true;
                passwordValidations.classList.add('d-none');
            }
            if (isVaildLoginId && isVaildLoginId) {
                submitBtn.classList.remove('disabled');
                submitBtn.disabled = false;
            } else {
                submitBtn.classList.add('disabled');
                submitBtn.disabled = true;
            }


        }
        function hasMinLength(val) {
            if (val.length >= 8) {
                document.getElementById('password-length').classList.add("pass");
            } else {
                document.getElementById('password-length').classList.remove("pass");
            }
            return val.length >= 8;
        }

        function hasUpperCase(val) {
            if (/[A-Z]/.test(val)) {
                document.getElementById('password-uppercase').classList.add("pass");
            } else {
                document.getElementById('password-uppercase').classList.remove("pass");
            }
            return /[A-Z]/.test(val);
        }

        function hasNumber(val) {
            if (/\d/.test(val)) {
                document.getElementById('password-number').classList.add("pass");
            } else {
                document.getElementById('password-number').classList.remove("pass");
            }
            return /\d/.test(val);
        }

        function hasSpecialChar(val) {
            if (/[!@#$%^&*(),.?":{}|<>]/.test(val)) {
                document.getElementById('password-special-letter').classList.add("pass");
            } else {
                document.getElementById('password-special-letter').classList.remove("pass");
            }
            return /[!@#$%^&*(),.?":{}|<>]/.test(val);
        }
        function isVaildEmail(val) {
            return /^[\w -\.]+@([\w -]+\.)+[\w -]{2,4}$/.test(val);
        }
        function isVaildPhone(val) {
            return /^\+?(\d{1,3})?[-.\s]?(\(?\d{1,4}\)?[-.\s]?)?(\d{1,4}[-.\s]?)*\d{1,9}$/.test(val);

        }
        function validateLoginId() {
            if (!isVaildEmail(loginID.value) && !isVaildPhone(loginID.value)) {
                isVaildLoginId = false;
                isVaildLoginId = true;
                loginID.classList.add("error");
            } else {
                isVaildLoginId = true;
                loginID.classList.remove("error");
            }
            if (isVaildLoginId && isVaildLoginId) {
                submitBtn.classList.remove('disabled');
                submitBtn.disabled = false;
            } else {
                submitBtn.classList.add('disabled');
                submitBtn.disabled = true;
            }

        }
    </script>
</body>
</html>
</#macro>
