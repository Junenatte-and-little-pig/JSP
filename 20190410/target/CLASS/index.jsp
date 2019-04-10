<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2019/4/10
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言板</title>
</head>
<body>
<form action="save.jsp">
    留言板<br/>
    留言者：<label>
    <input type="text" name="usr"/>
</label><br/>
    标题：<label>
    <input type="text" name="title"/>
</label><br/>
    内容：<br/>
    <label>
        <textarea name="content" rows="6" cols="20"></textarea>
    </label><br/>
    <input type="submit" value="留言"/>
</form>
</body>
</html>
