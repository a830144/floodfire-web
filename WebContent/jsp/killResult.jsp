<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<title>killResult</title>
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
function xclick(name,queryFunc)
{
	document.getElementById('killJob').value=name;
	document.getElementById('queryFunc').value=queryFunc;

}
function open_win(previewJob)
{

    document.getElementById('previewJob').value=previewJob;
	w1 = window.open("preview.do", "預覽", "width=600, height=400,scrollbars=yes");
    w1.focus();
}
function open_trendwin(trendJob)
{

    document.getElementById('trendJob').value=trendJob;
	w1 = window.open("trend.do", "趨勢圖", "width=600, height=400,scrollbars=yes");
    w1.focus();
}
</script>
<body>
	<FORM METHOD="POST" ACTION="killResult.do">
		<fieldset>
			<legend>已排定的job:</legend>
			<table border="3">
				<tr>
					<td>事件名稱</td>
					<td>工作序號</td>
					<td>蒐集所用API</td>
					<td>蒐集條件</td>
					<td>開始執行時間</td>
					<td>執行結束時間</td>
					<td>排程人員</td>					
					<td>蒐集資料筆數</td>
					<td>排程狀態</td>					
					<td>工作停止</td>
					<td>預覽資料</td>
					<td>趨勢圖</td>
				</tr>
				<%
					List list = (List) request.getAttribute("list");
					for (int i = 0; i < list.size(); i++) {
						List sublist = (List) list.get(i);
				%>
				<tr align="center">
                <td width="100" style="word-break:break-all"><%=sublist.get(0)%></td>
                <td width="100" style="word-break:break-all"><%=sublist.get(1)%></td>
                <td width="100" style="word-break:break-all"><%=sublist.get(2)%></td>
                <td width="100" style="word-break:break-all"><%=sublist.get(3)%></td>
                <td width="100" style="word-break:break-all"><%=sublist.get(4)%></td>
                <% if(sublist.get(5) ==null)
                   {
                %>
                <td width="100" style="word-break:break-all"></td>
                <% 
                   }else{
                %>
                <td width="100" style="word-break:break-all"><%=sublist.get(5)%></td>
                <% 
                   }
                %>
                
                <td width="100" style="word-break:break-all"><%=sublist.get(6)%></td>
                <% if(sublist.get(7) ==null)
                   {
                %>
                <td width="100" style="word-break:break-all">0</td>
                <% 
                   }else{
                %>
                <td width="100" style="word-break:break-all"><%=sublist.get(7)%></td>
                <% 
                   }
                %>
                <td width="100" style="word-break:break-all"><%=sublist.get(8)%></td>
                <td width="100" style="word-break:break-all">
                <% if("已停止".equals(sublist.get(8)))
                   {
                %>
                <input type="submit" name ="button<%=sublist.get(1)%>" value="停止" onclick="xclick('<%=sublist.get(1)%>','<%=sublist.get(2)%>')" disabled></input>
                <% 
                   }else{
                %>
                <input type="submit" name ="button<%=sublist.get(1)%>" value="停止" onclick="xclick('<%=sublist.get(1)%>','<%=sublist.get(2)%>')"></input>
                <% 
                   }
                %>
                </td>
                <td width="100" style="word-break:break-all">
                <input type ="button" style="border: 1px solid #666666;background-color: #dddddd;color:blue;" value="預覽" name="preview" onclick="open_win('<%=sublist.get(1)%>')">
                </td>
                <td width="100" style="word-break:break-all">
                <input type ="button" style="border: 1px solid #666666;background-color: #dddddd;color:blue;" value="趨勢圖" name="trend" onclick="open_trendwin('<%=sublist.get(1)%>')">
                </td>
                </tr>

				<%
					}
				%>


			</table>
			<input type="hidden" name="killJob" id="killJob"></input>
			<input type="hidden"  name="queryFunc" id="queryFunc"></input>				
			<input type="hidden" name="previewJob" id="previewJob"></input>
			<input type="hidden" name="trendJob" id="trendJob"></input>
		</fieldset>
	</FORM>
	工作停止完成!!!
</body>
</html>