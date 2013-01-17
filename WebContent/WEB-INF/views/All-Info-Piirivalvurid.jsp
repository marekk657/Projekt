<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Piirivalvur väeossad</title>
</head>
<body>
	<a href="Navigation">Menüü</a><br />
	<a href="PiirivalvurVaeosas">Lisa Piirivalvur väeossa</a><br /><br /><br />
	
	<c:if test="${not empty All-Info-Piirivalvurid}">

		<table>
			<tr>
				<!-- <th>ID</th> -->
				<th>Piirivalvur</th>
				<th>Alates</th>
				<th>Vaeosa</th>
                <th>Kuni</th>
                <th>Amet</th>
                <th>Kommentaar</th>
				<
			</tr>
			
			<c:forEach items="${All-Info-Piirivalvurid}" var="piirivalvurvaeosas"> 
				<tr>
					<!-- <td>${piirivalvurvaeosas.id}</td> -->
					<td>${piirivalvurvaeosas.Piirivalvur}</td>
					<td>${piirivalvurvaeosas.Alates}</td>
					<td>${piirivalvurvaeosas.Vaeosa}</td>
                    <td>${piirivalvurvaeosas.Kuni}</td>
					<td>${piirivalvurvaeosas.Amet}</td>
					<td>${piirivalvurvaeosas.v}</td>
					
					<c:if test="${empty piirivalvurvaeosas.closedon}">
						<td><a href="PiirivalvurVaeosas/${piirivalvurvaeosas.id}/"> Edit </a></td>
						<td><a href="PiirivalvurVaeosas/${piirivalvurvaeosas.id}/"> Delete </a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		
	</c:if>

</body>
</html>