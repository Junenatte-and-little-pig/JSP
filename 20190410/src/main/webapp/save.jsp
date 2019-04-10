<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2019/4/10
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>保存</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="msg" class="Message">
    <jsp:setProperty name="msg" property="*"/>
</jsp:useBean>
<jsp:forward page="disp.jsp"/>
</body>
</html>
