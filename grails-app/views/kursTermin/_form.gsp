<%@ page import="kwkurse.KursTermin" %>



<div class="fieldcontain ${hasErrors(bean: kursTerminInstance, field: 'erinnerungVersendet', 'error')} ">
	<label for="erinnerungVersendet">
		<g:message code="kursTermin.erinnerungVersendet.label" default="Erinnerung Versendet" />
		
	</label>
	<g:checkBox name="erinnerungVersendet" value="${kursTerminInstance?.erinnerungVersendet}" />

</div>

<div class="fieldcontain ${hasErrors(bean: kursTerminInstance, field: 'kurs', 'error')} required">
	<label for="kurs">
		<g:message code="kursTermin.kurs.label" default="Kurs" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="kurs" name="kurs.id" from="${kwkurse.Kurs.list()}" optionKey="id" required="" value="${kursTerminInstance?.kurs?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: kursTerminInstance, field: 'kursbeginn', 'error')} required">
	<label for="kursbeginn">
		<g:message code="kursTermin.kursbeginn.label" default="Kursbeginn" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="kursbeginn" precision="day"  value="${kursTerminInstance?.kursbeginn}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: kursTerminInstance, field: 'plaetze', 'error')} required">
	<label for="plaetze">
		<g:message code="kursTermin.plaetze.label" default="Plaetze" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="plaetze" type="number" value="${kursTerminInstance.plaetze}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: kursTerminInstance, field: 'teilnehmer', 'error')} ">
	<label for="teilnehmer">
		<g:message code="kursTermin.teilnehmer.label" default="Teilnehmer" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${kursTerminInstance?.teilnehmer?}" var="t">
    <li><g:link controller="kursTeilnahme" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="kursTeilnahme" action="create" params="['kursTermin.id': kursTerminInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'kursTeilnahme.label', default: 'KursTeilnahme')])}</g:link>
</li>
</ul>


</div>

