<#import "lib/components.ftl" as components>

<#macro registrationLayout title=realm.displayName!'' displayMessage=true>
<!DOCTYPE html>
<html <#if realm.internationalizationEnabled> lang="${locale.currentLanguageTag}"</#if>>

<@components.head title=title/>

<body class="d-flex flex-column justify-content-between" data-bs-theme="${properties.theme!'light'}">
    <@components.nav/>

    <main>
        <@components.alerts displayMessage=displayMessage/>

        <#nested "form">
    </main>

    <@components.footer/>
</body>
</html>
</#macro>
