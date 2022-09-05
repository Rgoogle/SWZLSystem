package SWZL;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


@WebServlet("/submitinformation")
@MultipartConfig
//文本和图片在表单里面一起上传要这个，不然文本为null
public class Submitinfromation extends HttpServlet   {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // request.setCharacterEncoding("utf-8");

        if(ServletFileUpload.isMultipartContent(request)){
            //创建磁盘工厂
            DiskFileItemFactory factory=new DiskFileItemFactory();
            //servlet 文件上传核心
            ServletFileUpload fileUpload=new ServletFileUpload(factory);
            //从request 中读取数据
            List<FileItem> fileItemList= null;
            try {
                fileItemList = fileUpload.parseRequest(request);
            } catch (FileUploadException e) {
                throw new RuntimeException(e);
            }


            String name= fileItemList.get(0).getString("UTF-8");//物品名称
            String time= fileItemList.get(1).getString("UTF-8");//时间
            String position= fileItemList.get(2).getString("UTF-8");//位置
            String phone= fileItemList.get(3).getString("UTF-8");//联系
            String other= fileItemList.get(5).getString("UTF-8");//留言
            //此处判断多余 数据库根本没有用到
            String photo=fileItemList.get(4).getName()==null?"SWZL.jpg":fileItemList.get(4).getName();//图片名字
//            System.out.println("测试:"+name+"\n"+time+"\n"+position+"\n" +"\n"+ photo+"\n"+ other);
            DBProvider.insertLoItem(name,time,position,photo,other,phone);//插数据进丢失物品库

            if(photo!=null) {
                try {
                    fileItemList.get(4).write(new File(this.getServletContext().getRealPath(""),photo));
                    //"D:\\temp\\"
                } catch (Exception e) {
                    //文件写入异常
                }
            }


        }

        //内部转发
        request.getRequestDispatcher("home.jsp").forward(request,response);
       //  request.getRequestDispatcher("logininfo.jsp").forward(request, response);


    }
}

