<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="login.title" /></title>
</head>
<body>
<div style="border:1px solid grey; width:180px; margin-left:auto;margin-right:auto;margin-top:250px;">
 <FORM ACTION='j_spring_security_check' METHOD="POST" style="margin-bottom: 5px;">
    <table width="170" border="0" cellspacing="0" cellpadding="0" style="margin-left:auto; margin-right:auto;  ">
  <tr>
    <td><spring:message code="login.field.kasutaja" /><br />
    <INPUT TYPE="TEXT" NAME='j_username' value=''></td>
  </tr>
  <tr>
    <td><spring:message code="login.field.password" /><br />
    <INPUT TYPE="password" NAME='j_password' ></td>
  </tr>
  <tr>
    <td><input type="submit" value="<spring:message code="login.btn.logi" />" class="buttons" style="float:left;" >
    <input type="reset" value="<spring:message code="entity.btn.cancel" />" class="buttons" style="float:right;">
</td>
  </tr>

</table>
 </FORM>
</div>

</body>
</html>