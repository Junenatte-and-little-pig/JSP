<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2019/3/6
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<title>结果</title>
	</head>
	<body>
		<%
			double r=Double.parseDouble(request.getParameter("range"));
			double a=Math.PI*r*r;
		%>
	面积：<%=a%>
	</body>
</html>
