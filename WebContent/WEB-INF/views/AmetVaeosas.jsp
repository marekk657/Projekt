<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script type="text/javascript" src="./js/bootstrap-datepicker.js"></script> 
<script type="text/javascript" src="./js/date.js"></script>
<style>
td {
	text-align: left;
}

.buttons {
	margin-top: 30px;
	height: 35px;
}
</style>
<script type="text/javascript">
function deleteRecord() {
	document.ametvaeosas.action="<c:url value="/DeleteAmetVaeosas" />";  
	document.ametvaeosas.method="POST";  
	document.ametvaeosas.submit();
}
function addRecord(id) {
	if (id != -1) {
		document.ametvaeosas.action="<c:url value="/ModifyAmetVaeosas" />";
		document.ametvaeosas.method="POST";
		document.ametvaeosas.submit();
	} else {
		document.ametvaeosas.action="<c:url value="/AddAmetVaeosas" />";  
		document.ametvaeosas.method="POST";  
		document.ametvaeosas.submit();
	}
}
</script>
<title><spring:message code="ametvaeosas.title" /></title>
</head>
<body>
	<form:form name="ametvaeosas" method="POST"
		modelAttribute="ametvaeosasform">

		<table width="400" border="0" cellspacing="0" cellpadding="0"
			style="margin-left: 50px;">

			<tr>
				<td><form:label path="amet"><spring:message code="ametvaeosas.field.amet" /></form:label></td>
				<td><form:label path="alates"><spring:message code="ametvaeosas.field.alates" /></form:label></td>
			</tr>

			<tr>
				<td><form:select path="amet">
						<!-- Testandmete jaoks -->
						<form:option value="amet" label="${ametvaeosasform.amet.nimetus}"></form:option>
					</form:select></td>
				<td><form:input type="date" path="alates" class="datepick" /></td>
			</tr>

			<tr>
				<td><form:label path="vaeosa"><spring:message code="ametvaeosas.field.vaeosa" /></form:label></td>
				<td><form:label path="kuni"><spring:message code="ametvaeosas.field.kuni" /></form:label></td>
			</tr>

			<tr>
				<td><form:select path="vaeosa">
						<!-- Testandmete jaoks -->
						<form:option value="amet"
							label="${ametvaeosasform.vaeosa.nimetus}"></form:option>
					</form:select></td>
				<td><form:input type="date" path="kuni" class="datepick" /></td>
			</tr>

			<tr>
				<td><form:label path="kommentaar"><spring:message code="entity.field.kommentaar" /></form:label></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2"><form:textarea path="kommentaar" /></td>
			</tr>

			<tr>
				<td>
					<sec:authorize access="hasRole('ROLE_EDIT') or hasRole('ROLE_ADD')">
						<input onclick="addRecord(${ametvaeosasform.id})" type="button" value="<spring:message code="entity.btn.save" />" class="buttons">
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_EDIT') or hasRole('ROLE_ADD')">
						<input name="Katkesta" type="reset" value="<spring:message code="entity.btn.cancel" />" class="buttons">
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_DEL')">
						<input onclick="deleteRecord()" name="Kustuta" type="button" value="<spring:message code="entity.btn.delete" />" class="buttons">
					</sec:authorize>
				</td>
			</tr>
		</table>
	</form:form>

	<div>
		<a href="<c:url value="/Navigation" />"><spring:message
				code="entity.nav.menu" /></a>
	</div>

	<c:if test="${ametvaeosaAdded == true }">
		<br />
		<br />
		<div>
			<spring:message code="ametvaeosas.notif.added" /> 
			<a href="<c:url value="/AmetidVaeosas" />"><spring:message code="nav.link.plural.ametvaeosas" /></a>
		</div>
	</c:if>
	<c:if test="${ametvaeosaModified == true }">
		<br />
		<br />
		<div>
			<spring:message code="ametvaeosas.notif.modified" /> 
			<a href="<c:url value="/AmetidVaeosas" />"><spring:message code="nav.link.plural.ametvaeosas" /></a>
		</div>
	</c:if>
	<c:if test="${deleteametvaeosas == true }">
		<c:redirect url="AmetidVaeosas" />
	</c:if>


</body>
</html>