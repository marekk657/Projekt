<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
	document.amet.action="<c:url value="/DeleteAmet" />";  
	document.amet.method="POST";  
	document.amet.submit();
}
function addRecord(id) {
	if (id != -1) {
		document.amet.action="<c:url value="/ModifyAmet" />";
		document.amet.method="POST";
		document.amet.submit();
	} else {
		document.amet.action="<c:url value="/AddAmet" />";  
		document.amet.method="POST";  
		document.amet.submit();
	}
}
</script>
<title><spring:message code="amet.title" /></title>
</head>
<body>
	<form:form name="amet" method="POST" modelAttribute="ametform">
		<table width="400" border="0" cellspacing="0" cellpadding="0" style="margin-left:50px;">
	  
		  <tr>
		    <td>
		    	<form:label path="iscokood" ><spring:message code="amet.field.iscokood" /></form:label>
		      	<form:input path="iscokood" />
		        <form:label path="nimetus" ><spring:message code="amet.field.nimetus" /></form:label>
		      	<form:input path="nimetus" />
		      	<form:input type="hidden" path="id"  />
		    </td>
		    <td>
		    	<p>
		    		<form:label path="kommentaar" ><spring:message code="entity.field.kommentaar" /></form:label>
		        	<form:textarea path="kommentaar" />
		      	</p>
		    </td>
		  </tr>
		   
		  <tr>
		    <td><input onclick="addRecord(${ametform.id})" type="submit" value="<spring:message code="entity.btn.save" />" class="buttons" style="float:right;"></td>
		    <td>
		    	<input type="reset" value="<spring:message code="entity.btn.cancel" />" class="buttons">
		 		<input onclick="deleteRecord()" type="submit" value="<spring:message code="entity.btn.delete" />" class="buttons">   
		    </td>
		  </tr>
		  
		</table>
	</form:form>

	<div>
		<a href="<c:url value="/Navigation" />"><spring:message
				code="entity.nav.menu" /></a>
	</div>

	<c:if test="${ametAdded == true }">
		<br /><br />
		<spring:message code="amet.notif.added" /> <a href="<c:url value="/Ametid" />"><spring:message code="nav.link.plural.amet" /></a>
	</c:if>
	<c:if test="${ametModified == true }">
		<br/><br/>
		<spring:message code="amet.notif.modified" /> <a href="<c:url value="/Ametid" />"><spring:message code="nav.link.plural.amet" /></a>
	</c:if>
	<c:if test="${deleteAmet == true }">
		<c:redirect url="Ametid" />
	</c:if>
	
</body>
</html>