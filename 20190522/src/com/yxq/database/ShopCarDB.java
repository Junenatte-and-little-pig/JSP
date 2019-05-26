package com.yxq.database;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ShopCarDB {
    private static Statement stmt = null;

    public static Statement getStatement() {
        try {
            String driverClass = "com.mysql.cj.jdbc.Driver";
            Class.forName(driverClass);
            String url = "jdbc:mysql://localhost:3306/shopcar?useUnicode=true&characterEncoding=UTF-8&serverTimezone=GMT";
            String username = "root";
            String password = "";
            stmt = DriverManager.getConnection(url, username, password).createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return stmt;
    }

    public static void updateDB(String SQLUpdate) throws SQLException {
        stmt.execute(SQLUpdate);
    }
}
