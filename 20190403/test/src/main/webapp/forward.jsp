<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>跳转</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="usr" class="Bean.UsrInfo" scope="request">
    <jsp:setProperty name="usr" property="*" />
</jsp:useBean>
<%
    String number =usr.getNumber();
    if (number == null || number.equals(""))
        number = "学号不得为空";
    String name = usr.getName();
    if (name == null || name.equals(""))
        name = "姓名不得为空";
    String sex = usr.getSex();
    String pwd = usr.getPwd();
    String cfmpwd = request.getParameter("cfmpwd");
    if (pwd == null || pwd.equals(""))
        pwd = "密码不得为空";
    else if (!pwd.equals(cfmpwd))
        pwd = "密码不一致";
    String collage = usr.getCollage();
    StringBuilder hobby = new StringBuilder();
    String[] hobbies = usr.getHobby();
    if (hobbies != null)
        for (String h : hobbies) {
            hobby.append(h).append(" ");
        }
    else
        hobby = new StringBuilder("没有爱好");
    String belief = usr.getBelief();
    if (belief == null || belief.equals(""))
        belief = "此人很懒，没有留下简介哦";
%>
学号：<%=number%><br/>
姓名：<%=name%><br/>
性别：<%=sex%><br/>
密码：<%=pwd%><br/>
学院：<%=collage%><br/>
爱好：<%=hobby.toString()%><br/>
个人简历：<%=belief%><br/>
</body>
</html>
