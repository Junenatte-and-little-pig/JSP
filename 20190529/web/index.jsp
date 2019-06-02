<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<form action="login?action=signin" method="post">
    学号：<input type="text" name="username"><br/>
    密码：<input type="password" name="password"><br/>
    <input type="submit" value="登录"><br/>
    <%=request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%>
</form>
<a href="signup.jsp">点此注册</a>
</body>
</html>
