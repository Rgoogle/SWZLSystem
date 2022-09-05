package SWZL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/home")
public class HomePage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    //    PrintWriter pw =resp.getWriter();
       // pw.write("hello");
        //pw.flush();
        //转发
     //  resp.setCharacterEncoding("utf-8");
     //  resp.setContentType("text/html;charset=utf-8");
        //String key=req.getParameter("searchkey");
        //System.out.println(key);
       req.getRequestDispatcher("home.jsp").forward(req,resp);
    }

}
