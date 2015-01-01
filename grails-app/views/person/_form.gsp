<%@ page import="kwkurse.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="person.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${personInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'geburtsdatum', 'error')} required">
	<label for="geburtsdatum">
		<g:message code="person.geburtsdatum.label" default="Geburtsdatum" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="geburtsdatum" precision="day"  value="${personInstance?.geburtsdatum}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'geschlecht', 'error')} required">
	<label for="geschlecht">
		<g:message code="person.geschlecht.label" default="Geschlecht" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="geschlecht" required="" value="${personInstance?.geschlecht}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'nachname', 'error')} required">
	<label for="nachname">
		<g:message code="person.nachname.label" default="Nachname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nachname" required="" value="${personInstance?.nachname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'newsletter', 'error')} ">
	<label for="newsletter">
		<g:message code="person.newsletter.label" default="Newsletter" />
		
	</label>
	<g:checkBox name="newsletter" value="${personInstance?.newsletter}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'vorname', 'error')} required">
	<label for="vorname">
		<g:message code="person.vorname.label" default="Vorname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="vorname" required="" value="${personInstance?.vorname}"/>

</div>

