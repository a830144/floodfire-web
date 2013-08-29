<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
  <%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
  <title>newEventResult</title>  

</head><body>
<FORM
 METHOD="POST" 
 ACTION="newEventResult.do" >

<fieldset> <legend>事件資訊:</legend>
事件名稱:<input size="10" name="eventName">
<br>
事件類別:<input size="10" name="eventType">
<br>
<input type ="submit" class="but" value="送出" name="submit">
<br>
</fieldset>
</FORM>

<%= request.getAttribute("result") %>

</body></html>
