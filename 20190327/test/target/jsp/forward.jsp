  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2019/3/27
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>跳转</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String number = request.getParameter("number");
    if (number == null || number.equals(""))
        number = "学号不得为空";
    String name = request.getParameter("name");
    if (name == null || name.equals(""))
        name = "姓名不得为空";
    String sex = request.getParameter("sex");
    String pwd = request.getParameter("pwd");
    String cfmpwd = request.getParameter("cfmpwd");
    if (pwd == null || pwd.equals(""))
        pwd = "密码不得为空";
    else if (!pwd.equals(cfmpwd))
        pwd = "密码不一致";
    String collage = request.getParameter("collage");
    StringBuilder hobby = new StringBuilder();
    String[] hobbies = request.getParameterValues("hobby");
    if (hobbies != null)
        for (String h : hobbies) {
            hobby.append(h).append(" ");
        }
    else
        hobby = new StringBuilder("没有爱好");
    String belief = request.getParameter("belief");
    if (belief == null || belief.equals(""))
        belief = "此人很懒，没有留下简介哦";
%>
<jsp:forward page="show.jsp">
    <jsp:param name="number" value="<%=number%>"/>
    <jsp:param name="name" value="<%=name%>"/>
    <jsp:param name="sex" value="<%=sex%>"/>
    <jsp:param name="pwd" value="<%=pwd%>"/>
    <jsp:param name="collage" value="<%=collage%>"/>
    <jsp:param name="hobby" value="<%=hobby.toString()%>"/>
    <jsp:param name="belief" value="<%=belief%>"/>
</jsp:forward>

</body>
</html>
