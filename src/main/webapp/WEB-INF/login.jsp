<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="bg-black">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>dLab | Hệ thống quản lý phòng thí nghiệm</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- shortcut icon -->
        <link href="resources/img/fav.ico" rel="icon" />
        <!-- bootstrap 3.0.2 -->
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="resources/css/dlab.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/common.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="bg-black">
        <div class="form-box" id="login-box">
            <div class="header">Đăng nhập</div>
            <form action="${pageContext.request.contextPath}/login/action" method="post">
                <div class="body bg-gray">
                    <c:if test="${login_error != null}">
                    <div class="alert alert-danger alert-dismissable alert-top">
                        <i class="fa fa-ban"></i>
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <b>Alert!</b> ${login_error}
                    </div>
                    </c:if>
                    
                    <div class="form-group">
                        <input type="text" name="userid" class="form-control" placeholder="Mã số cán bộ/ sinh viên"/>
                    </div>
                    
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="Mật khẩu"/>
                    </div> 
                    <!--         
                    <div class="form-group">
                        <input type="checkbox" name="remember_me"/> Ghi nhớ tôi
                    </div>
                     -->
                </div>
                <div class="footer">                                                               
                    <button type="submit" class="btn bg-olive btn-block">Đăng nhập</button>  
                    
                    <p><a href="${pageContext.request.contextPath}/forgotpassword" class="text-center">Quên mật khẩu</a></p>
                    
                    <p><a href="${pageContext.request.contextPath}/register" class="text-center">Đăng ký tài khoản?</a></p>
                    
                    <p><a href="${pageContext.request.contextPath}/index" class="text-center">Trang chủ</a></p>
                </div>
            </form>
        </div>

        <!-- jQuery 2.0.2 -->
        <script src="resources/js/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>        

    </body>
</html>