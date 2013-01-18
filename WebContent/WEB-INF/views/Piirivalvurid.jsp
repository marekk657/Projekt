<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="piirivalvur.plural.title" /></title>
</head>
<body>
	<a href="<c:url value="/Navigation" />"><spring:message code="entity.nav.menu" /></a><br />
	<a href="<c:url value="/Piirivalvur" />"><spring:message code="piirivalvur.add" /></a><br /><br /><br />
	
	<c:if test="${not empty Piirivalvurid}">

		<table>
			<tr>
				<!-- <th>ID</th> -->
				<th><spring:message code="piirivalvur.field.sodurikood" /></th>
				<th><spring:message code="piirivalvur.field.isikukood" /></th>
				<th><spring:message code="piirivalvur.field.eesnimi" /></th>
				<th><spring:message code="piirivalvur.field.perekonnanimi" /></th>
				<th><spring:message code="piirivalvur.field.sugu" /></th>
				<th><spring:message code="piirivalvur.field.telefon" /></th>
				<th><spring:message code="piirivalvur.field.email" /></th>
				<th><spring:message code="piirivalvur.field.aadress" /></th>
				<th><spring:message code="entity.field.kommentaar" /></th>
				<th><spring:message code="entity.field.createdby" /></th>
				<th><spring:message code="entity.field.createdon" /></th>
				<th><spring:message code="entity.field.modifiedby" /></th>
				<th><spring:message code="entity.field.modifiedon" /></th>
				<th><spring:message code="entity.field.closedby" /></th>
				<th><spring:message code="entity.field.closedon" /></th>
			</tr>
			
			<c:forEach items="${Piirivalvurid}" var="piirivalvur"> 
				<tr>
					<!-- <td>${piirivalvur.id}</td> -->
					<td>${piirivalvur.sodurikood}</td>
					<td>${piirivalvur.isikukood}</td>
					<td>${piirivalvur.eesnimi}</td>
					<td>${piirivalvur.perekonnanimi}</td>
					<td>
						<c:choose>
							<c:when test="${piirivalvur.sugu == 0}"><spring:message code="piirivalvur.field.sugu.value.mees" /></c:when>
							<c:when test="${piirivalvur.sugu == 1}"><spring:message code="piirivalvur.field.sugu.value.naine" /></c:when>
						</c:choose>
					</td>
					<td>${piirivalvur.telefon}</td>
					<td>${piirivalvur.email}</td>
					<td>${piirivalvur.aadress}</td>
					<td>${piirivalvur.kommentaar}</td>
					<td>${piirivalvur.createdby}</td>
					<td>${piirivalvur.createdon}</td>
					<td>${piirivalvur.modifiedby}</td>
					<td>${piirivalvur.modifiedon}</td>
					<td>${piirivalvur.closeddby}</td>
					<td>${piirivalvur.closedon}</td>
					<c:if test="${empty piirivalvur.closedon}">
						<td><a href="<c:url value="/Piirivalvur/${piirivalvur.id}/" />"><spring:message code="entity.btn.modify" /></a></td>
						<td><a href="<c:url value="/Piirivalvur/${piirivalvur.id}/" />"><spring:message code="entity.btn.delete" /></a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		
	</c:if>

</body>
</html>