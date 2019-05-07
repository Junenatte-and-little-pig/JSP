<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>留言面板</title>
</head>
<body>
<form action="handle.jsp">
    <table>
        <tr>
            <td>留言人：</td>
            <td><input type="text" name="username" id="username"/>
            </td>
        </tr>
        <tr>
            <td>主   题：</td>
            <td><input type="text" name="title" id="title"/>
            </td>
        </tr>
        <tr>
            <td>内   容：</td>
            <td><textarea name="content" id="content" cols="20" rows="15"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="留言">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
