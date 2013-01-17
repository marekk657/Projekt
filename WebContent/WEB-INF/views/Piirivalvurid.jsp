<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Piirivalvurid</title>
</head>
<body>
	<a href="Navigation">Menüü</a><br />
	<a href="Piirivalvur">Lisa Piirivalvur</a><br /><br /><br />
	
	<c:if test="${not empty Piirivalvurid}">

		<table>
			<tr>
				<!-- <th>ID</th> -->
				<th>Sõduri kood</th>
				<th>Isikukood</th>
				<th>Eesnimi</th>
				<th>Perekonnanimi</th>
				<th>Sugu</th>
				<th>Telefon</th>
				<th>E-mail</th>
				<th>Aadress</th>
				<th>Kommentaar</th>
				<th>Created on</th>
				<th>Created by</th>
				<th>Modified on</th>
				<th>Modified by</th>
				<th>Closed on</th>
				<th>Closed by</th>
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
							<c:when test="${piirivalvur.sugu == 0}">Mees</c:when>
							<c:when test="${piirivalvur.sugu == 1}">Naine</c:when>
						</c:choose>
					</td>
					<td>${piirivalvur.telefon}</td>
					<td>${piirivalvur.email}</td>
					<td>${piirivalvur.aadress}</td>
					<td>${piirivalvur.kommentaar}</td>
					<td>${piirivalvur.createdon}</td>
					<td>${piirivalvur.createdby}</td>
					<td>${piirivalvur.modifiedon}</td>
					<td>${piirivalvur.modifiedby}</td>
					<td>${piirivalvur.closedon}</td>
					<td>${piirivalvur.closeddby}</td>
					<c:if test="${empty piirivalvur.closedon}">
						<td><a href="Piirivalvur/${piirivalvur.id}/"> Edit </a></td>
						<td><a href="Piirivalvur/${piirivalvur.id}/"> Delete </a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		
	</c:if>

</body>
</html>