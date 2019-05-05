<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>留言面板</title>
</head>
<body>
<form action="handle.jsp">
    <label>
    留言人：
    <input type="text" name="username" id="username"/>
    </label>
    <br/>
    <label>
    留言板：
    <textarea name="message" id="message" cols="20" rows="15"></textarea>
    </label>
    <br/>
    <input type="submit" value="留言">
</form>
</body>
</html>
