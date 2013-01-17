<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
td {
	text-align: left;
}

.buttons {
	margin-top: 30px;
	height: 35px;
}
</style>
<script type="text/javascript">
function deleteRecord() {
	document.piirivalvurvaeosas.action="<%=request.getContextPath()%>/DeletePiirivalvurVaeosas";  
	document.piirivalvurvaeosas.method="POST";  
	document.piirivalvurvaeosas.submit();
}
function addRecord(id) {
	if (id != -1) {
		document.piirivalvurvaeosas.action="<%=request.getContextPath()%>/ModifyPiirivalvurVaeosas";
		document.piirivalvurvaeosas.method="POST";
		document.piirivalvurvaeosas.submit();
	} else {
		document.piirivalvurvaeosas.action="<%=request.getContextPath()%>/AddPiirivalvurVaeosas";  
		document.piirivalvurvaeosas.method="POST";  
		document.piirivalvurvaeosas.submit();
	}
}
</script>

<title>Piirivalvur v�eosas</title>
</head>
<body>
	<form:form name="piirivalvurvaeosas" method="POST"
		modelAttribute="piirivalvurvaeosasform">
		<table width="400" border="0" cellspacing="0" cellpadding="0"
			style="margin-left: 50px;">

			<tr>
				<td><form:label path="piirivalvur">Piirivalvur:</form:label></td>
				<td><form:label path="">Alates:</form:label></td>
			</tr>

			<tr>
				<td><form:select path="piirivalvur">
						<!-- Testandmete jaoks 
						<form:option value="piirivalvur" label="${piirivalvurvaeosasform.piirivalvur.eesnimi}"></form:option>-->
					</form:select></td>
				<td><form:input path="" /></td>
			</tr>

			<tr>
				<td><form:label path="vaeosa">V�eosa:</form:label></td>
				<td><form:label path="">Kuni:</form:label></td>
			</tr>

			<tr>
				<td><form:select path="vaeosa">
						<!-- Testandmete jaoks 
						<form:option  value="vaeosa" label="${piirivalvurvaeosasform.vaeosa.nimetus}"></form:option>-->
					</form:select></td>
				<td><form:input path="" /></td>
			</tr>


			<tr>
				<td><form:label path="ametvaeosa">Amet:</form:label></td>
				<td></td>
			</tr>

			<tr>
				<td colspan="2"><form:select path="ametvaeosa">
						<!-- Testandmete jaoks 
						<form:option value="ametvaeosa" label="${piirivalvurvaeosasform.ametvaeosa.amet.nimetus}"></form:option>-->
					</form:select></td>
			</tr>

			<tr>
				<td><form:label path="kommentaar">Kommentaar:</form:label></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2"><form:textarea path="kommentaar" /></td>
			</tr>



			<tr>
				<td><input name="Salvesta"
					onclick="addRecord(${piirivalvurvaeosasform.id})" type="button"
					value="Salvesta" class="buttons"> <input name="Katkesta"
					type="button" value="Katkesta" class="buttons"> <input
					name="Kustuta" onclick="deleteRecord()" type="button"
					value="Kustuta" class="buttons"></td>
			</tr>
		</table>


		<br /><br />
		<div>
			<a href="<%=request.getContextPath()%>/Navigation">Men��</a>
		</div>


	</form:form>

	<c:if test="${piirivalvurVaeosasAdded == true }">
		<br />
		<br />
		<div>
			Uus piirivalvur v�eosas on lisatud. Vaata <a
				href="PiirivalvuridVaeosades">k�iki Piirivalvuri v�eosasi</a>
		</div>
	</c:if>
	<c:if test="${piirivalvurvaeosastModified == true }">
		<br />
		<br />
		<div>
			Piirivalvur v�eosas on muudetud. Vaata <a
				href="PiirivalvuridVaeosades">k�iki Piirivalvureid v�eosades</a>
		</div>
	</c:if>
	<c:if test="${deletePiirivalvurVaeosas == true }">
		<c:redirect url="PiirivalvuridVaeosades" />
	</c:if>


</body>
</html>