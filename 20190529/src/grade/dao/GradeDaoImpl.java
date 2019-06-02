package grade.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import grade.bean.Grade;

public class GradeDaoImpl implements GradeDao {
    @Override
    public void insert(Grade grade) {
        DBConnection con = null;
        PreparedStatement pstm = null;
        String sql = "insert into grade values(?,?,?,?)";
        try {
            con = new DBConnection();
            pstm = con.getConnection().prepareStatement(sql);
            pstm.setString(1, grade.getUsername());
            pstm.setFloat(2, grade.getClassGrade());
            pstm.setFloat(3, grade.getMidGrade());
            pstm.setFloat(4, grade.getFinalGrade());
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
    public void update(Grade grade) {
        DBConnection con = null;
        PreparedStatement pstm;
        String sql = "update grade set class_grade=?,mid_grade=?,final_grade=? where username=?";

        try {
            con = new DBConnection();
            pstm = con.getConnection().prepareStatement(sql);
            pstm.setFloat(1, grade.getClassGrade());
            pstm.setFloat(2, grade.getMidGrade());
            pstm.setFloat(3, grade.getFinalGrade());
            pstm.setString(4, grade.getUsername());
            pstm.executeUpdate();
            pstm.close();
        } catch (Exception e) {
            System.out.println("更新数据操作异常,sql:" + sql);
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    @Override
    public Grade queryByUsername(String username) {
        DBConnection con = null;
        PreparedStatement pstm;
        ResultSet rs;
        Grade grade = null;
        String sql = "select * from grade where username=?";

        try {
            con = new DBConnection();
            pstm = con.getConnection().prepareStatement(sql);
            pstm.setString(1, username);
            rs = pstm.executeQuery();
            while (rs.next()) {
                grade = new Grade();
                grade.setUsername(rs.getString(1));
                grade.setClassGrade(rs.getFloat(2));
                grade.setMidGrade(rs.getFloat(3));
                grade.setFinalGrade(rs.getFloat(4));
            }
            pstm.close();
        } catch (Exception e) {
            System.out.println("查询数据操作异常   sql:" + sql);
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return grade;
    }

    @Override
    public List<Grade> queryAll() {
        DBConnection con = null;
        PreparedStatement pstm;
        ResultSet rs;
        List<Grade> lsu = new ArrayList<>();
        String sql = "select * from grade";

        try {
            con = new DBConnection();
            pstm = con.getConnection().prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Grade grade = new Grade();
                grade.setUsername(rs.getString(1));
                grade.setClassGrade(rs.getFloat(2));
                grade.setMidGrade(rs.getFloat(3));
                grade.setFinalGrade(rs.getFloat(4));
                lsu.add(grade);
            }
            pstm.close();
        } catch (Exception e) {
            System.out.println("查询数据操作异常");
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return lsu;
    }
}
