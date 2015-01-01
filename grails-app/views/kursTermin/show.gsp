
<%@ page import="kwkurse.KursTermin" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'kursTermin.label', default: 'KursTermin')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-kursTermin" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-kursTermin" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list kursTermin">
			
				<g:if test="${kursTerminInstance?.erinnerungVersendet}">
				<li class="fieldcontain">
					<span id="erinnerungVersendet-label" class="property-label"><g:message code="kursTermin.erinnerungVersendet.label" default="Erinnerung Versendet" /></span>
					
						<span class="property-value" aria-labelledby="erinnerungVersendet-label"><g:formatBoolean boolean="${kursTerminInstance?.erinnerungVersendet}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${kursTerminInstance?.kurs}">
				<li class="fieldcontain">
					<span id="kurs-label" class="property-label"><g:message code="kursTermin.kurs.label" default="Kurs" /></span>
					
						<span class="property-value" aria-labelledby="kurs-label"><g:link controller="kurs" action="show" id="${kursTerminInstance?.kurs?.id}">${kursTerminInstance?.kurs?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${kursTerminInstance?.kursbeginn}">
				<li class="fieldcontain">
					<span id="kursbeginn-label" class="property-label"><g:message code="kursTermin.kursbeginn.label" default="Kursbeginn" /></span>
					
						<span class="property-value" aria-labelledby="kursbeginn-label"><g:formatDate date="${kursTerminInstance?.kursbeginn}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${kursTerminInstance?.plaetze}">
				<li class="fieldcontain">
					<span id="plaetze-label" class="property-label"><g:message code="kursTermin.plaetze.label" default="Plaetze" /></span>
					
						<span class="property-value" aria-labelledby="plaetze-label"><g:fieldValue bean="${kursTerminInstance}" field="plaetze"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${kursTerminInstance?.teilnehmer}">
				<li class="fieldcontain">
					<span id="teilnehmer-label" class="property-label"><g:message code="kursTermin.teilnehmer.label" default="Teilnehmer" /></span>
					
						<g:each in="${kursTerminInstance.teilnehmer}" var="t">
						<span class="property-value" aria-labelledby="teilnehmer-label"><g:link controller="kursTeilnahme" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:kursTerminInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${kursTerminInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
