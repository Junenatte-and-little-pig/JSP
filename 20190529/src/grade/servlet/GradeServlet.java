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
import grade.dao.UserDao;
import grade.dao.UserDaoImpl;

public class GradeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action.equals("modify"))
            modify(req, resp);
        if (action.equals("save"))
            save(req, resp);
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) {
        GradeDao gdi = new GradeDaoImpl();
        Grade grade = new Grade();
        grade.setUsername(req.getParameter("username"));
        grade.setClassGrade(Float.parseFloat(req.getParameter("class")));
        grade.setMidGrade(Float.parseFloat(req.getParameter("mid")));
        grade.setFinalGrade(Float.parseFloat(req.getParameter("final")));
        try {
            gdi.update(grade);
            req.getRequestDispatcher("/teacher.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void modify(HttpServletRequest req, HttpServletResponse resp) {
        String username = req.getParameter("username");
        UserDao udi = new UserDaoImpl();
        GradeDao gdi = new GradeDaoImpl();
        try {
            User user = udi.queryByUsername(username);
            Grade grade = gdi.queryByUsername(username);
            req.setAttribute("username", username);
            req.setAttribute("name", user.getName());
            req.setAttribute("class", grade.getClassGrade());
            req.setAttribute("mid", grade.getMidGrade());
            req.setAttribute("final", grade.getFinalGrade());
            req.getRequestDispatcher("/modify.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doGet(req, resp);
    }
}
