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
	document.ametvaeosas.action="<%=request.getContextPath()%>/DeleteAmetvaeosas";  
	document.ametvaeosas.method="POST";  
	document.ametvaeosas.submit();
}
function addRecord(id) {
	if (id != -1) {
		document.ametvaeosas.action="<%=request.getContextPath()%>/ModifyAmetvaeosas";
		document.ametvaeosas.method="POST";
		document.ametvaeosas.submit();
	} else {
		document.ametvaeosas.action="<%=request.getContextPath()%>/AddAmetvaeosas";  
		document.ametvaeosas.method="POST";  
		document.ametvaeosas.submit();
	}
}
</script>
<title>Amet väeosas</title>
</head>
<body>
	<form:form name="ametvaeosas" method="POST" modelAttribute="ametvaeosasform">

		<table width="400" border="0" cellspacing="0" cellpadding="0"
			style="margin-left: 50px;">

			<tr>
				<td><form:label path="amet">Amet:</form:label></td>
				<td><form:label path="alates">Alates:</form:label></td>
			</tr>

			<tr>
				<td>
					<form:select path="amet">
					<!-- Testandmete jaoks -->
						<form:option value="amet" label="${ametvaeosasform.amet.nimetus}"></form:option>
					</form:select>
				</td>
				<td><form:input path="alates" /></td>
			</tr>

			<tr>
				<td><form:label path="vaeosa">Väeosa:</form:label></td>
				<td><form:label path="kuni">Kuni:</form:label></td>
			</tr>

			<tr>
				<td>
					<form:select path="vaeosa">
					<!-- Testandmete jaoks -->
						<form:option value="amet" label="${ametvaeosasform.vaeosa.nimetus}"></form:option>
					</form:select>
				</td>
				<td><form:input path="kuni" /></td>
			</tr>

			<tr>
				<td><form:label path="kommentaar">Kommentaar:</form:label></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2"><form:textarea path="kommentaar" /></td>
			</tr>

			<tr>
				<td><input onclick="addRecord(${ametvaeosasform.id})"
					name="Salvesta" type="button" value="Salvesta" class="buttons">
					<input name="Katkesta" type="reset" value="Katkesta"
					class="buttons"> <input onclick="deleteRecord()"
					name="Kustuta" type="button" value="Kustuta" class="buttons">
				</td>
			</tr>
		</table>
	</form:form>
	<div>
		<a href="Navigation">Menüü</a>
	</div>

	<c:if test="${ametvaeosaAdded == true }">
		<br />
		<br />
		<div>
			Uus Amet Väeossa on lisatud. Vaata <a href="Ametidvaeosas">kõiki
				ameteid väeosas</a>
		</div>
		<br />
		<div>
			<a href="Navigation">Menüü</a>
		</div>
	</c:if>
	<c:if test="${ametvaeosaModified == true }">
		<br />
		<br />
		<div>
			Amet Väeossa muudetud. Vaata <a href="Ametidvaeosas">kõiki
				ameteid väeosas</a>
		</div>
		<br />
		<div>
			<a href="Navigation">Menüü</a>
		</div>
	</c:if>
	<c:if test="${deleteametvaeosa == true }">
		<c:redirect url="Ametidvaeosas" />
	</c:if>


</body>
</html>