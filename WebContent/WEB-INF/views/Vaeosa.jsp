<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	document.vaeosa.action="<%=request.getContextPath()%>/DeleteAmet";  
	document.vaeosa.method="POST";  
	document.vaeosa.submit();
}
function addRecord(id) {
	if (id != -1) {
		document.vaeosa.action="<%=request.getContextPath()%>/ModifyAmet";
		document.vaeosa.method="POST";
		document.vaeosa.submit();
	} else {
		document.vaeosa.action="<%=request.getContextPath()%>/AddAmet";  
		document.vaeosa.method="POST";  
		document.vaeosa.submit();
	}
}
</script>

<title>V�eosa vorm</title>
</head>
<body>
	<form:form name="vaeosa" method="POST" modelAttribute="vaeosaform">
      <table width="400" border="0" cellspacing="0" cellpadding="0" style="margin-left:50px;">
  <form:input type="hidden" path="id"  />
  <tr>
    <td>
    <form:label path="Kood" >Kood:</form:label>
    <br>
	<form:input path="Kood" />
    
    <form:label path="Nimetus" >Nimetus:</form:label>
    <br>
	<form:input path="Nimetus" />
    </td>
    <td>
    <p>
    <form:label path="Kommentaar" >Kommentaar:</form:label>
    <br>
	<form:textarea path="Kommentaar" />
    </p>
    </td>
  </tr>
   
  <tr>
    <td ><input name="Salvesta" onclick="addRecord(${vaeosaform.id})" type="submit" value="Salvesta" class="buttons" style="float:right;"></td>
    <td > <input name="Katkesta" type="reset" value="Katkesta" class="buttons">
    <input onclick="deleteRecord()" name="Kustuta" type="button" value="Kustuta" class="buttons">
    </td>
  </tr>
</table>
 </FORM>
 
 <div><a href="Navigation">Men��</a></div>
 
 </form:form>
	<c:if test="${VaeosaAdded == true }">
		<br/><br/><div>Uus V�eosa on lisatud. Vaata <a href="Vaeosad">k�iki V�eosasi.</a></div><br />
		<div><a href="Navigation">Men��</a></div>
	</c:if>
	<c:if test="${VaeosaModified == true }">
		<br/><br/><div>V�eosa muudetud. Vaata <a href="Vaeosad">k�iki V�eosai.</a></div><br />
		<div><a href="Navigation">Men��</a></div>
	</c:if>
	<c:if test="${deleteVaeosa == true }">
		<c:redirect url="Vaeosad" />
	</c:if>
    
    
</body>
</html>