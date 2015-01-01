
<%@ page import="kwkurse.KursTermin" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'kursTermin.label', default: 'KursTermin')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-kursTermin" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-kursTermin" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="erinnerungVersendet" title="${message(code: 'kursTermin.erinnerungVersendet.label', default: 'Erinnerung Versendet')}" />
					
						<th><g:message code="kursTermin.kurs.label" default="Kurs" /></th>
					
						<g:sortableColumn property="kursbeginn" title="${message(code: 'kursTermin.kursbeginn.label', default: 'Kursbeginn')}" />
					
						<g:sortableColumn property="plaetze" title="${message(code: 'kursTermin.plaetze.label', default: 'Plaetze')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${kursTerminInstanceList}" status="i" var="kursTerminInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${kursTerminInstance.id}">${fieldValue(bean: kursTerminInstance, field: "erinnerungVersendet")}</g:link></td>
					
						<td>${fieldValue(bean: kursTerminInstance, field: "kurs")}</td>
					
						<td><g:formatDate date="${kursTerminInstance.kursbeginn}" /></td>
					
						<td>${fieldValue(bean: kursTerminInstance, field: "plaetze")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${kursTerminInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
