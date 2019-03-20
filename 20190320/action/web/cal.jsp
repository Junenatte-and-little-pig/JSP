<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2019/3/20
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>计算</title>
</head>
<body>
<%!private int sum=0;%>
<%for(int i=0;i<Integer.parseInt(request.getParameter("n"));i++)
sum+=i;
%>
<jsp:forward page="show.jsp">
	<jsp:param name="sum" value="<%=sum%>"/>
</jsp:forward>
</body>
</html>
