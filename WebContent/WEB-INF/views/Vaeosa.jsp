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
	document.vaeosa.action="<c:url value="/DeleteVaeosa" />";  
	document.vaeosa.method="POST";  
	document.vaeosa.submit();
}
function addRecord(id) {
	if (id != -1) {
		document.vaeosa.action="<c:url value="/ModifyVaeosa" />";
		document.vaeosa.method="POST";
		document.vaeosa.submit();
	} else {
		document.vaeosa.action="<c:url value="/AddVaeosa" />";  
		document.vaeosa.method="POST";  
		document.vaeosa.submit();
	}
}
</script>

<title><spring:message code="vaeosa.title" /></title>
</head>
<body>
	<c:if test="${errors == true }">
		<div>
			<table>
				<tr>
					<td><form:errors path="kood"/></td>
				</tr>
				<tr>
					<td><form:errors path="nimetus" /></td>
				</tr>
			</table>
		</div>
	</c:if>

	<form:form commandName="vaeosa" name="vaeosa" method="POST" modelAttribute="vaeosaform">
		<table  id="formtable" width="400" border="0" cellspacing="0" cellpadding="0"
			style="margin-left: 50px;">
			<form:input type="hidden" path="id" />
			<tr>
				<td>
					<form:label path="kood"><spring:message code="vaeosa.field.kood" /></form:label>
				 	<form:input path="kood" /> <br />
					<form:label path="nimetus"><spring:message code="vaeosa.field.nimetus" /></form:label>
					<form:input path="nimetus" />
				</td>
				<td>
					<p>
						<form:label path="kommentaar"><spring:message code="entity.field.kommentaar" /></form:label>
						<form:textarea path="kommentaar" />
					</p>
				</td>
			</tr>

			<c:if test="${errors == true}">
				<tr>
					<form:errors id="veateade" path="kood" />
					<form:errors id="veateade" path="nimetus" />
				</tr>
			</c:if>

			<tr><!-- Alternatiiv -->
				<td colspan="2">
					<c:if test="${vaeosaKoodNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.vaeosa.kood" /></span><br />
					</c:if>
					<c:if test="${vaeosaKoodSize == true }">
						<span id="veateade"><spring:message code="Size.vaeosa.kood" /></span><br />
					</c:if>
					<c:if test="${vaeosaNimetusNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.vaeosa.nimetus" /></span><br />
					</c:if>
					<c:if test="${vaeosaNimetusSize == true }">
						<span id="veateade"><spring:message code="Size.vaeosa.nimetus" /></span><br />
					</c:if>
					<sec:authorize access="hasRole('ROLE_EDIT') or hasRole('ROLE_ADD')">
						<input onclick="addRecord(${vaeosaform.id})" type="submit" value="<spring:message code="entity.btn.save" />" class="buttons">
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


		<div>
			<a href="<c:url value="/Navigation" />"><spring:message code="entity.nav.menu" /></a>
		</div>

	</form:form>
	<c:if test="${VaeosaAdded == true }">
		<br />
		<br />
		<div>
			<spring:message code="vaeosa.notif.added" /> <a href="<c:url value="/Vaeosad" />"><spring:message code="nav.link.plural.vaeosa" /></a>
		</div>
	</c:if>
	<c:if test="${VaeosaModified == true }">
		<br />
		<br />
		<div>
			<spring:message code="vaeosa.notif.modified" /> <a href="<c:url value="/Vaeosad" />"><spring:message code="nav.link.plural.vaeosa" /></a>
		</div>
	</c:if>
	<c:if test="${deleteVaeosa == true }">
		<c:redirect url="Vaeosad" />
	</c:if>


</body>
</html>