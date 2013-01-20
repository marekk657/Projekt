<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="entity.nav.menu" /></title>
</head>
<body>
<div style="float:left; border:1px solid grey; padding-right:15px;">
<ul>
<sec:authorize access="hasRole('ROLE_EDIT') or hasRole('ROLE_ADD')">
	<li><a href="Piirivalvur"><spring:message code="nav.link.piirivalvur" /></a></li>
</sec:authorize>
<li><a href="Piirivalvurid"><spring:message code="nav.link.plural.piirivalvur" /></a></li>
<sec:authorize access="hasRole('ROLE_EDIT') or hasRole('ROLE_ADD')">
	<li><a href="Vaeosa"><spring:message code="nav.link.vaeosa" /></a></li>
</sec:authorize>
<li><a href="Vaeosad"><spring:message code="nav.link.plural.vaeosa" /></a></li>
<sec:authorize access="hasRole('ROLE_EDIT') or hasRole('ROLE_ADD')">
	<li><a href="Amet"><spring:message code="nav.link.amet" /></a></li>
</sec:authorize>
<li><a href="Ametid"><spring:message code="nav.link.plural.amet" /></a></li>
<sec:authorize access="hasRole('ROLE_EDIT') or hasRole('ROLE_ADD')">
	<li><a href="AmetVaeosas"><spring:message code="nav.link.ametvaeosas" /></a></li>
</sec:authorize>
<li><a href="AmetidVaeosas"><spring:message code="nav.link.plural.ametvaeosas" /></a></li>
<sec:authorize access="hasRole('ROLE_EDIT') or hasRole('ROLE_ADD')">
	<li><a href="PiirivalvurVaeosas"><spring:message code="nav.link.piirivalvurvaeosas" /></a></li>
</sec:authorize>
<li><a href="PiirivalvuridVaeosades"><spring:message code="nav.link.plural.piirivalvurvaeosas" /></a></li>
<li><a href="j_spring_security_logout"><spring:message code="nav.link.logout" /></a></li>
</ul>
</div>
</body>
</html>