<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>  
   <%@page contentType="text/html" pageEncoding="UTF-8"%>
   <%@page import="java.util.*" %>
   <title>analyzeMainContent</title> 
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
<script>
function open_win()
{
	if(document.getElementById('reportType1').checked)
	{
	   w1 = window.open("analyzeByUser.do", "", "width=600, height=400");
	   w1.focus();
	}
	
}
</script>
<body>
<fieldset> <legend>個人已排定的job:</legend>
		<table border="3">
		        <tr>
		            <td colspan=5>
		            <input type = "radio" id="reportType1" name ="reportType" value="1" checked>每日推文量/推文人比例圖</input>
		            <br>
		                                 統計起始<input name ="startDate"></input>~ 
                                                      統計結束<input name ="endDate"></input>
                    <br> 
                                                      內文關鍵字 <input name ="keyword"></input>                            
                    <input type="button" name ="button" value="統計" onclick="open_win()" >
		            </td>		            
		        </tr>
				<tr>
				    <td></td>
				    <td>事件名稱</td>
					<td>工作序號</td>	
					<td>蒐集所用API</td>
					<td>蒐集條件</td>														
				</tr>

				<%
					List list = (List) request.getAttribute("list");
					for (int i = 0; i < list.size(); i++) {
						List sublist = (List) list.get(i);
				%>
				<tr align="center">
				<td width="20"><input type ="checkbox" name="check<%=sublist.get(1)%>"></input></td>
                <td width="100" style="word-break:break-all"><%=sublist.get(0)%></td>
                <td  nowrap><%=sublist.get(1)%></td>
                <td width="100" style="word-break:break-all"><%=sublist.get(2)%></td>
                <td width="100" style="word-break:break-all"><%=sublist.get(3)%></td>
               
               
              
                </tr>

				<%
					}
				%>


</table>
		
</fieldset>
</body></html>