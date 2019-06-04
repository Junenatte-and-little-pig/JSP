<%@ page import="grade.dao.GradeDao" %>
<%@ page import="grade.dao.GradeDaoImpl" %>
<%@ page import="grade.bean.Grade" %>
<%@ page import="java.util.List" %>
<%@ page import="grade.dao.UserDaoImpl" %>
<%@ page import="grade.dao.UserDao" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>老师</title>
</head>
<body>
欢迎您，<%
    String name = (String) request.getAttribute("name");
    if (name != null)
        session.setAttribute("teacher", name);
    else
        name = (String) session.getAttribute("teacher");
%>
<%=name%>
！
<table border="1">
    <tr>
        <th>姓名</th>
        <th>平时成绩</th>
        <th>期中成绩</th>
        <th>期末成绩</th>
        <th>总评成绩</th>
        <th>操作</th>
    </tr>
    <%
        DecimalFormat df = new DecimalFormat("#0.00");
        GradeDao gdi = new GradeDaoImpl();
        try {
            List<Grade> grades = gdi.queryAll();
            for (Grade grade : grades) {
    %>
    <tr>
        <td><%!
            private UserDao udi = new UserDaoImpl();%>
            <%=
            udi.queryByUsername(grade.getUsername()).getName()
            %>
        </td>
        <td><%=df.format(grade.getClassGrade())%>
        </td>
        <td><%=df.format(grade.getMidGrade())%>
        </td>
        <td><%=df.format(grade.getFinalGrade())%>
        </td>
        <td><%=df.format(grade.getGrade())%>
        </td>
        <td><a href="grade?action=modify&username=<%=grade.getUsername()%>">修改</a></td>
    </tr>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    %>
</table>
</body>
</html>
