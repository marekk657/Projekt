<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/css/datepicker.css" />" rel="stylesheet">
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<c:url value="/js/bootstrap-datepicker.js" />"></script> 
<script type="text/javascript" src="<c:url value="/js/date.js" />"></script>
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
	<form:form commandName="ametVaeosas" name="ametvaeosas" method="POST"
		modelAttribute="ametvaeosasform">

		<table id="formtable" style="margin-left: 50px; width: 650px; border-spacing: 0; padding:0;">

			<tr>
				<td><form:input type="hidden" path="id"  /></td>
			</tr>
			<tr>
				<td><form:label path="amet.id"><spring:message code="ametvaeosas.field.amet" /></form:label></td>
				<td><form:label path="alates"><spring:message code="ametvaeosas.field.alates" /></form:label></td>
			</tr>

			<tr>
				<td><form:select path="amet.id">
						<c:forEach items="${ametid}" var="amet">
							<c:set var="ametId" value="${amet.id}" />
							<form:option value="${ametId}">
								<c:out value="${amet.nimetus }"></c:out>
							</form:option>
						</c:forEach>
					</form:select></td>
				<td><form:input path="alates" class="datepick" /></td>
			</tr>

			<tr>
				<td><form:label path="vaeosa.id"><spring:message code="ametvaeosas.field.vaeosa" /></form:label></td>
				<td><form:label path="kuni"><spring:message code="ametvaeosas.field.kuni" /></form:label></td>
			</tr>

			<tr>
				<td><form:select path="vaeosa.id">
						<c:forEach items="${vaeosad}" var="vaeosa">
							<c:set  var="vaeosaId" value="${vaeosa.id}" />
							<form:option value="${vaeosaId}">
								<c:out value="${vaeosa.nimetus}" />
							</form:option>
						</c:forEach>
					</form:select></td>
				<td><form:input path="kuni" class="datepick" /></td>
			</tr>

			<tr>
				<td><form:label path="kommentaar"><spring:message code="entity.field.kommentaar" /></form:label></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2"><form:textarea path="kommentaar" /></td>
			</tr>
			
			
			<c:if test="${errors == true}">
				<tr>
					<form:errors id="veateade" path="amet.id" />
					<form:errors id="veateade" path="vaeosa.id" />
					<form:errors id="veateade" path="alates" />
					<form:errors id="veateade" path="kuni" />
				</tr>
			</c:if>

			<tr><!-- Alternatiiv -->
				<td colspan="2">
					<c:if test="${ametVaeosasAmetNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.ametVaeosas.amet" /></span><br />
					</c:if>
					<c:if test="${ametVaeosasVaeosaNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.ametVaeosas.vaeosa" /></span><br />
					</c:if>
					<c:if test="${ametVaeosasAlatesNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.ametVaeosas.alates" /></span><br />
					</c:if>
					<c:if test="${ametVaeosasKuniNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.ametVaeosas.kuni" /></span><br />
					</c:if>
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