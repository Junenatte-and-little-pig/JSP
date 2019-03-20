<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2019/3/13
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>summary</title>
</head>
<body>
计算<%! int sum=0;%>
<%
	for(int i=0;i<100;i=i+2)
		sum+=i;
%>
结果<%=sum%>
<%@include file="mul.jsp"%>
</body>
</html>
