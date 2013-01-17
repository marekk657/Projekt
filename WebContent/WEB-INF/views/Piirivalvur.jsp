<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<script type="text/javascript" >
function deleteRecord() {
	document.piirivalvur.action="<%=request.getContextPath()%>/DeletePiirivalvur";  
	document.piirivalvur.method="POST";  
	document.piirivalvur.submit();
}
function addRecord(id) {
	if (id != -1) {
		document.piirivalvur.action="<%=request.getContextPath()%>/ModifyPiirivalvur";
		document.piirivalvur.method="POST";
		document.piirivalvur.submit();
	} else {
		document.piirivalvur.action="<%=request.getContextPath()%>/AddPiirivalvur";  
		document.piirivalvur.method="POST";  
		document.piirivalvur.submit();
	}
}
</script>

<title>Piirivalvuri vorm</title>
</head>
<body>
	<form:form name="piirivalvur" method="POST"
		modelAttribute="piirivalvurform">

		<table width="400" border="0" cellspacing="0" cellpadding="0"
			style="margin-left: 50px;">
			<form:input type="hidden" path="id" />
			<tr>
				<td width="168"><form:label path="sodurikood">Sõduri kood:</form:label>
					<br /> <form:input path="sodurikood" /></td>
				<td width="280"><form:label path="email">E-mail:</form:label>
					<br /> <form:input path="email" /></td>
			</tr>
			<tr>
				<td><form:label path="isikukood">Isikukood:</form:label> <br />
					<form:input path="isikukood" /></td>
				<td><form:label path="telefon">Telefon:</form:label> <br />
					<form:input path="telefon" /></td>
			</tr>

			<tr>
				<td><form:label path="eesnimi">Eesnimi:</form:label> <br />
					<form:input path="eesnimi" /></td>
				<td><form:label path="aadress">Aadress:</form:label> <br />
					<form:input path="aadress" /></td>
			</tr>

			<tr>
				<td><form:label path="perekonnanimi">Perekonnanimi:</form:label>
					<br /> <form:input path="perekonnanimi" /> <form:label
						path="sugu">Sugu:</form:label><br /> 
					<form:select path="sugu">
						<form:option value="0" label="Mees"/>
						<form:option value="1" label="Naine"/>
					</form:select></td>
				<td>
					<p>
						<form:label path="kommentaar">Kommentaar:</form:label>
						<br />
						<form:textarea path="kommentaar" />
					</p>
				</td>
			</tr>

			<tr>
				<td><input name="Salvesta"
					onclick="addRecord(${piirivalvurform.id})" type="submit"
					value="Salvesta" class="buttons" style="float: right;"></td>
				<td><input name="Katkesta" type="reset" value="Katkesta"
					class="buttons"> <input name="Kustuta"
					onclick="deleteRecord()" type="button" value="Kustuta"
					class="buttons"></td>
			</tr>
		</table>
	</form:form>

<br /><p>Sugu on ${piirivalvurform.sugu}</p> <br />

	<div>
		<a href="Navigation">Menüü</a>
	</div>

	<c:if test="${piirivalvurAdded == true }">
		<br />
		<br />
		<div>
			Uus Piirivalvur on lisatud. Vaata <a href="Piirivalvurid">kõiki
				piirivalvureid</a>
		</div>
		<br />

	</c:if>
	<c:if test="${piirivalvurModified == true }">
		<br />
		<br />
		<div>
			Piirivalvur muudetud. Vaata <a href="Piirivalvurid">kõiki
				piirivalvureid</a>
		</div>
		<br />

	</c:if>
	<c:if test="${deletePiirivalvur == true }">
		<c:redirect url="Piirivalvurid" />
	</c:if>

</body>
</html>