<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ametid</title>
</head>
<body>
	<c:if test="${not empty Ametid}">

		<table>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Isco kood</th>
				<th>Kommentaar</th>
				<th>Created On</th>
				<th>Created By</th>
				<th>Modified On</th>
				<th>Modified By</th>
				<th>Closed On</th>
				<th>Closed By</th>
			</tr>
			
			<c:forEach items="${Ametid}" var="amet"> 
				<tr>
					<td>${amet.id}</td>
					<td>${amet.nimetus}</td>
					<td>${amet.iscokood}</td>
					<td>${amet.kommentaar}</td>
					<td>${amet.createdon}</td>
					<td>${amet.createdby}</td>
					<td>${amet.modifiedon}</td>
					<td>${amet.modifiedby}</td>
					<td>${amet.closedon}</td>
					<td>${amet.closedby}</td>
					<td><a href=""> Edit </a></td>
					<td><a href=""> Delete </a></td>
				</tr>
			</c:forEach>
		</table>
		
	</c:if>
</body>
</html>