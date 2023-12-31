<#-- 
	eTWIG - The event and banner management software for residential halls and student unions.
	copyright: Copyright (c) 2024 Steven Webb, eTWIG developers [etwig@grinecraft.net]
	license: MIT
	author: Steven Webb [xiaoancloud@outlook.com]
	website: https://etwig.grinecraft.net
	function: The error page in JSON format.
   -->
   
<#if error.trace?has_content>
	<#assign trace = error.trace?replace("\t", " ")>
	<#assign trace = trace?replace("\n", " ")>
	<#assign trace = trace?replace("\"", "'")>
	<#assign exception = trace?split(" at ")>
</#if>

{
	"status": ${error.status},
	"error": "${error.error}",
    "path": <#if path?has_content>"${path}"<#else>null</#if>,
    "exception": <#if exception?has_content && exception?size gt 0>"${exception[0]}"<#else>null</#if>,
    "trace": <#if error.status?starts_with("5") && trace?has_content>"${trace}"<#else>null</#if>
}