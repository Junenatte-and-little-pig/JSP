<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2019/3/13
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page errorPage="err.jsp" %>
<html>
<head>
	<title>mul</title>
</head>
<body>
计算<%! int sum =1;%><%--重名时为sum--%>
<%
	for(int i=2;i<=10;i++)
		sum *=i;
%>
结果<%=sum%>
</body>
</html>
