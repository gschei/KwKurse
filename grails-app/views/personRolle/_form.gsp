<%@ page import="kwkurse.PersonRolle" %>



<div class="fieldcontain ${hasErrors(bean: personRolleInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="personRolle.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${kwkurse.Person.list()}" optionKey="id" required="" value="${personRolleInstance?.person?.id}" class="many-to-one"/>

</div>

