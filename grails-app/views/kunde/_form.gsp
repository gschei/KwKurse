<%@ page import="kwkurse.Kunde" %>



<div class="fieldcontain ${hasErrors(bean: kundeInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="kunde.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${kwkurse.Person.list()}" optionKey="id" required="" value="${kundeInstance?.person?.id}" class="many-to-one"/>

</div>

