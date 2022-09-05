<%@ page import="SWZL.InfroBean" %>
<%@ page import="SWZL.DBProvider" %>
<%@ page import="java.io.File" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%><!--编码 没有默认 ios8859-1 服务器响应编码-->
<!--解码 没有默认ios8859-1 如果设置了这个 meta 标签的没有效果的 没用的-->

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html"

      xmlns="http://www.w3.org/1999/html">
<head>
    <!--mete 控制浏览器的编码格式-->

    <title>失物招领系统</title>
   <link rel="stylesheet" href="home.css"/> <!--引入css样式-->
    <link rel="stylesheet" href="Search.css"/><!--搜索css样式 -->
    <link rel="stylesheet" href="SubmitButton.css"/>

</head>
<body>

<span id="Submitbtn"><button class="btn" onclick="gotoSubmit()"><span>发布信息</span></button></span>

<div class="ss" style="margin-top: 70px">
    <span>

        <div class= "search-box"><!-- 先写一个容器出来 -->
        <!--这里没有from的刚开始-->

      <input id="subinput" class="search-txt" type="search" placeholder="模糊搜索物品名称">
    <!-- 这里是另外一个容器  容器是可以嵌套的 它被嵌套在上面这个容器里 是输入文本用的 -->

    <!--连接 href="http://bing.com" a标签注释的-->
        <a class="search-btn"  onclick="submitsearch()">
        <!-- 这里定义一个连接  是空连接   想使用别的连接 你可以把#替换成你想用的连接 -->
        <!--斜体文本效果 i-->
             <i class="fa fa-search" aria-hidden="true" style="color:yellow;" onclick="submitsearch()">搜索</i>
        <!-- 这个玩意是我从fontawesome里找来的素材  具体怎么来的自己去fontawesome看看就知道了 -->
        </a>
        </div>
    </span>

</div>
<%

    InfroBean[] infroBean=null;
    int i=0;
    if(request.getParameter("searchkey")!=null){
        String key=request.getParameter("searchkey");
        infroBean=DBProvider.searhing(key);}//带参数走这个
    else {infroBean=DBProvider.viewOfLoItem();}//不带参数走这个

    while (infroBean[i]!=null){
        //File file=new File("D:\\apache-tomcat-9.0.63-windows-x64\\apache-tomcat-9.0.63\\webapps\\swzlsystem\\"+infroBean[i].Lphoto);
        String filename= infroBean[i].Lphoto.length()!=0?infroBean[i].Lphoto+";": "SWZL.jpg;";
        //System.out.println(filename);//line-height=30
        out.println("" +
                "<div>\n" +
                "    <div style = \"text-align: left ;margin-left: 300px;line-height: 14px ;margin-top: 20px;\" >\n" +
                "        <div style = \"display: inline-block\" >\n" +

                "            <img src ="+filename+
                "\n" +
                "        width = \"230px\";\n" +
                "        height = \"140px\" style = \"border-radius: 15%; float: left;\"/>\n" +
                "            <p style = \"display: inline-block ; margin-bottom: 0px ;float: left;width: 500px;\" >\n" +
                "<h3 style=\"color:white;margin=0;\">丢失物品名称:"+infroBean[i].Lname+
                "</h3>\n"+

                "                <h3 style = \"color: white\" >\n" +
                ""+
                 "留言:"+infroBean[i].Ltip +
                "" +
                "</h3>\n" +

                "<h3 style=color:white>联系方式:"+infroBean[i].Lphone+
                "</h3>\n"+
                "<h3 style=color:white>丢失时间:"+infroBean[i].Ltime+
                "</h3>\n"+
                "            </p>\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</div>"
        );
    i++;
    }


%>


<script>
    function gotoSubmit() {
        window.open("Submit.html");
    }
</script>

<script>
    function submitsearch(){//搜索提交
       var key=document.getElementById("subinput").value;//获得输入框内容
        //alert(key);
        window.location.href="homesearch?searchkey="+key;//不打开新窗口
    }

</script>


</body>
</html>
