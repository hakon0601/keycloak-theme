<#import "template.ftl" as layout>
<script src="https://cdn.ravenjs.com/3.26.2/raven.min.js" crossorigin="anonymous"></script>
<script>
Raven.config('https://28e5774f7d8e47b2981817358f5b6dfd@origodigi-sentry.k8s.oslo.kommune.no/14').install();
Raven.setExtraContext({userAgent: navigator.userAgent, appVersion: navigator.appVersion, platform: navigator.platform, vendor: navigator.vendor});
Raven.captureMessage("keycloak error");
</script>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
        <div id="kc-error-message">
            <p class="instruction">${message.summary}</p>
            <#if client?? && client.baseUrl?has_content>
                <p><a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>
