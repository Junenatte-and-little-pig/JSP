<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>修改</title>
</head>
<body>
<form action="grade?action=save" method="post">
    <table border="1">
        <tr>
            <td><input type="text" name="username"
                       value=<%=request.getAttribute("username")%> readonly="true"></td>
        </tr>
        <tr>
            <td><input type="text" name="name"
                       value=<%=request.getAttribute("name")%> readonly="true"></td>
        </tr>
        <tr>
            <td><input type="text" name="class" value=<%=request.getAttribute("class")%>></td>
        </tr>
        <tr>
            <td><input type="text" name="mid" value=<%=request.getAttribute("mid")%>></td>
        </tr>
        <tr>
            <td><input type="text" name="final" value=<%=request.getAttribute("final")%>></td>
        </tr>
    </table>
    <input type="submit" value="保存">
</form>
</body>
</html>
