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
	document.piirivalvurvaeosas.action="<%=request.getContextPath()%>/DeleteAmet";  
	document.piirivalvurvaeosas.method="POST";  
	document.piirivalvurvaeosas.submit();
}
function addRecord(id) {
	if (id != -1) {
		document.piirivalvurvaeosas.action="<%=request.getContextPath()%>/ModifyAmet";
		document.piirivalvurvaeosas.method="POST";
		document.piirivalvurvaeosas.submit();
	} else {
		document.piirivalvurvaeosas.action="<%=request.getContextPath()%>/AddAmet";  
		document.piirivalvurvaeosas.method="POST";  
		document.piirivalvurvaeosas.submit();
	}
}
</script>

<title>Piirivalvur väeosas</title>
</head>
<body>
	<form:form name="piirivalvurvaeosas" method="POST" modelAttribute="piirivalvurvaeosasform">
      <table width="400" border="0" cellspacing="0" cellpadding="0" style="margin-left:50px;">
  
  <tr>
        <td> <form:label path="Piirivalvur" >Piirivalvur:</form:label> </td>
        <td> <form:label path="Alates" >Alates:</form:label>   </td>
  </tr>
  
  <tr>
        <td> <form:input path="Piirivalvur" />  </td>
        <td> <form:input path="Alates" /> </td>
  </tr> 
   
  <tr>    
        <td> <form:label path="Vaeosa" >Väeosa:</form:label></td>
        <td> <form:label path="Kuni" >Kuni:</form:label>  </td>
  </tr>
  
 	<tr>
        <td> <form:input path="Vaeosa" /> </td>
        <td> <form:input path="Kuni" /> </td>
   </tr> 
    
    
   <tr>
     <td><form:label path="Amet" >Amet:</form:label></td>
     <td></td>
   </tr>  

    <tr>
     <td colspan="2"> <form:input path="Amet" />  </td>
      </tr>
     
     <tr>
     <td><form:label path="Kommentaar" >Kommentaar:</form:label></td>
      <td></td>
   </tr>  
    <tr>
     <td colspan="2"> <form:textarea path="Kommentaar" /> </td>
      </tr> 
     
      
      
  <tr>
    <td ><input name="Salvesta" onclick="addRecord(${piirivalvurvaeosasform.id})" type="button" value="Salvesta" class="buttons">
   <input name="Katkesta" type="button" value="Katkesta" class="buttons">
    <input name="Kustuta" onclick="deleteRecord()" type="button" value="Kustuta" class="buttons">
    </td>
  </tr>
</table>
 </form:form>
 <div><a href="Navigation">Menüü</a></div> 
 
 
 </form:form>

	<c:if test="${piirivalvurvaeosasAdded == true }">
		<br/><br/><div>Uus Piirivalvuri väeosa on lisatud. Vaata <a href="All-Info-Piirivalvurid">kõiki Piirivalvuri väeosasi</a></div><br />
		<div><a href="Navigation">Menüü</a></div>
	</c:if>
	<c:if test="${piirivalvurvaeosastModified == true }">
		<br/><br/><div>Piirivalvuri väeosa muudetud. Vaata <a href="All-Info-Piirivalvurid">kõiki Piirivalvuri väeosasi</a></div><br />
		<div><a href="Navigation">Menüü</a></div>
	</c:if>
	<c:if test="${deletepiirivalvurvaeosas == true }">
		<c:redirect url="All-Info-Piirivalvurid" />
	</c:if>
    
    
</body>
</html>