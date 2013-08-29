<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
  <%@page contentType="text/html" pageEncoding="UTF-8"%>
  <title>newAuthResult</title>   
  <link rel="stylesheet" href="floodfire.css" type="text/css">

</head><body>
<FORM
 METHOD="POST" 
 ACTION="newAuthResult.do" >
<fieldset> <legend>認證資訊:</legend>
帳號:<input size="10" name="account">
<br>
密碼:<input type="password" size="10" name="password">
<br>
再次輸入:<input type="password" size="10" name="repassword">
<br>
<input type ="submit" class="but" value="送出" name="summitPasswd">
<br>
</fieldset>
</FORM>

<%= request.getAttribute("result") %>

</body></html>
