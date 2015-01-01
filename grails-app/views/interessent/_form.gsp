<%@ page import="kwkurse.Interessent" %>



<div class="fieldcontain ${hasErrors(bean: interessentInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="interessent.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${kwkurse.Person.list()}" optionKey="id" required="" value="${interessentInstance?.person?.id}" class="many-to-one"/>

</div>

