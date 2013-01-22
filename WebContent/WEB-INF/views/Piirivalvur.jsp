<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">

<script type="text/javascript" >
function deleteRecord() {
	document.piirivalvur.action="<c:url value="/DeletePiirivalvur" />";  
	document.piirivalvur.method="POST";  
	document.piirivalvur.submit();
}
function addRecord(id) {
	if (id != -1) {
		document.piirivalvur.action="<c:url value="/ModifyPiirivalvur" />";
		document.piirivalvur.method="POST";
		document.piirivalvur.submit();
	} else {
		document.piirivalvur.action="<c:url value="/AddPiirivalvur" />";  
		document.piirivalvur.method="POST";  
		document.piirivalvur.submit();
	}
}
</script>

<title><spring:message code="piirivalvur.title" /></title>
</head>
<body>
	<form:form name="piirivalvur" method="POST"
		modelAttribute="piirivalvurform">

		<table id="formtable" width="400" border="0" cellspacing="0" cellpadding="0"
			style="margin-left: 50px;">
			<form:input type="hidden" path="id" />
			<tr>
				<td width="168"><form:label path="sodurikood"><spring:message code="piirivalvur.field.sodurikood" /></form:label>
					<form:input path="sodurikood" /></td>
				<td width="280"><form:label path="email"><spring:message code="piirivalvur.field.email" /></form:label>
					<form:input path="email" /></td>
			</tr>
			<tr>
				<td><form:label path="isikukood"><spring:message code="piirivalvur.field.isikukood" /></form:label>
					<form:input path="isikukood" /></td>
				<td><form:label path="telefon"><spring:message code="piirivalvur.field.telefon" /></form:label>
					<form:input path="telefon" /></td>
			</tr>

			<tr>
				<td><form:label path="eesnimi"><spring:message code="piirivalvur.field.eesnimi" /></form:label>
					<form:input path="eesnimi" /></td>
				<td><form:label path="aadress"><spring:message code="piirivalvur.field.aadress" /></form:label>
					<form:input path="aadress" /></td>
			</tr>

			<tr>
				<td><form:label path="perekonnanimi"><spring:message code="piirivalvur.field.perekonnanimi" /></form:label>
					<form:input path="perekonnanimi" /> <form:label
						path="sugu"><spring:message code="piirivalvur.field.sugu" /></form:label>
					<form:select path="sugu">
						<form:option value="-1"><spring:message code="piirivalvur.field.sugu.value.default" /></form:option>
						<form:option value="0"><spring:message code="piirivalvur.field.sugu.value.mees" /></form:option>
						<form:option value="1"><spring:message code="piirivalvur.field.sugu.value.naine" /></form:option>
					</form:select></td>
				<td>
					<p>
						<form:label path="kommentaar"><spring:message code="entity.field.kommentaar" /></form:label>
						<form:textarea path="kommentaar" />
					</p>
				</td>
			</tr>

			<tr>
				<td colspan="2">
					<c:if test="${piirivalvurSodurikoodNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.Piirivalvur.sodurikood" /></span><br />
					</c:if>
					<c:if test="${piirivalvurSodurikoodSize == true }">
						<span id="veateade"><spring:message code="Size.Piirivalvur.sodurikood" /></span><br />
					</c:if>
					<c:if test="${piirivalvurIsikukoodNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.Piirivalvur.isikukood" /></span><br />
					</c:if>
					<c:if test="${piirivalvurIsikukoodSize == true }">
						<span id="veateade"><spring:message code="Size.Piirivalvur.isikukood" /></span><br />
					</c:if>
					<c:if test="${piirivalvurEesnimiNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.Piirivalvur.eesnimi" /></span><br />
					</c:if>
					<c:if test="${piirivalvurEesnimiSize == true }">
						<span id="veateade"><spring:message code="Size.Piirivalvur.eesnimi" /></span><br />
					</c:if>
					<c:if test="${piirivalvurPerekonnanimiNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.Piirivalvur.perekonnanimi" /></span><br />
					</c:if>
					<c:if test="${piirivalvurPerekonnanimiSize == true }">
						<span id="veateade"><spring:message code="Size.Piirivalvur.perekonnanimi" /></span><br />
					</c:if>
					<c:if test="${piirivalvurSuguNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.Piirivalvur.sugu" /></span><br />
					</c:if>
					<c:if test="${piirivalvurSuguRange == true }">
						<span id="veateade"><spring:message code="Range.Piirivalvur.sugu" /></span><br />
					</c:if>
					<c:if test="${piirivalvurEmailNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.Piirivalvur.email" /></span><br />
					</c:if>
					<c:if test="${piirivalvurEmailSize == true }">
						<span id="veateade"><spring:message code="Size.Piirivalvur.email" /></span><br />
					</c:if>
					<c:if test="${piirivalvurTelefonNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.Piirivalvur.telefon" /></span><br />
					</c:if>
					<c:if test="${piirivalvurTelefonSize == true }">
						<span id="veateade"><spring:message code="Size.Piirivalvur.telefon" /></span><br />
					</c:if>
					<c:if test="${piirivalvurAadressNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.Piirivalvur.aadress" /></span><br />
					</c:if>
					<c:if test="${piirivalvurAadressSize == true }">
						<span id="veateade"><spring:message code="Size.Piirivalvur.aadress" /></span><br />
					</c:if>
					<sec:authorize access="hasRole('ROLE_EDIT') or hasRole('ROLE_ADD')">
						<input onclick="addRecord(${piirivalvurform.id})" type="submit" value="<spring:message code="entity.btn.save" />" class="buttons">
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_EDIT') or hasRole('ROLE_ADD')">
						<input type="reset" value="<spring:message code="entity.btn.cancel" />"	class="buttons">
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_DEL')">
							<input onclick="deleteRecord()" type="button" value="<spring:message code="entity.btn.delete" />" class="buttons">
					</sec:authorize>
				</td>
			</tr>
		</table>
	</form:form>

	<div>
		<a href="<c:url value="/Navigation" />"><spring:message code="entity.nav.menu" /></a>
	</div>

	<c:if test="${piirivalvurAdded == true }">
		<br />
		<br />
		<div>
			<spring:message code="piirivalvur.notif.added" /> 
			<a href="<c:url value="/Piirivalvurid" />"><spring:message code="nav.link.plural.piirivalvur" /></a>
		</div>
		<br />

	</c:if>
	<c:if test="${piirivalvurModified == true }">
		<br />
		<br />
		<div>
			<spring:message code="vaeosa.notif.modified" />
			<a href="<c:url value="/Piirivalvurid" />"><spring:message code="nav.link.plural.piirivalvur" /></a>
		</div>
		<br />

	</c:if>
	<c:if test="${deletePiirivalvur == true }">
		<c:redirect url="Piirivalvurid" />
	</c:if>

</body>
</html>