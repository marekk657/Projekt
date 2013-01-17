<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>V�eosad</title>
</head>
<body>
	<a href="Navigation">Men��</a><br />
	<a href="Vaeosa">Lisa V�eosa</a><br /><br /><br />
	
	<c:if test="${not empty Vaeosad}">

		<table>
			<tr>
				<!-- <th>ID</th> -->
				<th>Kood</th>
				<th>Nimetus</th>
				<th>Kommentaar</th>
			</tr>
			
			<c:forEach items="${Vaeosad}" var="vaeosa"> 
				<tr>
					<!-- <td>${vaeosa.id}</td> -->
					<td>${vaeosa.kood}</td>
					<td>${vaeosa.nimetus}</td>
					<td>${vaeosa.kommentaar}</td>
					
					<c:if test="${empty vaeosa.closedon}">
						<td><a href="Vaeosa/${vaeosa.id}/"> Edit </a></td>
						<td><a href="Vaeosa/${vaeosa.id}/"> Delete </a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		
	</c:if>

</body>
</html>