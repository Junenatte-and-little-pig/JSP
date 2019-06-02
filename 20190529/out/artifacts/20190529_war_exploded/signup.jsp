<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
<form action="login?action=signup" method="post" onsubmit="return confirm(this)">
    学号：<input type="text" name="username"><br/>
    姓名：<input type="text" name="name"><br />
    密码：<input type="password" name="password"><br/>
    确认密码：<input type="password" name="confirm_password"><br/>
    <input type="submit" value="注册"><br/>
    <%=request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%>
</form>
<script>
    function confirm(frm) {
        return frm.children[4].value === frm.children[6].value;
    }
</script>
</body>
</html>
