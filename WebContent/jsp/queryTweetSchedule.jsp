<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>  
  <%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%@page import="java.util.*" %>
  <title>queryTweetSchedule</title>  
</head>
<script>
function getOpenerEvent()
{
	var addJobEventName = window.opener.document.getElementById('addJobEventName').value;
	document.getElementById('addJobEventName').value=addJobEventName;
}
</script>
<body onload="getOpenerEvent()">
<FORM
 METHOD="POST" 
 ACTION="queryTweetSchedule.do" >
事件名稱:<input name="addJobEventName" id="addJobEventName" readonly></input>
<br>
蒐集所用API:
<input type="radio" name="queryType" value="mix" checked>混合
<input type="radio" name="queryType" value="search" >SEARCH/REST API
<input type="radio" name="queryType" value="stream" >STREAM API
<br>
<fieldset> <legend>蒐集條件:</legend>
<input name="queryFunc" value="byKeyword" type="radio" checked>用關鍵字:
<input size="10" name="keyword"><br>
<input name="queryFunc" value="byMentionedUser" type="radio" disabled>用被推文人:
<input size="10" name="mention"><br>
<input name="queryFunc" value="byKeywordAndMentionedUser" type="radio" disabled>用 關鍵字<input size="10" name="keyword1">+被推文人
<input size="10" name="mention1">
<br>
</fieldset>
<fieldset> <legend>Access Token:</legend>
<%
	Object[] o =(Object[])request.getAttribute("o");
	int tokenUsable = ((Integer)o[0]).intValue();
%>
<%
    if(tokenUsable!=0)
    {
%>
目前尚有<%=tokenUsable%>組Access Token可供使用!
<br>
<input type="submit" value="設定job" name="submit" >
<input type="button" value="關閉畫面" onClick='window.close()' >
<%
    }
    else
    {
%>
<br>
目前已沒有Access Token可使用! 請洽管理人員!
<input type="submit" value="設定job" name="submit" disabled>
<input type="button" value="關閉畫面" onClick='window.close()' >

<%
    }
%>

</FORM>
</body>
</html>
<br>
您的工作已排入,工作序號<BR>「<% out.print(o[1]); %>」<BR>,請稍後至管理功能中確認確認資料蒐集狀況!