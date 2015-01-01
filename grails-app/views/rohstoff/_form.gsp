<%@ page import="kwkurse.Rohstoff" %>



<div class="fieldcontain ${hasErrors(bean: rohstoffInstance, field: 'kurse', 'error')} ">
	<label for="kurse">
		<g:message code="rohstoff.kurse.label" default="Kurse" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: rohstoffInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="rohstoff.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${rohstoffInstance?.name}"/>

</div>

