<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head> 
   <%@page contentType="text/html" pageEncoding="UTF-8"%>
   <%@page import="java.util.*" %>
  <title>queryTokenResult</title>
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
 NAME="myform"
 METHOD="POST" 
 ACTION="queryTokenResult.do" >
<input type ="button" style="border: 1px solid #666666;background-color: #dddddd;color:blue;" value="新增" name="newToken" onclick="open_win()">
<input type ="button" style="border: 1px solid #666666;background-color: #dddddd;color:red;" value="刪除" name="deleteToken">
<input type ="submit" style="border: 1px solid #666666;background-color: #dddddd;color:green;" value="查詢" name="queryTokenResult">
<input type ="button" style="border: 1px solid #666666;background-color: #dddddd;color:gray;" value="修改" name="updateToken" onclick="open_updatewin()">
<fieldset> <legend>token資訊:</legend>
tokenName:<input size="10" name="tokenName">
</fieldset>


<script>
function open_win()
{
	
      w1 = window.open("newToken.do", "", "width=650, height=400");
	  w1.focus();

	
}
function open_updatewin()
{
	var checkbox=document.forms['myform'].checkB;
    for(i=0;i<checkbox.length;i++) {
        if(checkbox[i].checked==true)
        {
           var jobId = checkbox[i].value.substring(5);
           var tokenId = 'tokenId' + jobId;
           var tokenName = 'tokenName' + jobId;
           var frequency = 'frequency' + jobId;
           var locked = 'locked' + jobId;
           
           document.getElementById('tokenId').value = document.getElementById(tokenId).innerHTML;
           document.getElementById('tokenName').value = document.getElementById(tokenName).innerHTML;
           document.getElementById('frequency').value = document.getElementById(frequency).innerHTML;
           document.getElementById('locked').value = document.getElementById(locked).innerHTML;

           w1 = window.open("updateToken.do", "", "width=650, height=400");
	       w1.focus();
        }

    }
}
function open_test(tokenId)
{
	document.getElementById('tokenId').value=tokenId;
	w1 = window.open("testConnection.do", "測試連線", "width=400, height=300 toolbar=no");
	w1.focus();
}
function checkbox(jobId)
{
    var checkbox=document.forms['myform'].checkB;
    for(i=0;i<checkbox.length;i++) {
        if(checkbox[i].value!=jobId)
        {
           checkbox[i].checked=false;
        }

    }
    
}
</script>
 
<fieldset> <legend>查詢結果:</legend>
<table border="3">
<tr>	
<td></td>
<td>id</td>
<td>名稱</td>
<td>頻率</td>
<td>鎖定</td>
<td>最後使用JOB</td>
<td>試連線</td>
<td>AT</td>
<td>AT SECRET</td>
<td>CONSUMERKEY</td>
<td>CONSUMERKEY SECRET</td>

</tr>

<%
List list = (List)request.getAttribute("list");
for (int i = 0; i < list.size(); i++) {
	List sublist = (List)list.get(i);
%>
            <tr align="center">
                <td><input type ="checkbox" name="checkB" value="check<%=sublist.get(0)%>" onchange="checkbox('check<%=sublist.get(0)%>')"></input>
                </td>
                <td width="100" id="tokenId<%=sublist.get(0)%>"><%= sublist.get(0) %></td>
                <td width="200" id="tokenName<%=sublist.get(0)%>"><%= sublist.get(1) %></td>
                <td width="200" id="frequency<%=sublist.get(0)%>"><%= sublist.get(8) %></td>
                <td width="300" id="locked<%=sublist.get(0)%>"><%= sublist.get(6) %></td>
                <td width="300"><%= sublist.get(7) %></td>
                <td width="100"><input type="button" value="測試" name="testConnection" onclick="open_test('<%=sublist.get(0)%>')"></input>
				</td>
                <td width="200" id="AT<%=sublist.get(0)%>"><%= sublist.get(2) %></td>
                <td width="200"><%= sublist.get(3) %></td>
                <td width="200"><%= sublist.get(4) %></td>
                <td width="200"><%= sublist.get(5) %></td>
                
            </tr>
           
<%
}
%>
            
           

</table>
<input type ="hidden" name="tokenId" id="tokenId">
<input type ="hidden" name="tokenName" id="tokenName">
<input type ="hidden" name="frequency" id="frequency">
<input type ="hidden" name="locked" id="locked">
</fieldset>
</FORM>
</body></html>