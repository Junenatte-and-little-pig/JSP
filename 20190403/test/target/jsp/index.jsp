<html>
<head>
    <title>注册</title>
    <meta charset="UTF-8"/>
</head>
<body>
<%@page pageEncoding="utf-8" %>
<%request.setCharacterEncoding("UTF-8");%>
<h2>注册</h2>
<form action="forward.jsp" method="post">
    <label>学号<input type="text" name="number"></label><br/>
    <label>姓名<input type="text" name="name"></label><br/>
    <label>性别
        <label><input type="radio" name="sex" value="男" checked="checked">男 </label>
        <label><input type="radio" name="sex" value="女">女 </label>
    </label><br/>
    <label> 密码<input type="password" name="pwd"></label><br/>
    <label>确认密码<input type="password" name="cfmpwd"></label><br/>
    <label>学院
        <select name="collage">
            <option value="计算机学院">计算机学院</option>
            <option value="数科院">数科院</option>
            <option value="商学院">商学院</option>
            <option value="文学院">文学院</option>
            <option value="化科院">化科院</option>
        </select>
    </label><br/>
    <label>爱好
        <label><input type="checkbox" name="hobby" value="读书">读书</label>
        <label><input type="checkbox" name="hobby" value="游泳">游泳</label>
        <label><input type="checkbox" name="hobby" value="音乐">音乐</label>
        <label><input type="checkbox" name="hobby" value="写作">写作</label>
    </label><br/>
    <label>个人简历<input type="text" name="belief"></label><br/>
    <label><input type="submit" name="submit"></label>
</form>
</body>
</html>
