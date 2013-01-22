<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
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
		<table id="formtable" width="400" border="0" cellspacing="0" cellpadding="0" style="margin-left:50px;">
	  
		  <tr>
		    <td>
		    	<form:label path="iscokood" ><spring:message code="amet.field.iscokood" /></form:label>
		      	<form:input path="iscokood" />
		      	<br />
		        <form:label path="nimetus" ><spring:message code="amet.field.nimetus" /></form:label>
		      	<form:input path="nimetus" />
		      	<form:input type="hidden" path="id"  />
		    </td>
		    <td>
	    		<form:label path="kommentaar" ><spring:message code="entity.field.kommentaar" /></form:label>
	        	<form:textarea path="kommentaar" />
		    </td>
		  </tr>
		   
		  <tr>
		    <td colspan="2">
				<c:if test="${ametIscokoodNotNull == true }">
					<span id="veateade"><spring:message code="NotNull.Amet.iscokood" /></span><br />
				</c:if>
				<c:if test="${ametIscokoodSize == true }">
					<span id="veateade"><spring:message code="Size.Amet.iscokood" /></span><br />
				</c:if>
				<c:if test="${ametNimetusNotNull == true }">
					<span id="veateade"><spring:message code="NotNull.Amet.nimetus" /></span><br />
				</c:if>
				<c:if test="${ametNimetusSize == true }">
					<span id="veateade"><spring:message code="Size.Amet.nimetus" /></span><br />
				</c:if>
				<sec:authorize access="hasRole('ROLE_EDIT') or hasRole('ROLE_ADD')">
			    	<input onclick="addRecord(${ametform.id})" type="submit" value="<spring:message code="entity.btn.save" />" class="buttons">
			    </sec:authorize>
			    <sec:authorize access="hasRole('ROLE_EDIT') or hasRole('ROLE_ADD')">
			    	<input type="reset" value="<spring:message code="entity.btn.cancel" />" class="buttons">
			 	</sec:authorize>
			    <sec:authorize access="hasRole('ROLE_DEL')">
			    	<input onclick="deleteRecord()" type="submit" value="<spring:message code="entity.btn.delete" />" class="buttons">   
			    </sec:authorize>
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