package com.yxq.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yxq.database.ShopCarDB;
import com.yxq.toolbean.MyTools;
import com.yxq.toolbean.ShopCar;
import com.yxq.valuebean.GoodsSingle;

public class BuyServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");    //获取action参数值
        if (action == null)
            action = "";
        if (action.equals("buy"))                    //触发了“购买”请求
            buy(request, response);                        //调用buy()方法实现商品的购买
        if (action.equals("remove"))                    //触发了“移除”请求
            remove(request, response);                    //调用remove()方法实现商品的移除
        if (action.equals("clear"))                    //触发了“清空购物车”请求
            clear(request, response);                    //调用clear()方法实现购物车的清空
        if (action.equals("pay"))
            pay(request, response);
    }

    //实现购买商品的方法
    private void buy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String strId = request.getParameter("id");        //获取触发“购买”请求时传递的id参数，该参数存储的是商品在goodslist对象中存储的位置
        int id = MyTools.strToInt(strId);
        ArrayList goodslist = (ArrayList) session.getAttribute("goodslist");
        GoodsSingle single = (GoodsSingle) goodslist.get(id);
        ArrayList buylist = (ArrayList) session.getAttribute("buylist");        //从session范围内获取存储了用户已购买商品的集合对象
        if (buylist == null)
            buylist = new ArrayList();
        ShopCar myCar = new ShopCar();
        myCar.setBuylist(buylist);                        //将buylist对象赋值给ShopCar类实例中的属性
        myCar.addItem(single);                            //调用ShopCar类中addItem()方法实现商品添加操作
        if (!myCar.getMessage().equals(""))
            session.setAttribute("message", myCar.getMessage());
        else
            session.removeAttribute("message");
        session.setAttribute("buylist", buylist);
        response.sendRedirect("show.jsp");                //将请求重定向到show.jsp页面
    }

    //实现移除商品的方法
    private void remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList buylist = (ArrayList) session.getAttribute("buylist");
        String id = request.getParameter("id");
        ShopCar myCar = new ShopCar();
        myCar.setBuylist(buylist);                        //将buylist对象赋值给ShopCar类实例中的属性
        myCar.removeItem(Integer.parseInt(id));        //调用ShopCar类中removeItem ()方法实现商品移除操作
        response.sendRedirect("shopcar.jsp");
    }

    //实现清空购物车的方法
    private void clear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList buylist = (ArrayList) session.getAttribute("buylist");            //从session范围内获取存储了用户已购买商品的集合对象
        buylist.clear();                                                        //清空buylist集合对象，实现购物车清空的操作
        response.sendRedirect("shopcar.jsp");
    }

    //实现结算的方法
    private void pay(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        ArrayList buylist = (ArrayList) session.getAttribute("buylist");            //从session范围内获取存储了用户已购买商品的集合对象
        //循环buylist
        for (Object gs : buylist)
        //根据id更新数据库
        //UPDATE `shopcar`.`store` SET `storage` = '5' WHERE (`id` = '19050201');
        {
            try {
                ShopCarDB.updateDB("UPDATE `shopcar`.`store` SET `storage` = `storage` - " + ((GoodsSingle) gs).getNum() + " WHERE (`id` = '" + ((GoodsSingle) gs).getId() + "');");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        buylist.clear();                                                        //清空buylist集合对象，实现购物车清空的操作
        response.sendRedirect("shopcar.jsp");
    }
}