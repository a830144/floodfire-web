<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
  <%@page contentType="text/html" pageEncoding="UTF-8"%>
  <title>eventMain</title>
</head>
<style type="text/css">

body {
	font-family: Arial, Helvetica, sans-serif;
	font-size:12px;
	color:#666666;
	background:#fff;
	text-align:center;

}

* {
	margin:0;
	padding:0;
}

a {
	color:#1E7ACE;
	text-decoration:none;	
}

a:hover {
	color:#000;
	text-decoration:underline;
}
h3 {
	font-size:14px;
	font-weight:bold;
}

pre,p {
	color:#1E7ACE;
	margin:4px;
}
input, select,textarea {
	padding:1px;
	margin:2px;
	font-size:11px;
}
.button{
	padding:1px 10px;
	font-size:12px;
	border:1px #1E7ACE solid;
	background:#D0F0FF;
}
#formwrapper {
	width:450px;
	margin:15px auto;
	padding:20px;
	text-align:left;
	border:1px #1E7ACE solid;
}

fieldset {
	padding:10px;
	margin-top:5px;
	border:1px solid #1E7ACE;
	background:#fff;
}

fieldset legend {
	color:#1E7ACE;
	font-weight:bold;
	padding:3px 20px 3px 20px;
	border:1px solid #1E7ACE;	
	background:#fff;
}

fieldset label {
	float:left;
	width:120px;
	text-align:right;
	padding:4px;
	margin:1px;
}

fieldset div {
	clear:left;
	margin-bottom:2px;
}

.enter{ text-align:center;}
.clear {
	clear:both;
}


</style>

<body>
<FORM
 METHOD="POST" 
 ACTION="queryEventResult.do" >
<input type ="button" style="border: 1px solid #666666;background-color: #dddddd;color:blue;" value="新增" name="newEvent" onclick="open_win()">
<input type ="button" style="border: 1px solid #666666;background-color: #dddddd;color:red;" value="刪除" name="deleteEvent">
<input type ="submit" style="border: 1px solid #666666;background-color: #dddddd;color:green;" value="查詢" name="queryEventResult">
<input type ="button" style="border: 1px solid #666666;background-color: #dddddd;color:gray;" value="修改" name="updateEvent">
<fieldset> <legend>事件資訊:</legend>
事件名稱:<input size="10" name="eventName">
<br>
事件類別:<input size="10" name="eventType">
<br>
</fieldset>
</FORM>
<script>
function open_win()
{
	w1 = window.open("newEvent.do", "", "width=400, height=200");
	w1.focus();
}
</script>

</body></html>
