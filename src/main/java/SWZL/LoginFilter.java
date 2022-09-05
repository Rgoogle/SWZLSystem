package SWZL;


import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebFilter(urlPatterns = "/home")
public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletRequest.setCharacterEncoding("UTF-8");
        servletResponse.setCharacterEncoding("UTF-8");
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

      //  filterChain.doFilter(servletRequest,servletResponse);
      //  System.out.println("AuthFilter: check authentication");

        String user =servletRequest.getParameter("name");
        String password=servletRequest.getParameter("password");
      //  System.out.println(user+"  " +password);

        try {
            if (!DBProvider.getPI(user,password)) {//查询是否有用户
                // 未登录，自动跳转到登录页:
                req.getRequestDispatcher("register.jsp").forward(req,resp);
            } else {
                // 已登录，继续处理:

                filterChain.doFilter(servletRequest, servletResponse);
            }
        } catch (SQLException e) {
            System.out.println("数据库查询用户获取连接的时候异常了");
        }

    }

}
