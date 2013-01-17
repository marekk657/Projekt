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
<title>Amet v�eosas</title>
</head>
<body>
<form:form name="ametvaeosas" method="POST" modelAttribute="ametvaeosasform">

      <table width="400" border="0" cellspacing="0" cellpadding="0" style="margin-left:50px;">
  
  <tr>
        <td><form:label path="Piirivalvur" >Piirivalvur:</form:label> </td>
        <td><form:label path="Alates" >Alates:</form:label>   </td>
  </tr>
  
  <tr>
        <td> <form:input path="Piirivalvur" />  </td>
        <td> <form:input path="Alates" /> </td>
  </tr> 
   
  <tr>    
        <td> <form:label path="Vaeosa" >V�eosa:</form:label></td>
        <td> <form:label path="Kuni" >Kuni:</form:label></td>
  </tr>
  
 	<tr>
        <td> <form:input path="Vaeosa" /> </td>
        <td> <form:input path="Kuni" /> </td>
   </tr> 
    
    
  
     
     <tr>
     <td> <form:label path="Kommentaar" >Kommentaar:</form:label></td>
      <td></td>
   </tr>  
    <tr>
     <td colspan="2"> <form:textarea path="Kommentaar" /></td>
      </tr> 
     
      
      
  <tr>
    <td ><input onclick="addRecord(${ametvaeosasform.id})" name="Salvesta" type="button" value="Salvesta" class="buttons">
   <input name="Katkesta" type="reset" value="Katkesta" class="buttons">
    <input onclick="deleteRecord()" name="Kustuta" type="button" value="Kustuta" class="buttons">
    </td>
  </tr>
</table>
</form:form>
 <div><a href="Navigation">Men��</a></div> 
 
 <c:if test="${ametvaeosaAdded == true }">
		<br/><br/><div>Uus Amet V�eossa on lisatud. Vaata <a href="Ametidvaeosas">k�iki ameteid v�eosas</a></div><br />
		<div><a href="Navigation">Men��</a></div>
	</c:if>
	<c:if test="${ametvaeosaModified == true }">
		<br/><br/><div>Amet V�eossa muudetud. Vaata <a href="Ametidvaeosas">k�iki ameteid v�eosas</a></div><br />
		<div><a href="Navigation">Men��</a></div>
	</c:if>
	<c:if test="${deleteametvaeosa == true }">
		<c:redirect url="Ametidvaeosas" />
	</c:if>
    
 
</body>
</html>