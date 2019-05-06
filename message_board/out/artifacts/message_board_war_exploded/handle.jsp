<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="util.MessageDB" %><%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2019/5/5
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String datetime = df.format(new Date());
    String username = request.getParameter("username");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String SQLInsert = "INSERT INTO `jsp_message`.`message_board` (`username`, `time`, `title`,  `content`) VALUES ('" +
            username +
            "', '" +
            datetime +
            "', '" +
            title +
            "', '" +
            content +
            "');";
    MessageDB.insertDB(SQLInsert);
%>
<jsp:forward page="index.jsp"/>
</body>
</html>
