package grade.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

class DBConnection {
    private Connection conn = null;

    DBConnection() {
        try {
            String DRIVERCLASS = "com.mysql.cj.jdbc.Driver";
            Class.forName(DRIVERCLASS);
            String DBURL = "jdbc:mysql://localhost:3306/grade_manage_sys?useUnicode=true&characterEncoding=UTF-8&serverTimezone=GMT";
            String USERNAME = "root";
            String PASSWORD = "";
            this.conn = DriverManager.getConnection(DBURL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("加载驱动失败");
        }
    }

    Connection getConnection() {
        return this.conn;
    }

    void close() {
        if (this.conn != null) {
            try {
                this.conn.close();
            } catch (SQLException e) {
                System.out.println("数据库连接关闭失败");
            }
        }
    }
}
