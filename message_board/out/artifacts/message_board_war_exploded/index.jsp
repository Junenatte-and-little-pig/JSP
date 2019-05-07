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
            m = new MessageBean();
            m.setUsername(rs.getString(1));
            m.setDatetime(rs.getString(2));
            m.setTitle(rs.getString(3));
            m.setMessage(rs.getString(4));
            content.add(m);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<table align="center" border="1" width="100%">
    <tr bgcolor="aqua">
        <th colspan="5" align="center">留言板</th>
    </tr>
    <tr align="center">
        <th>序号</th>
        <th>姓名</th>
        <th>留言时间</th>
        <th>主题</th>
        <th>内容</th>
    </tr>
    <%
        for (int i = 0; i < content.size(); i++) {
    %>
    <tr align="center">
        <td><%=i+1 %>
        </td>
        <td><%=content.get(i).getUsername() %>
        </td>
        <td><%=content.get(i).getDatetime() %>
        </td>
        <td><%=content.get(i).getTitle()%>
        </td>
        <td><%=content.get(i).getMessage() %>
        </td>
    </tr>
    <%}%>
</table>
<div align="center">
    <input onclick="window.location.href='message.jsp'" type="button" value="我要留言" width="20px" height="5px">
</div>
</body>
</html>
