<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
  <%@page contentType="text/html" pageEncoding="UTF-8"%>
  <title>index</title>    
  <link rel="stylesheet" href="floodfire.css" type="text/css">

</head>
<script>
function getOpenerEvent()
{
	var tokenId = window.opener.document.getElementById('tokenId').value;
	document.getElementById('tokenId').value=tokenId;
	var tokenName = window.opener.document.getElementById('tokenName').value;
	document.getElementById('tokenName').value=tokenName;
	var frequency = window.opener.document.getElementById('frequency').value;
	document.getElementById('frequency').value=frequency;
	var locked = window.opener.document.getElementById('locked').value;
	document.getElementById('locked').value=locked;
}
</script>
<body onload="getOpenerEvent()">
<FORM
 METHOD="POST" 
 ACTION="updateTokenResult.do" >

<fieldset> <legend>token資訊:</legend>
tokenId:<input size="10" name="tokenId" id="tokenId">
<br>
token名稱:<input size="10" name="tokenName" id="tokenName">
<br>
利用token執行search api job時執行頻率(秒):<input size="10" name="frequency" id="frequency">
<br>
鎖定:<input size="2" name="locked" id="locked">
<br>
<input type ="submit" value="送出" name="summit">
<br>
</fieldset>
</FORM>
修改成功!!

</body></html>
