<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>计数器</title>
  </head>
  <body>
  <h2>
    欢迎光临<br/>
    您是本站第【
    <%=application.getAttribute("count")%>
    】位访客！
  </h2>
  </body>
</html>
