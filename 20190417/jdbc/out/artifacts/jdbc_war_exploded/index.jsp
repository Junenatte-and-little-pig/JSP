<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>mysql连接</title>
  </head>
  <body>
  <%

    String driverClass="mysql.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/goodmanagesys";
    String username="root";
    String password="";
    try {
      Class.forName(driverClass);
        Connection conn= DriverManager.getConnection(url,username,password);
      Statement state=conn.createStatement();
      ResultSet rs=state.executeQuery("SELECT * FROM goodmanagesys.category;");
      while(rs.next())
        out.println(rs.getString(1));
      rs.close();
      state.close();
      conn.close();
    } catch (ClassNotFoundException | SQLException e) {
      e.printStackTrace();
    }
  %>
  </body>
</html>
