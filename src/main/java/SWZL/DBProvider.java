package SWZL;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;


import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;
import java.util.concurrent.SynchronousQueue;

public class DBProvider {
    static DataSource ds;
    public static void main() {
        //mysql jdbc 连接池
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl("jdbc:mysql://localhost:3306/shiwusystem?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=Asia/Shanghai");
        config.setUsername("root");//mysql 用户名
        config.setPassword("root");//mysql密码
        config.addDataSourceProperty("connectionTimeout", "10000"); // 连接超时：10秒
        config.addDataSourceProperty("idleTimeout", "60000"); // 空闲超时：60秒
        config.addDataSourceProperty("maximumPoolSize", "7"); // 最大连接数：7
        ds=new HikariDataSource(config);

    }
    //映射 丢失物品的有哪些的 数据库函数

    public  static  InfroBean[] viewOfLoItem(){
        try {
            InfroBean[] infroBean=new InfroBean[200];
            Connection connection =ds.getConnection();//获得数据库连接
            //执行sql查询语句
            PreparedStatement preparedStatement =connection.prepareStatement("SELECT * FROM lostitem");
            //获得sql语句结果
            ResultSet resultSet =preparedStatement.executeQuery();
            int i=0;
            while(resultSet.next()) {
                infroBean[i]=new InfroBean();
                infroBean[i].Lname = resultSet.getString(2);
                infroBean[i].Ltime = resultSet.getString(3);
                infroBean[i].Lposition = resultSet.getString(4);
                infroBean[i].Lphoto = resultSet.getString(5);
                infroBean[i].Ltip = resultSet.getString(6);
                infroBean[i].Lstaus = resultSet.getString(7);
                infroBean[i].Lphone=resultSet.getString(8);
                i++;
            }
            connection.close();
            return infroBean;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    //增加 遗失物品数据库  前端发布信息 后端添加进数据库
    public  static void insertLoItem(String name,String time,String position,String photo,String other,String phone){
        Connection connection = null;//获得数据库连接
        try {
            connection = ds.getConnection();
            //执行sql查询语句
            System.out.println("数据库测试:"+name+"\n"+time+"\n"+position+"\n" +"\n"+ photo+"\n"+ other);
            PreparedStatement preparedStatement =connection.prepareStatement("INSERT INTO lostitem VALUE (null,?,?,?,?,?,?,?)" );
            preparedStatement.setInt(1, 0);//失物id  自增，无需设计
            preparedStatement.setString(1,name);//失物名称
            preparedStatement.setString(2,time);//丢失时间"
            preparedStatement.setString(3,position);//丢失地点
            preparedStatement.setString(4,photo);//图片路径
            preparedStatement.setString(5,other);//留言
            preparedStatement.setString(6,"遗失");//物品状态默认 遗失
            preparedStatement.setString(7,phone);
            //最后一个是默认遗失状态
           // preparedStatement.executeUpdate();
            preparedStatement.execute();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    public static InfroBean[] searhing(String LName){
        try {
            InfroBean[] infroBean=new InfroBean[200];
            Connection connection =ds.getConnection();//获得数据库连接
            //执行sql查询语句
            PreparedStatement preparedStatement =connection.prepareStatement("SELECT * FROM lostitem WHERE LName LIKE ?");
            //获得sql语句结果
            preparedStatement.setString(1,"%"+LName+"%");//模糊查询
            ResultSet resultSet =preparedStatement.executeQuery();
            int i=0;
            while(resultSet.next()) {
                infroBean[i]=new InfroBean();
                infroBean[i].Lname = resultSet.getString(2);
                infroBean[i].Ltime = resultSet.getString(3);
                infroBean[i].Lposition = resultSet.getString(4);
                infroBean[i].Lphoto = resultSet.getString(5);
                infroBean[i].Ltip = resultSet.getString(6);
                infroBean[i].Lstaus = resultSet.getString(7);
                infroBean[i].Lphone=resultSet.getString(8);
                i++;
            }
            connection.close();
            return infroBean;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }



    }

    public static boolean getPI(String user ,String password) throws SQLException {
        Connection connection= ds.getConnection();
        PreparedStatement preparedStatement=connection.prepareStatement("SELECT * from Userdata where User=? AND Pass=?");
        preparedStatement.setString(1,user);
        preparedStatement.setString(2,password);
        ResultSet resultSet=preparedStatement.executeQuery();
        if(resultSet.next()){
          connection.close();
            return true;
        }
        else {
            connection.close();
            System.out.println("没有该用户");
            return false;
        }



    }


    public static boolean register(String user,String password) throws SQLException {
        Connection connection= ds.getConnection();
        PreparedStatement preparedStatement=connection.prepareStatement("INSERT INTO  Userdata VALUES (?,?)");
        preparedStatement.setString(1,user);
        preparedStatement.setString(2,password);
        int i=preparedStatement.executeUpdate();
        if(i>0)
        return true;//注册成功
        else return false;//注册失败
    }
}
