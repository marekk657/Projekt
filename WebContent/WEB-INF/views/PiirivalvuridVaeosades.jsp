<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="piirivalvurVaeosas.plural.title" /></title>
</head>
<body>
	<a href="<c:url value="/Navigation" />"><spring:message code="entity.nav.menu" /></a><br />
	<a href="<c:url value="/PiirivalvurVaeosas" />"><spring:message code="piirivalvurVaeosas.add" /></a><br /><br /><br />
	
	<c:if test="${not empty PiirivalvuridVaeosades}">

		<table>
			<tr>
				<!-- <th>ID</th> -->
				<th><spring:message code="piirivalvurVaeosas.field.piirivalvur" /></th>
				<th><spring:message code="piirivalvurVaeosas.field.alates" /></th>
				<th><spring:message code="piirivalvurVaeosas.field.kuni" /></th>
                <th><spring:message code="piirivalvurVaeosas.field.vaeosa" /></th>
                <th><spring:message code="piirivalvurVaeosas.field.ametvaeosa" /></th>
                <th><spring:message code="piirivalvurVaeosas.field.koormus" /></th>
				<th><spring:message code="entity.field.kommentaar" /></th>
				<th><spring:message code="entity.field.createdby" /></th>
				<th><spring:message code="entity.field.createdon" /></th>
				<th><spring:message code="entity.field.modifiedby" /></th>
				<th><spring:message code="entity.field.modifiedon" /></th>
				<th><spring:message code="entity.field.closedby" /></th>
				<th><spring:message code="entity.field.closedon" /></th>
			</tr>
			
			<c:forEach items="${PiirivalvuridVaeosades}" var="piirivalvurvaeosas"> 
				<tr>
					<!-- <td>${piirivalvurvaeosas.id}</td> -->
					<td>${piirivalvurvaeosas.piirivalvur}</td>
					<td>${piirivalvurvaeosas.alates}</td>
					<td>${piirivalvurvaeosas.kuni}</td>
					<td>${piirivalvurvaeosas.vaeosa}</td>
					<td>${piirivalvurvaeosas.ametvaeosa}</td>
					<td>${piirivalvurvaeosas.koormus}</td>
					<td>${piirivalvurvaeosas.kommentaar}</td>
					<td>${piirivalvurvaeosas.createdby}</td>
					<td>${piirivalvurvaeosas.createdon}</td>
					<td>${piirivalvurvaeosas.modifiedby}</td>
					<td>${piirivalvurvaeosas.modifiedon}</td>
					<td>${piirivalvurvaeosas.closedby}</td>
					<td>${piirivalvurvaeosas.closedon}</td>
					<c:if test="${empty piirivalvurvaeosas.closedon}">
						<td><a href="<c:url value="/PiirivalvurVaeosas/${piirivalvurvaeosas.id}/" />"><spring:message code="entity.btn.modify" /></a></td>
						<td><a href="<c:url value="/PiirivalvurVaeosas/${piirivalvurvaeosas.id}/" />"><spring:message code="entity.btn.delete" /></a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		
	</c:if>

</body>
</html>