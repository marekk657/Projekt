<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ametid väeosas</title>
</head>
<body>
	<a href="Navigation">Menüü</a><br />
	<a href="AmetVaeosas">Lisa Amet väeossa</a><br /><br /><br />
	
	<c:if test="${not empty AmetidVaeosas}">

		<table>
			<tr>
				<!-- <th>ID</th> -->
				<th>Piirivalvur</th>
				<th>Alates</th>
				<th>Vaeosa</th>
				<th>Kuni</th>
				<th>Kommentaar</th>
				
			</tr>
			
			<c:forEach items="${AmetidVaeosas}" var="ametvaeosas"> 
				<tr>
					<!-- <td>${amet.id}</td> -->
					<td><a href="Piirivalvur/${ametvaeosas.piirivalvur.id}/">${ametvaeosas.Piirivalvur}</a></td>
					<td>${ametvaeosas.Alates}</td>
					<td>${ametvaeosas.Vaeosa}</td>
					<td>${ametvaeosas.Kuni}</td>
					<td>${ametvaeosas.Kommentaar}</td>
					
					<c:if test="${empty ametvaeosas.closedon}">
						<td><a href="Ametvaeosas/${ametvaeosas.id}/"> Edit </a></td>
						<td><a href="Ametvaeosas/${ametvaeosas.id}/"> Delete </a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		
	</c:if>

</body>
</html>