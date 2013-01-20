<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	document.piirivalvurvaeosas.action="<c:url value="/DeletePiirivalvurVaeosas" />";  
	document.piirivalvurvaeosas.method="POST";  
	document.piirivalvurvaeosas.submit();
}
function addRecord(id) {
	if (id != -1) {
		document.piirivalvurvaeosas.action="<c:url value="/ModifyPiirivalvurVaeosas" />";
		document.piirivalvurvaeosas.method="POST";
		document.piirivalvurvaeosas.submit();
	} else {
		document.piirivalvurvaeosas.action="<c:url value="/AddPiirivalvurVaeosas" />";  
		document.piirivalvurvaeosas.method="POST";  
		document.piirivalvurvaeosas.submit();
	}
}
</script>

<title><spring:message code="piirivalvurVaeosas.title" /></title>
</head>
<body>
	<form:form name="piirivalvurvaeosas" method="POST"
		modelAttribute="piirivalvurvaeosasform">
		<table width="400" border="0" cellspacing="0" cellpadding="0"
			style="margin-left: 50px;">

			<tr>
				<td><form:label path="piirivalvur">
						<spring:message code="piirivalvurVaeosas.field.piirivalvur" />
					</form:label></td>
				<td><form:label path="">
						<spring:message code="piirivalvurVaeosas.field.alates" />
					</form:label>
					
					
					
					</td>
			</tr>

			<tr>
				<td><form:select path="piirivalvur">
						<!-- Testandmete jaoks 
						<form:option value="piirivalvur" label="${piirivalvurvaeosasform.piirivalvur.eesnimi}"></form:option>-->
					</form:select></td>
				<td><form:input type="date" class="datepick" path="" /></td>
			</tr>

			<tr>
				<td><form:label path="vaeosa">
						<spring:message code="piirivalvurVaeosas.field.vaeosa" />
					</form:label></td>
				<td><form:label path="">
						<spring:message code="piirivalvurVaeosas.field.kuni" />
					</form:label>
					
					
					</td>
			</tr>

			<tr>
				<td><form:select path="vaeosa">
						<!-- Testandmete jaoks 
						<form:option  value="vaeosa" label="${piirivalvurvaeosasform.vaeosa.nimetus}"></form:option>-->
					</form:select></td>
				<td><form:input type="date" class="datepick" path="" /></td>
			</tr>


			<tr>
				<td><form:label path="ametvaeosa">
						<spring:message code="piirivalvurVaeosas.field.ametvaeosa" />
					</form:label></td>
				<td>
					<form:label path="koormus"><spring:message code="piirivalvurVaeosas.field.koormus" /></form:label>
				</td>
			</tr>

			<tr>
				<td><form:select path="ametvaeosa">
						<!-- Testandmete jaoks 
						<form:option value="ametvaeosa" label="${piirivalvurvaeosasform.ametvaeosa.amet.nimetus}"></form:option>-->
					</form:select></td>
				<td>
					<form:input path="koormus" />
				</td>
			</tr>

			<tr>
				<td><form:label path="kommentaar">
						<spring:message code="entity.field.kommentaar" />
					</form:label></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2"><form:textarea path="kommentaar" /></td>
			</tr>

			<tr>
				<td><input onclick="addRecord(${piirivalvurvaeosasform.id})"
					type="button" value="<spring:message code="entity.btn.save" />"
					class="buttons"> <input type="button"
					value="<spring:message code="entity.btn.cancel" />" class="buttons">
					<input onclick="deleteRecord()" type="button"
					value="<spring:message code="entity.btn.delete" />" class="buttons"></td>
			</tr>
		</table>


		<div>
			<a href="<c:url value="/Navigation" />"><spring:message
					code="entity.nav.menu" /></a>
		</div>


	</form:form>

	<c:if test="${piirivalvurVaeosasAdded == true }">
		<br />
		<br />
		<div>
			<spring:message code="piirivalvurVaeosas.notif.added" /> 
			<a href="<c:url value="/PiirivalvuridVaeosades" />"><spring:message code="nav.link.plural.piirivalvurvaeosas" /></a>
		</div>
	</c:if>
	<c:if test="${piirivalvurvaeosastModified == true }">
		<br />
		<br />
		<div>
			<spring:message code="piirivalvurVaeosas.notif.modified" /> 
			<a href="<c:url value="/PiirivalvuridVaeosades" />"><spring:message code="nav.link.plural.piirivalvurvaeosas" /></a>
		</div>
	</c:if>
	<c:if test="${deletePiirivalvurVaeosas == true }">
		<c:redirect url="PiirivalvuridVaeosades" />
	</c:if>


</body>
</html>