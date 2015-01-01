
<%@ page import="kwkurse.Kurs" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'kurs.label', default: 'Kurs')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-kurs" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-kurs" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list kurs">
			
				<g:if test="${kursInstance?.beschreibung}">
				<li class="fieldcontain">
					<span id="beschreibung-label" class="property-label"><g:message code="kurs.beschreibung.label" default="Beschreibung" /></span>
					
						<span class="property-value" aria-labelledby="beschreibung-label"><g:fieldValue bean="${kursInstance}" field="beschreibung"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${kursInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="kurs.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${kursInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${kursInstance?.rohstoffe}">
				<li class="fieldcontain">
					<span id="rohstoffe-label" class="property-label"><g:message code="kurs.rohstoffe.label" default="Rohstoffe" /></span>
					
						<g:each in="${kursInstance.rohstoffe}" var="r">
						<span class="property-value" aria-labelledby="rohstoffe-label"><g:link controller="rohstoff" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${kursInstance?.termin}">
				<li class="fieldcontain">
					<span id="termin-label" class="property-label"><g:message code="kurs.termin.label" default="Termin" /></span>
					
						<g:each in="${kursInstance.termin}" var="t">
						<span class="property-value" aria-labelledby="termin-label"><g:link controller="kursTermin" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:kursInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${kursInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
