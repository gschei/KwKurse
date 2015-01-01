<%@ page import="kwkurse.KursTeilnahme" %>



<div class="fieldcontain ${hasErrors(bean: kursTeilnahmeInstance, field: 'bezahlt', 'error')} ">
	<label for="bezahlt">
		<g:message code="kursTeilnahme.bezahlt.label" default="Bezahlt" />
		
	</label>
	<g:checkBox name="bezahlt" value="${kursTeilnahmeInstance?.bezahlt}" />

</div>

<div class="fieldcontain ${hasErrors(bean: kursTeilnahmeInstance, field: 'kurstermin', 'error')} required">
	<label for="kurstermin">
		<g:message code="kursTeilnahme.kurstermin.label" default="Kurstermin" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="kurstermin" name="kurstermin.id" from="${kwkurse.KursTermin.list()}" optionKey="id" required="" value="${kursTeilnahmeInstance?.kurstermin?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: kursTeilnahmeInstance, field: 'teilnehmer', 'error')} required">
	<label for="teilnehmer">
		<g:message code="kursTeilnahme.teilnehmer.label" default="Teilnehmer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="teilnehmer" name="teilnehmer.id" from="${kwkurse.Kunde.list()}" optionKey="id" required="" value="${kursTeilnahmeInstance?.teilnehmer?.id}" class="many-to-one"/>

</div>

