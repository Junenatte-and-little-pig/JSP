<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.yxq.database.ShopCarDB" %>
<%@ page import="com.yxq.valuebean.GoodsSingle" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>商品展示</title>


    <script type="text/javascript">

        <%
            try {
                String message = (String) session.getAttribute("message");
                if (message != null) {
        %>
        alert('<%=message%>');
        <%
                }
            } catch (NullPointerException e) {
                e.printStackTrace();
            }
        %>
    </script>

</head>
<body>
<%
    List<GoodsSingle> goodslist = new ArrayList<>();
    session.setAttribute("goodslist", goodslist);
    try {
        ResultSet rs = ShopCarDB.getStatement().executeQuery("select * from store");
        while (rs.next()) {
            GoodsSingle g = new GoodsSingle();
            g.setId(Integer.parseInt(rs.getString(1)));
            g.setName(rs.getString(2));
            g.setPrice(Float.parseFloat(rs.getString(3)));
            g.setNum(Integer.parseInt(rs.getString(4)));
            goodslist.add(g);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<table border="1" width="450" rules="none" cellspacing="0" cellpadding="0" border-collapse="collapse">
    <tr height="50">
        <td colspan="5" align="center">提供商品如下</td>
    </tr>
    <tr align="center" height="30" bgcolor="lightgrey">
        <td>批次</td>
        <td>名称</td>
        <td>价格(元/斤)</td>
        <td>库存</td>
        <td>购买</td>
    </tr>
    <% if (goodslist == null || goodslist.size() == 0) { %>
    <tr height="100">
        <td colspan="5" align="center">没有商品可显示！</td>
    </tr>
    <%
    } else {
        for (int i = 0; i < goodslist.size(); i++) {
            GoodsSingle single = goodslist.get(i);
    %>
    <tr height="50" align="center">
        <td><%=single.getId()%>
        </td>
        <td><%=single.getName()%>
        </td>
        <td><%=single.getPrice()%>
        </td>
        <td><%=single.getNum()%>
        </td>
        <td><a href="doCar?action=buy&id=<%=i%>">购买</a></td>
    </tr>
    <%
            }
        }
    %>
    <tr height="50" border="solid 1px black">
        <td align="center" colspan="5" border="solid 1px black"><a href="shopcar.jsp">查看购物车</a></td>
    </tr>
</table>
</body>
</html>