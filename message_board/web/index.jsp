<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.MessageBean" %>
<%@ page import="util.MessageDB" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <title>历史记录</title>
</head>
<body>
<jsp:useBean class="bean.MessageBean" id="m"/>
<%
    List<MessageBean> content = new ArrayList<>();
    try {
        ResultSet rs = MessageDB.getStatement().executeQuery("select * from message_board");
        while (rs.next()) {
            MessageBean mb=new MessageBean();
            mb.setId(rs.getInt(1));
            mb.setUsername(rs.getString(2));
            mb.setDatetime(rs.getString(3));
            mb.setMessage(rs.getString(4));
            System.out.println(mb.toString());
            content.add(mb);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<table align="center">
    <tr bgcolor="aqua">
        <td colspan="4" align="center">留言板</td>
    </tr>
    <%
        for (int i = 0; i < content.size(); i++) {
    %>
    <tr>
        <td><%=content.get(i).getId() %></td>
        <td><%=content.get(i).getUsername() %></td>
        <td><%=content.get(i).getDatetime() %></td>
        <td><%=content.get(i).getMessage() %></td>
    </tr>
    <%}%>
</table>

<input onclick="window.location.href='message.jsp'" type="button" value="我要留言">

</body>
</html>
