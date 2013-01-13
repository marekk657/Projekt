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
<title>Ameti vorm</title>
</head>
<body>
 <FORM ACTION="AddAmet" METHOD="POST">
      <table width="400" border="0" cellspacing="0" cellpadding="0" style="margin-left:50px;">
  
  <tr>
    <td>Isco kood:<br>
      <INPUT TYPE="TEXT" NAME="Isco_kood">
            Nimetus:
      <INPUT TYPE="TEXT" NAME="Nimetus"></td>
    <td><p>Kommentaar:
             
        <textarea name="" cols="" rows="" NAME="coms"></textarea>
      </p></td>
  </tr>
   
  <tr>
    <td ><input name="Salvesta" type="submit" value="Salvesta" class="buttons" style="float:right;"></td>
    <td > <input name="Katkesta" type="reset" value="Katkesta" class="buttons">
    <input name="Kustuta" type="button" value="Kustuta" class="buttons">
    </td>
  </tr>
</table>
 </FORM>
</body>
</html>