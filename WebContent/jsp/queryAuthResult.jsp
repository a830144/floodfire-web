<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head> 
   <%@page contentType="text/html" pageEncoding="UTF-8"%>
   <%@page import="java.util.*" %>
  <title>queryAuthResult</title>
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
table {
		border-collapse:collapse;
		background:#EFF4FB url(http://www.roscripts.com/images/teaser.gif) repeat-x;
		border-left:1px solid #686868;
		border-right:1px solid #686868;
		font:0.8em/145% 'Trebuchet MS',helvetica,arial,verdana;
		color: #333;
}

td, th {
		padding:5px;
}

caption {
		padding: 0 0 .5em 0;
		text-align: left;
		font-size: 1.4em;
		font-weight: bold;
		text-transform: uppercase;
		color: #333;
		background: transparent;
}


table a {
		color:#950000;
		text-decoration:none;
}

table a:link {}

table a:visited {
		font-weight:normal;
		color:#666;
		text-decoration: line-through;
}

table a:hover {
		border-bottom: 1px dashed #bbb;
}


thead th, tfoot th, tfoot td {
		background:#333 url(http://www.roscripts.com/images/llsh.gif) repeat-x;
		color:#fff
}

tfoot td {
		text-align:right
}


tbody th, tbody td {
		border-bottom: dotted 1px #333;
}

tbody th {
		white-space: nowrap;
}

tbody th a {
		color:#333;
}

.odd {}

tbody tr:hover {
		background:#fafafa
}
</style>
  
</head>
<body>
<FORM
 METHOD="POST" 
 ACTION="queryAuthResult.do" >
<input type ="button" style="border: 1px solid #666666;background-color: #dddddd;color:blue;" value="新增" name="newAuth" onclick="open_win()">
<input type ="button" style="border: 1px solid #666666;background-color: #dddddd;color:red;" value="刪除" name="deleteAuth">
<input type ="submit" style="border: 1px solid #666666;background-color: #dddddd;color:green;" value="查詢" name="queryAuthResult">
<input type ="button" style="border: 1px solid #666666;background-color: #dddddd;color:gray;" value="修改" name="updateAuth">
<fieldset> <legend>認證資訊:</legend>
帳號:<input size="10" name="account">
</fieldset>

</FORM>
<script>
function open_win()
{
	w1 = window.open("newAuth.do", "", "width=400, height=200");
	w1.focus();
}
</script>
 
<fieldset> <legend>查詢結果:</legend>
<table border="3">
<tr>	
<td></td>
<td>帳號</td>
<td>密碼</td>
<td>角色</td>
</tr>

<%
List list = (List)request.getAttribute("list");
for (int i = 0; i < list.size(); i++) {
	List sublist = (List)list.get(i);
%>
            <tr align="center">
                <td><input type ="checkbox" name="check<%=sublist.get(0)%>"></td>
                <td width="100"><%= sublist.get(0) %></td>
                <td width="200"><%= sublist.get(1) %></td>
                <td width="300">一般使用者</td>
            </tr>
           
<%
}
%>
            
           

</table>

</fieldset>
</body></html>