package SWZL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.concurrent.SynchronousQueue;

@WebServlet(value = "/register")
public class Register extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String password=req.getParameter("password");
        String user=req.getParameter("name");
        try {
            DBProvider.register(user,password);
            System.out.println("注册成功");
            resp.sendRedirect("home");
        }  catch (SQLException e) {
           System.out.println("注册异常了");
        }





}
}
