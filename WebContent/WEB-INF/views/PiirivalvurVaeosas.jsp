<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
	<form:form commandName="piirivalvurVaeosas" name="piirivalvurvaeosas" method="POST"
		modelAttribute="piirivalvurvaeosasform">
		<table id="formtable" style="margin-left: 50px; width: 650px; border-spacing: 0; padding:0;">

			<tr>
				<td><form:input type="hidden" path="id"  /></td>
			</tr>

			<tr>
				<td><form:label path="piirivalvur.id">
						<spring:message code="piirivalvurVaeosas.field.piirivalvur" />
					</form:label></td>
				<td><form:label path="alates">
						<spring:message code="piirivalvurVaeosas.field.alates" />
					</form:label></td>
			</tr>

			<tr>
				<td>
					<form:select path="piirivalvur.id">
						<c:forEach items="${piirivalvurid}" var="piirivalvur">
							<c:set var="valvurId" value="${piirivalvur.id}"/>
							<form:option value="${valvurId}">
								<c:out value="${piirivalvur.eesnimi}"/>
								<c:out value=" "/>
								<c:out value="${piirivalvur.perekonnanimi}"/>
							</form:option>
						</c:forEach>
					</form:select>
				</td>
				<td><form:input class="datepick" path="alates"  /></td>
			</tr>

			<tr>
				<td><form:label path="vaeosa.id">
						<spring:message code="piirivalvurVaeosas.field.vaeosa" />
					</form:label></td>
				<td><form:label path="kuni">
						<spring:message code="piirivalvurVaeosas.field.kuni" />
					</form:label></td>
			</tr>

			<tr>
				<td>
					<form:select path="vaeosa.id">
						<c:forEach items="${vaeosad}" var="vaeosa">
							<c:set var="vaeosaId" value="${vaeosa.id}"/>
							<form:option value="${vaeosaId}">
								<c:out value="${vaeosa.nimetus}" />
							</form:option>
						</c:forEach>
					</form:select></td>
				<td><form:input class="datepick" path="kuni"  /></td>
			</tr>


			<tr>
				<td>
					<form:label path="ametvaeosa.id">
						<spring:message code="piirivalvurVaeosas.field.ametvaeosa" />
					</form:label>
				</td>
				<td>
					<form:label path="koormus"><spring:message code="piirivalvurVaeosas.field.koormus" /></form:label>
				</td>
			</tr>

			<tr>
				<td><form:select path="ametvaeosa.id">
						<form:options items="${ametid}" var="amet" itemLabel="amet.nimetus" itemValue="id"/>
							
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

			<c:if test="${errors == true}">
				<tr>
					<form:errors id="veateade" path="koormus" />
					<form:errors id="veateade" path="piirivalvur.id" />
					<form:errors id="veateade" path="vaeosa.id" />
					<form:errors id="veateade" path="ametvaeosa.id" />
					<form:errors id="veateade" path="alates" />
					<form:errors id="veateade" path="kuni" />
				</tr>
			</c:if>

			<tr><!-- Alternatiiv -->
				<td colspan="2">
					<c:if test="${piirivalvurVaeosasPiirivalvurNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.piirivalvurVaeosas.piirivalvur" /></span><br />
					</c:if>
					<c:if test="${piirivalvurVaeosasVaeosaNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.piirivalvurVaeosas.vaeosa" /></span><br />
					</c:if>
					<c:if test="${piirivalvurVaeosasAmetVaeosaNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.piirivalvurVaeosas.ametvaeosa" /></span><br />
					</c:if>
					<c:if test="${piirivalvurVaeosasAlatesNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.piirivalvurVaeosas.alates" /></span><br />
					</c:if>
					<c:if test="${piirivalvurVaeosasKuniNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.piirivalvurVaeosas.kuni" /></span><br />
					</c:if>
					<c:if test="${piirivalvurVaeosasKoormusNotNull == true }">
						<span id="veateade"><spring:message code="NotNull.piirivalvurVaeosas.koormus" /></span><br />
					</c:if>
					<c:if test="${piirivalvurVaeosasKoormusRange == true }">
						<span id="veateade"><spring:message code="Range.piirivalvurVaeosas.koormus" /></span><br />
					</c:if>
					<sec:authorize access="hasRole('ROLE_EDIT') or hasRole('ROLE_ADD')">
						<input onclick="addRecord(${piirivalvurvaeosasform.id})" type="button" value="<spring:message code="entity.btn.save" />" class="buttons">
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_EDIT') or hasRole('ROLE_ADD')">
						<input type="button" value="<spring:message code="entity.btn.cancel" />" class="buttons">
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_DEL')">
						<input onclick="deleteRecord()" type="button" value="<spring:message code="entity.btn.delete" />" class="buttons">
					</sec:authorize>
				</td>
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