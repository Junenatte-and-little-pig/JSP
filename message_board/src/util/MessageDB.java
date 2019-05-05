package util;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class MessageDB {
    private static Statement stmt = null;

    public static Statement getStatement() {
        try {
            String driverClass = "com.mysql.cj.jdbc.Driver";
            Class.forName(driverClass);
            String url = "jdbc:mysql://localhost:3306/jsp_message?useUnicode=true&characterEncoding=UTF-8&serverTimezone=GMT";
            String username = "root";
            String password = "";
            stmt = DriverManager.getConnection(url, username, password).createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return stmt;
    }

    public static void insertDB(String SQLInsert) {
        try {
            stmt.execute(SQLInsert);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
