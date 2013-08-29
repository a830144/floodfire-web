<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>  
  <%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%@page import="java.util.*" %>
  <title>queryTweet</title>  
</head>
<script>
function getOpenerEvent()
{
	var addJobEventName = window.opener.document.getElementById('addJobEventName').value;
	document.getElementById('addJobEventNameId').value=addJobEventName;
}
</script>
<body onload="getOpenerEvent()">
<FORM
 METHOD="POST" 
 ACTION="queryTweetSchedule.do" >
事件名稱:<input name="addJobEventName" id="addJobEventNameId" readonly>
<br>
蒐集所用API:
<input type="radio" name="queryType" value="mix" checked>混合
<input type="radio" name="queryType" value="search" >SEARCH/REST API
<input type="radio" name="queryType" value="stream" >STREAM API
<br>
<fieldset> <legend>蒐集條件:</legend>
<input type="radio" name="queryFunc" value="byKeyword" checked>用關鍵字:
<input size="10" name="keyword"><br>
<input type="radio" name="queryFunc" value="byMentionedUser" disabled>用被推文人:
<input size="10" name="mention" disabled><br>
<input type="radio" name="queryFunc" value="byKeywordAndMentionedUser" disabled>用 關鍵字<input size="10" name="keyword1" disabled>+被推文人
<input size="10" name="mention1" disabled>
<br>
</fieldset>
<fieldset> <legend>Access Token:</legend>
<%
	int tokenUsable = ((Integer)request.getAttribute("tokenUsable")).intValue();
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
</fieldset> 
</FORM>
</body>
</html>