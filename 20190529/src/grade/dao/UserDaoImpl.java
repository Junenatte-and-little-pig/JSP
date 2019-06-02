package grade.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import grade.bean.User;

public class UserDaoImpl implements UserDao {
    @Override
    public void insert(User user) {
        DBConnection con = null;
        PreparedStatement pstm = null;
        String sql = "insert into user values(?,?,?,?)";

        try {
            con = new DBConnection();
            pstm = con.getConnection().prepareStatement(sql);
            pstm.setString(1, user.getUsername());
            pstm.setString(2, user.getName());
            pstm.setString(3, user.getPassword());
            pstm.setBoolean(4, user.isPower());
            pstm.executeUpdate();
            pstm.close();
        } catch (Exception e) {
            System.out.println("插入数据操作异常");
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    @Override
    public User queryByUsername(String username) {
        DBConnection con = null;
        PreparedStatement pstm;
        ResultSet rs;
        User user = null;
        String sql = "select * from user where username=?";

        try {
            con = new DBConnection();
            pstm = con.getConnection().prepareStatement(sql);
            pstm.setString(1, username);
            rs = pstm.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setUsername(rs.getString(1));
                user.setName(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setPower(rs.getBoolean(4));
            }
            pstm.close();
        } catch (Exception e) {
            System.out.println("查询数据操作异常   sql:" + sql);
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return user;
    }
}
