
<%@ page import="kwkurse.KursTeilnahme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'kursTeilnahme.label', default: 'KursTeilnahme')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-kursTeilnahme" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-kursTeilnahme" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list kursTeilnahme">
			
				<g:if test="${kursTeilnahmeInstance?.bezahlt}">
				<li class="fieldcontain">
					<span id="bezahlt-label" class="property-label"><g:message code="kursTeilnahme.bezahlt.label" default="Bezahlt" /></span>
					
						<span class="property-value" aria-labelledby="bezahlt-label"><g:formatBoolean boolean="${kursTeilnahmeInstance?.bezahlt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${kursTeilnahmeInstance?.kurstermin}">
				<li class="fieldcontain">
					<span id="kurstermin-label" class="property-label"><g:message code="kursTeilnahme.kurstermin.label" default="Kurstermin" /></span>
					
						<span class="property-value" aria-labelledby="kurstermin-label"><g:link controller="kursTermin" action="show" id="${kursTeilnahmeInstance?.kurstermin?.id}">${kursTeilnahmeInstance?.kurstermin?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${kursTeilnahmeInstance?.teilnehmer}">
				<li class="fieldcontain">
					<span id="teilnehmer-label" class="property-label"><g:message code="kursTeilnahme.teilnehmer.label" default="Teilnehmer" /></span>
					
						<span class="property-value" aria-labelledby="teilnehmer-label"><g:link controller="kunde" action="show" id="${kursTeilnahmeInstance?.teilnehmer?.id}">${kursTeilnahmeInstance?.teilnehmer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:kursTeilnahmeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${kursTeilnahmeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
