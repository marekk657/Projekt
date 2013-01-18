<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="amet.plural.title" /></title>
</head>
<body>
	<a href="<c:url value="/Navigation" />"><spring:message code="entity.nav.menu" /></a><br />
	<a href="<c:url value="/Amet" />"><spring:message code="amet.add" /></a><br /><br /><br />
	
	<c:if test="${not empty Ametid}">

		<table>
			<tr>
				<!-- <th>ID</th> -->
				<th><spring:message code="amet.field.nimetus" /></th>
				<th><spring:message code="amet.field.iscokood" /></th>
				<th><spring:message code="entity.field.kommentaar" /></th>
				<th><spring:message code="entity.field.createdby" /></th>
				<th><spring:message code="entity.field.createdon" /></th>
				<th><spring:message code="entity.field.modifiedby" /></th>
				<th><spring:message code="entity.field.modifiedon" /></th>
				<th><spring:message code="entity.field.closedby" /></th>
				<th><spring:message code="entity.field.closedon" /></th>
			</tr>
			
			<c:forEach items="${Ametid}" var="amet"> 
				<tr>
					<!-- <td>${amet.id}</td> -->
					<td>${amet.nimetus}</td>
					<td>${amet.iscokood}</td>
					<td>${amet.kommentaar}</td>
					<td>${amet.createdby}</td>
					<td>${amet.createdon}</td>	
					<td>${amet.modifiedby}</td>
					<td>${amet.modifiedon}</td>
					<td>${amet.closedby}</td>
					<td>${amet.closedon}</td>
					<c:if test="${empty amet.closedon}">
						<td><a href="<c:url value="/Amet/${amet.id}/" />"><spring:message code="entity.btn.modify" /></a></td>
						<td><a href="<c:url value="/Amet/${amet.id}/" />"><spring:message code="entity.btn.delete" /></a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		
	</c:if>

</body>
</html>