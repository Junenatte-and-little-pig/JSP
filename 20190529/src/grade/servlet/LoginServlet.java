package grade.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import grade.bean.Grade;
import grade.bean.User;
import grade.dao.GradeDao;
import grade.dao.GradeDaoImpl;
import grade.dao.UserDaoImpl;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action.equals("signin"))
            signin(req, resp);
        if (action.equals("signup"))
            signup(req, resp);
    }

    private void signup(HttpServletRequest req, HttpServletResponse resp) {
        String username = req.getParameter("username");
        UserDaoImpl udi = new UserDaoImpl();
        GradeDao gdi=new GradeDaoImpl();
        try {
            User user = udi.queryByUsername(username);
            if (user != null) {
                req.setAttribute("msg", "用户名已经存在");
                req.getRequestDispatcher("/index.jsp").forward(req, resp);
                return;
            }
            user = new User();
            user.setUsername(username);
            user.setPassword(req.getParameter("password"));
            user.setName(req.getParameter("name"));
            user.setPower(true);
            Grade grade=new Grade();
            grade.setUsername(username);
            grade.setClassGrade(0.00f);
            grade.setMidGrade(0.00f);
            grade.setFinalGrade(0.00f);
            udi.insert(user);
            gdi.insert(grade);
            req.setAttribute("username",user.getUsername());
            req.setAttribute("name", user.getName());
            req.getRequestDispatcher("/student.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void signin(HttpServletRequest req, HttpServletResponse resp) {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        UserDaoImpl udi = new UserDaoImpl();
        try {
            User user = udi.queryByUsername(username);
            if (user == null) {
                req.setAttribute("msg", "用户名或密码错误");
                req.getRequestDispatcher("/index.jsp").forward(req, resp);
                return;
            }
            if (password.equals(user.getPassword())) {
                req.setAttribute("username",user.getUsername());
                req.setAttribute("name", user.getName());
                if (user.isPower())
                    req.getRequestDispatcher("/student.jsp").forward(req, resp);
                else
                    req.getRequestDispatcher("/teacher.jsp").forward(req, resp);
            } else {
                req.setAttribute("msg", "用户名或密码错误");
                req.getRequestDispatcher("/index.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
