<%@ page import="SWZL.InfroBean" %>
<%@ page import="SWZL.DBProvider" %>
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

            <input class="search-txt" type="search" placeholder="搜索">
    <!-- 这里是另外一个容器  容器是可以嵌套的 它被嵌套在上面这个容器里 是输入文本用的 -->

    <!--连接 -->
        <a class="search-btn" href="http://bing.com">
        <!-- 这里定义一个连接  是空连接   想使用别的连接 你可以把#替换成你想用的连接 -->
        <!--斜体文本效果 i-->
             <i class="fa fa-search" aria-hidden="true"></i>
        <!-- 这个玩意是我从fontawesome里找来的素材  具体怎么来的自己去fontawesome看看就知道了 -->
         </a>
        </div>
    </span>

</div>
<%

    InfroBean[] infroBean=null;
    int i=0;
    infroBean=DBProvider.viewOfLoItem();

    while (infroBean[i]!=null){
        out.println("" +
                "<div>\n" +
                "    <div style = \"text-align: left ;margin-left: 300px;line-height: 30px ;margin-top: 20px;\" >\n" +
                "        <div style = \"display: inline-block\" >\n" +
                "            <img src = \"SWZL.jpg\";\n" +
                "        width = \"230px\";\n" +
                "        height = \"140px\" style = \"border-radius: 15%; float: left;\"/>\n" +
                "            <p style = \"display: inline-block ; margin-bottom: 0px ;float: left;width: 500px;\" >\n" +
                "                <h1 style = \"color: white\" >\n" +
                "                    <a href = \"http://bing.com\" style = \"color:white; text-decoration: none\" \">"+
                infroBean[i].Ltip
                +"</a >\n" +
                "                </h1>\n" +
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


</body>
</html>
