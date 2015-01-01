
<%@ page import="kwkurse.KursTeilnahme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'kursTeilnahme.label', default: 'KursTeilnahme')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-kursTeilnahme" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-kursTeilnahme" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="bezahlt" title="${message(code: 'kursTeilnahme.bezahlt.label', default: 'Bezahlt')}" />
					
						<th><g:message code="kursTeilnahme.kurstermin.label" default="Kurstermin" /></th>
					
						<th><g:message code="kursTeilnahme.teilnehmer.label" default="Teilnehmer" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${kursTeilnahmeInstanceList}" status="i" var="kursTeilnahmeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${kursTeilnahmeInstance.id}">${fieldValue(bean: kursTeilnahmeInstance, field: "bezahlt")}</g:link></td>
					
						<td>${fieldValue(bean: kursTeilnahmeInstance, field: "kurstermin")}</td>
					
						<td>${fieldValue(bean: kursTeilnahmeInstance, field: "teilnehmer")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${kursTeilnahmeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
