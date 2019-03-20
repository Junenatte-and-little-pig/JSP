<%@ page import="sun.misc.Request" %><%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2019/3/20
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>主页面</title>
</head>
<body>
<label>
	<input type="text" name="x">
</label>
<jsp:include page="cal.jsp">
	<jsp:param name="n" value="5"/>

</jsp:include>
</body>
</html>
