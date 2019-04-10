<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2019/4/10
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看</title>
</head>
<body>
<jsp:useBean id="msg" class="Message"/>
<table border="1" height="200" rules="rows">
    <tr>
        <td align="center">留言者：</td>
        <td><%=msg.getUsr()%></td>
    </tr>
    <tr>
        <td align="center">留言标题：</td>
        <td><%=msg.getTitle()%></td>
    </tr>
    <tr>
        <td align="center">留言内容：</td>
        <td>
            <textarea rows="8" cols="34" readonly>
                <%=msg.getContent()%>
            </textarea>
        </td>
    </tr>
</table>
</body>
</html>
