<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>留言面板</title>
</head>
<body>
<form action="index.jsp">
    留言人：
    <input type="text" name="username" id="username"/>
    <br/>
    留言板：
    <textarea name="message" id="message" cols="20" rows="15"></textarea>
    <br/>
    <%
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String datetime = df.format(new Date());
        String username = request.getParameter("username");
        String message = request.getParameter("message");
        String SQLInsert = "INSERT INTO `jsp_message`.`message_board` (`username`, `messagetime`, `message`) VALUES (' " +
                username +
                " ', ' " +
                datetime +
                "', ' " +
                message +
                " ')";
        System.out.println(SQLInsert);
    %>
    <input type="submit" value="留言">
</form>
</body>
</html>
