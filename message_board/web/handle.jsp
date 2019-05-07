<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="util.MessageDB" %>
<%@ page import="java.sql.SQLException" %>
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
    String SQLInsert="";
    if(!username.equals("") && !title.equals(""))
    SQLInsert = "INSERT INTO `jsp_message`.`message_board` (`username`, `time`, `title`,  `content`) VALUES ('" +
            username +
            "', '" +
            datetime +
            "', '" +
            title +
            "', '" +
            content +
            "');";
    try {
        if(!SQLInsert.equals(""))
        MessageDB.insertDB(SQLInsert);
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<jsp:forward page="index.jsp"/>
</body>
</html>
