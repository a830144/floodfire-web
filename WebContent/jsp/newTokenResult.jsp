<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
  <%@page contentType="text/html" pageEncoding="UTF-8"%>
  <title>newTokenResult</title>    
  <link rel="stylesheet" href="floodfire.css" type="text/css">

</head><body>
<FORM
 METHOD="POST" 
 ACTION="newTokenResult.do" >

<fieldset> <legend>token資訊:</legend>
<br>
tokenId:<input size="10" name="tokenId">
<br>
token名稱:<input size="10" name="tokenName">
<br>
accessToken:<input size="100" name="accessToken">
<br>
accessTokenSecret:<input size="100" name="accessTokenSecret">
<br>
consumerKey:<input size="100" name="consumerKey">
<br>
consumerSecret:<input size="100" name="consumerSecret">
<br>
<input type ="submit" class="but" value="送出" name="summit">
<br>
</fieldset>

<%= request.getAttribute("result") %>

</body></html>
