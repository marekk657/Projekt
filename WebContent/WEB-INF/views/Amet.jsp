<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
td {text-align:left;}
.buttons {margin-top:30px; height: 35px;}
</style>
<title>Ameti vorm</title>
</head>
<body>
	<form:form action="AddAmet" method="POST" modelAttribute="ametform">
		<table width="400" border="0" cellspacing="0" cellpadding="0" style="margin-left:50px;">
	  
		  <tr>
		    <td>
		    	<form:label path="iscokood" >Isco kood:</form:label>
		      	<form:input path="iscokood" />
		        <form:label path="nimetus" >Nimetus:</form:label>
		      	<form:input path="nimetus" />
		    </td>
		    <td>
		    	<p><form:label path="kommentaar" >Kommentaar:</form:label>
		        	<form:textarea path="kommentaar" />
		      	</p>
		    </td>
		  </tr>
		   
		  <tr>
		    <td ><input name="Salvesta" type="submit" value="Salvesta" class="buttons" style="float:right;"></td>
		    <td >
		    	<input name="Katkesta" type="reset" value="Katkesta" class="buttons">
		 		<input name="Kustuta" type="submit" value="Kustuta" class="buttons">   
		    </td>
		  </tr>
		</table>
	</form:form>
	
	<c:if test="${ametAdded == true }">
		<br/><br/><div>Uus amet on lisatud. Vaata <a href="Ametid">kõiki ameteid</a></div>
	</c:if>
	<c:if test="${ametDeleted == true }">
		<br/><br/><div>Uus amet kustutatud. Vaata <a href="Ametid">kõiki ameteid</a></div>
	</c:if>
	
</body>
</html>