<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示</title>
</head>

<body>
<%request.setCharacterEncoding("UTF-8");%>
学号：<%=request.getParameter("number")%><br/>
姓名：<%=request.getParameter("name")%><br/>
性别：<%=request.getParameter("sex")%><br/>
密码：<%=request.getParameter("pwd")%><br/>
学院：<%=request.getParameter("collage")%><br/>
爱好：<%=request.getParameter("hobby")%><br/>
个人简历：<%=request.getParameter("belief")%><br/>
</body>
</html>