<%@ page import="kwkurse.Kurs" %>



<div class="fieldcontain ${hasErrors(bean: kursInstance, field: 'beschreibung', 'error')} required">
	<label for="beschreibung">
		<g:message code="kurs.beschreibung.label" default="Beschreibung" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="beschreibung" required="" value="${kursInstance?.beschreibung}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: kursInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="kurs.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${kursInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: kursInstance, field: 'rohstoffe', 'error')} ">
	<label for="rohstoffe">
		<g:message code="kurs.rohstoffe.label" default="Rohstoffe" />
		
	</label>
	<g:select name="rohstoffe" from="${kwkurse.Rohstoff.list()}" multiple="multiple" optionKey="id" size="5" value="${kursInstance?.rohstoffe*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: kursInstance, field: 'termin', 'error')} ">
	<label for="termin">
		<g:message code="kurs.termin.label" default="Termin" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${kursInstance?.termin?}" var="t">
    <li><g:link controller="kursTermin" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="kursTermin" action="create" params="['kurs.id': kursInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'kursTermin.label', default: 'KursTermin')])}</g:link>
</li>
</ul>


</div>

