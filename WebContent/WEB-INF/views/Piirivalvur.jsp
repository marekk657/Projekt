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
<title>Piirivalvuri vorm</title>
</head>
<body>
 <FORM ACTION="AddPiirivalvur" METHOD="POST">
      <table width="400" border="0" cellspacing="0" cellpadding="0" style="margin-left:50px;">
  <tr>
    <td width="168"> Sõduri kood:
            <INPUT TYPE="TEXT" NAME="Sodurikood"></td>
    <td width="280"> E-mail:
      <br>            <INPUT TYPE="TEXT" NAME="E-mail"> </td>
  </tr>
  <tr>
    <td> Isikukood: 
      <INPUT TYPE="TEXT" NAME="Isikukood"></td>
    <td>Telefon:<br>      <INPUT TYPE="TEXT" NAME="Telefon">   
   </td>
  </tr>
  <tr>
    <td>Eesnimi:
            <INPUT TYPE="TEXT" NAME="Eesnimi"></td>
    <td>Aadress:<br>      <INPUT TYPE="TEXT" NAME="Aadress"> </td>
  </tr>
  <tr>
    <td>Perekonnanimi:
            <INPUT TYPE="TEXT" NAME="Perekonnanimi">
            Sugu:
            <select NAME="Sugu">
			  <option value="Mees">Mees</option>
			  <option value="Naine">Naine</option>
			</select> 
    <td><p>Kommentaar:
             
        <textarea name="" cols="" rows="" ></textarea>
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