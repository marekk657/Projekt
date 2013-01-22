<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="ametvaeosas.plural.title" /></title>
</head>
<body>
	<a href="<c:url value="/Navigation" />"><spring:message code="entity.nav.menu" /></a><br />
	<sec:authorize access="hasRole('ROLE_ADD')">
		<a href="<c:url value="/AmetVaeosas" />"><spring:message code="ametvaeosas.add" /></a><br /><br /><br />
	</sec:authorize>
	
	<c:if test="${not empty AmetidVaeosas}">

		<table>
			<tr>
				<!-- <th>ID</th> -->
				<th><spring:message code="ametvaeosas.field.amet" /></th>
				<th><spring:message code="ametvaeosas.field.vaeosa" /></th>
				<th><spring:message code="ametvaeosas.field.alates" /></th>
				<th><spring:message code="ametvaeosas.field.kuni" /></th>
				<th><spring:message code="entity.field.kommentaar" /></th>
				<th><spring:message code="entity.field.createdby" /></th>
				<th><spring:message code="entity.field.createdon" /></th>
				<th><spring:message code="entity.field.modifiedby" /></th>
				<th><spring:message code="entity.field.modifiedon" /></th>
				<th><spring:message code="entity.field.closedby" /></th>
				<th><spring:message code="entity.field.closedon" /></th>				
			</tr>
			
			<c:forEach items="${AmetidVaeosas}" var="ametvaeosas"> 
				<tr>
					<td>
						<a href="<c:url value="/Amet/${ametvaeosas.amet.id}/" />">${ametvaeosas.amet.nimetus}</a>
					</td>
					<td>
						<a href="<c:url value="/Vaeosa/${ametvaeosas.vaeosa.id}/" />">${ametvaeosas.vaeosa.nimetus}</a>
					</td>
					<td>${ametvaeosas.alates}</td>
					<td>${ametvaeosas.kuni}</td>
					<td>${ametvaeosas.kommentaar}</td>
					<td>${ametvaeosas.createdby}</td>
					<td>${ametvaeosas.createdon}</td>
					<td>${ametvaeosas.modifiedby}</td>
					<td>${ametvaeosas.modifiedon}</td>
					<td>${ametvaeosas.closedby}</td>
					<td>${ametvaeosas.closedon}</td>
					<c:if test="${empty ametvaeosas.closedon}">
						<sec:authorize access="hasRole('ROLE_EDIT')">
							<td><a href="<c:url value="/AmetVaeosas/${ametvaeosas.id}/" />"><spring:message code="entity.btn.modify" /></a></td>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_DEL')">
							<td><a href="<c:url value="/AmetVaeosas/${ametvaeosas.id}/" />"><spring:message code="entity.btn.delete" /></a></td>
						</sec:authorize>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		
	</c:if>

</body>
</html>