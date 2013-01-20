<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="vaeosa.plural.title" /></title>
</head>
<body>
	<a href="<c:url value="/Navigation" />"><spring:message code="entity.nav.menu" /></a><br />
	<sec:authorize access="hasRole('ROLE_ADD')">
		<a href="<c:url value="/Vaeosa" />"><spring:message code="vaeosa.add" /></a><br /><br /><br />
	</sec:authorize>
	
	<c:if test="${not empty Vaeosad}">

		<table>
			<tr>
				<!-- <th>ID</th> -->
				<th><spring:message code="vaeosa.field.kood" /></th>
				<th><spring:message code="vaeosa.field.nimetus" /></th>
				<th><spring:message code="entity.field.kommentaar" /></th>
				<th><spring:message code="entity.field.createdby" /></th>
				<th><spring:message code="entity.field.createdon" /></th>
				<th><spring:message code="entity.field.modifiedby" /></th>
				<th><spring:message code="entity.field.modifiedon" /></th>
				<th><spring:message code="entity.field.closedby" /></th>
				<th><spring:message code="entity.field.closedon" /></th>
			</tr>
			
			<c:forEach items="${Vaeosad}" var="vaeosa"> 
				<tr>
					<!-- <td>${vaeosa.id}</td> -->
					<td>${vaeosa.kood}</td>
					<td>${vaeosa.nimetus}</td>
					<td>${vaeosa.kommentaar}</td>
					<td>${vaeosa.createdby}</td>
					<td>${vaeosa.createdon}</td>
					<td>${vaeosa.modifiedby}</td>
					<td>${vaeosa.modifiedon}</td>
					<td>${vaeosa.closedby}</td>
					<td>${vaeosa.closedon}</td>
					
					<c:if test="${empty vaeosa.closedon}">
						<sec:authorize access="hasRole('ROLE_EDIT')">
							<td><a href="<c:url value="/Vaeosa/${vaeosa.id}/" />"><spring:message code="entity.btn.modify" /></a></td>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_DEL')">
							<td><a href="<c:url value="/Vaeosa/${vaeosa.id}/" />"><spring:message code="entity.btn.delete" /></a></td>
						</sec:authorize>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		
	</c:if>

</body>
</html>