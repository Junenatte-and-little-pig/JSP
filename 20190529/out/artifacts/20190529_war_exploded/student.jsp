<%@ page import="grade.dao.GradeDao" %>
<%@ page import="grade.dao.GradeDaoImpl" %>
<%@ page import="grade.bean.Grade" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>学生</title>
</head>
<body>
<%=request.getAttribute("name")%>
<%
    String username = (String) request.getAttribute("username");
    GradeDao gdi = new GradeDaoImpl();
    try {
        Grade grade = gdi.queryByUsername(username);
%>
<table border="1" border-collapse="collapse">
    <tr>
        <td>平时成绩：<%=grade.getClassGrade()%>分</td>
        <td>期中成绩：<%=grade.getMidGrade()%>分</td>
        <td>期末成绩：<%=grade.getFinalGrade()%>分</td>
        <td>总评成绩：<%=grade.getGrade()%>分</td>
    </tr>
</table>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
