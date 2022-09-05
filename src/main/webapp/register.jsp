<%--
  Created by IntelliJ IDEA.
  User: rsw
  Date: 2022/6/10
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <meta name="decorator" content="default" charset="UTF-8"/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        *{
            margin: 0 auto;
        }
        body{
            background-color: #343a40;
        }
        .container{
            position: relative;
            top: 100px;
        }
        .news-nav{
            clear: both;
            height: 80px;
            margin-left: 10px;
            margin-right: 10px;
            width: 300px;
            margin: 0 auto;
        }
        .news-nav li{
            float: left;
            list-style-type: none;
            margin: 0 10px;
            font-size: 30px;
            display: block;
            width: 86px;
            height: 79px;
            text-align: center;
            line-height: 79px;
            font-weight: bold;
            color: #007bff;
            cursor: pointer;
        }
        .news-nav li.on{
            color: #74dcff;
            border-bottom-color: #74dcff;
            border-bottom-style: solid;
            border-bottom-width: 2px;
        }
        #index-news-list-2{
            display: none;
        }
        .modal-dialog{
            max-width: 100% !important;
        }
        .modal-content{
            background:rgba(0,0,0,0.3);
            width: 700px;
        }
        .loginForm{
            width: 400px;
        }
        .loginForm .form-group{
            margin: 30px 0;
        }
        .loginForm .form-group .form-control{
            height: 40px;
            font-size: 15px;
        }
        input[type="checkbox"]{
            position:relative;
            top:-2px;
            vertical-align: middle;
            cursor: pointer;
            zoom:1.6;
        }
        input[type="radio"]{
            position:relative;
            top:-3px;
            vertical-align: middle;
            cursor: pointer;
            zoom:1.6;
        }
        .btn-primary{
            background-color: #3e4963;
            border: 0px solid transparent;
            width: 400px;
            height: 50px;
            font-size: 24px;
            font-family: STKaiti;
        }
        label{
            color: #fff;
            font-size: 16px;
        }
    </style>
</head>
<body>


<div class="container">
    <div class="modal-dialog" id="login_form">
        <div class="modal-content">
            <div class="modal-title">
                <ul class="news-nav js-nav-title">
                    <li class="on" data="login">登录</li>
                    <li class="" data="register">注册</li>
                </ul>
            </div>
            <div class="modal-body index-news-list" id="index-news-list-1">
                <form class="loginForm" id="loginForm" action="" method="get">
                    <div class="form-group">
                        <input class="form-control required" name="name" id="name1" type="text" placeholder="请输入用户名或邮箱">
                    </div>
                    <div class="form-group">
                        <input id="password" class="form-control required" name="password" type="password" placeholder="请输入密码">
                    </div>
                    <div class="form-group">
                        <label for="remember1">
                            <input type="checkbox" name="remember" id="remember1" value="0"/> 记住我
                        </label>
                    </div>
                    <div class="form-group">
                        <button  class="btn btn-primary" type="submit" onclick="login()" >登录</button>
                    </div>
                </form>
            </div>

            <div class="modal-body index-news-list" id="index-news-list-2">
                <form class="loginForm" id="registerForm" action="register" method="post">
                    <div class="form-group">
                        <input class="form-control required" name="name" id="name" type="text" placeholder="请输入要注册的用户名或邮箱">
                    </div>
                    <div class="form-group">
                        <input class="form-control required" name="password" id="rePassword" type="password" placeholder="请输入密码">
                    </div>
                    <div class="form-group">
                        <input class="form-control required" name="rePassword" id="rePassword1" type="password" placeholder="请再次输入密码">
                    </div>

                    <div class="form-group">
                        <button class="btn btn-primary" type="submit" onclick="register1()">注册</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $(".js-nav-title li").click(function(){
            $(this).attr("class","on");
            $(this).siblings().attr("class","");
           var index = $(".js-nav-title li").index(this);
           $(".index-news-list").css("display","none");
            $("#index-news-list-"+(index+1)).css("display","block");
        });
    });

    function login() {
        var user=document.getElementById("name1").value;//获得输入框内容
        //alert(key);
        var password=document.getElementById("password").value;
        if(user!=''||password!=''){

        window.location.href="home?name="+user+"&password= "+password;//不打开新窗口



        }
        else {
            alert("请输入密码或者账号")
        }
    }

    function register1(){
        var user=document.getElementById("name").value;//获得输入框内容

        var password=document.getElementById("rePassword").value;
        var password1=document.getElementById("rePassword1").value;


        if(password===password1&&password1!=''&&password!=''){
          //  window.location.href="register";
            alert("注册成功提示")
        }
        else {
                alert("两次密码输入有误，请重新输入")
        }
    }
</script>
</body>
</html>

