package SWZL;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class DBInit implements ServletContextListener{
    @Override
    public void contextInitialized(ServletContextEvent sce) {

        DBProvider.main();
    }
    @Override
    // 在此清理WebApp,例如关闭数据库连接池等:
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("关闭数据库");
    }

}
