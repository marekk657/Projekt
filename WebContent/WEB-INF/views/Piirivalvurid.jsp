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
				<th>E-mail</th>
				<th>Isikukood</th>
				<th>Telefon</th>
				<th>Eesnimi</th>
				<th>Aadress</th>
				<th>Perekonnanimi</th>
				<th>Kommentaar</th>
				<th>Sugu</th>
			</tr>
			
			<c:forEach items="${Piirivalvurid}" var="piirivalvur"> 
				<tr>
					<!-- <td>${piirivalvur.id}</td> -->
					<td>${piirivalvur.sodurikood}</td>
					<td>${piirivalvur.email}</td>
					<td>${piirivalvur.Isikukood}</td>
					<td>${piirivalvur.Telefon}</td>
					<td>${piirivalvur.Eesnimi}</td>
					<td>${piirivalvur.Aadress}</td>
					<td>${piirivalvur.Perekonnanimi}</td>
					<td>${piirivalvur.Sugu}</td>
					<td>${piirivalvur.Kommentaar}</td>
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