<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>dlab | Trang chủ | hệ thống quản lý phòng thực hành, thí nghiệm</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- shortcut icon -->
        <link href="resources/img/fav.ico" rel="icon" />
        <!-- bootstrap 3.0.2 -->
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="resources/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="resources/css/dlab.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/custom.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="skin-blue container">
        <!-- HEADER -->
        <header class="">
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <a class="navbar-brand dlab-brand" href="#">dlab</a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
					   <!-- <li><a href="#">Liên hệ</a></li> -->
					   <!-- <li><a href="#">Hướng dẫn</a></li> -->
					   <li><a href="register">Đăng ký</a></li>
                        <li><a href="login">Đăng nhập</a></li>
                    </ul>
                </div>
            </nav>
        </header>
        
        <!-- HOME CONTENT -->
        <div class="wrapper home-content">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="resources/img/lab1.jpg" alt="First slide">
                        <div class="carousel-caption">

                        </div>
                    </div>
                    <div class="item">
                        <img src="resources/img/lab2.jpg" alt="Second slide">
                        <div class="carousel-caption">

                        </div>
                    </div>
                    <div class="item">
                        <img src="resources/img/lab3.jpg" alt="Third slide">
                        <div class="carousel-caption">

                        </div>
                    </div>
                </div>
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>
            </div>
            <aside>
                <!-- Main content -->
                <section class="content">
                    <!-- top row -->
                    <div class="row">
                        <div class="col-xs-12 connectedSortable">
                            
                        </div><!-- /.col -->
                    </div>
                    <!-- /.row -->

                    <!-- Main row -->
                    <div class="row">
                        <h4 class="intro">Giới thiệu về DLab - Development Laboratory</h4>
                    
                        <p class="para-info">
                            Đào tạo từ xa là một phương thức đạo tạo dựa trên cơ sở phát huy khả
							năng tự học, tự nghiên cứu của người học dưới sự tổ chức, hướng dẫn của 
							giảng viên. Đào tạo từ xa tạo cơ hội học tập cho các sinh viên không có điều 
							kiện đến trường do xa nơi ở, hoặc các sinh viên trường khác có nhu cầu nâng 
							cao kiến thức. Nhưng, đối với việc đào tạo từ xa cho sinh viên ngành kỹ thuật 
							hoàn toàn không dễ. Do sinh viên ngành kỹ thuật ngoài học tập qua lý thuyết 
							thì sinh viên cần phải thực hành để hiểu rõ lý thuyết, nên việc đào tạo từ xa 
							với các sinh viên ngành kỹ thuật là rất khó khăn nói chung và sinh viên ngành 
							Điện tử  Viễn thông nói riêng.
					    </p>
                        
                        <p class="para-info">
                            Với nhu cầu nâng cao chất lượng đào tạo cũng như tạo điều kiện để 
							các sinh viên kỹ thuật nói chung và sinh viên ngành Điện tử  Viễn thông nói 
							riêng, các trường đại học đã tìm mua các board thực hành nhằm cung cấp 
							thiết bị để sinh viên có thể thực hành và hiểu rõ hơn lý thuyết. Nhưng, các 
							thiết bị thực hành cho sinh viên ngành kỹ thuật lại rất đắt tiền nên đã tạo nên 
							trở ngại cho nhà trường. Đồng thời, các thiết bị được thao tác trực tiếp dễ gây 
							hư hỏng nên việc sửa cũng gây nhiều khó khăn cho nhà trường.
                        </p>
                        
                        <p class="para-info">
                            Đề giải quyết các vấn đề nêu trên một giải pháp đưa ra là xây dựng một 
							hệ thống giúp sinh viên và nhà trường giải quyết những vấn đề khó khăn. Với 
							ưu điểm kinh phí đầu tư hiệu quả, khả năng chia sẽ phần cứng, kết nối từ xa, 
							dễ sử dụng, quản lý DLab một phiên bản mới của ILab sẳn sàng giúp sinh 
							viên và nhà trường giải quyết những vấn đề khó khăn.
                        </p>
                        
                        <p class="para-info">
                            Sinh viên cần phải cài đặt đầy đủ các phần mềm theo yêu cầu như sau:
                        </p>
                        <ul class = para-info>
                            <li>LabVIEW Run-Time Engine 2012 SP1.</li>
                            <li>LogMeIn Hamachi.</li>
                        </ul>
                        
                    </div><!-- /.row (main row) -->

                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
        
        <footer>
            <div class="row well">
                <div class="col-lg-12">
                        <div class="container">
                            <div class="col-lg-3 col-md-6">
                                <h3>Liên kết:</h3>
                                <ul>
                                    <li><a href="">Đại Học Cần Thơ</a></li>
                                    <li><a href="">Khoa Công Nghệ - ĐHCT</a></li>
                                    <li><a href="">Khoa Khoa Học Tự Nhiên - ĐHCT</a></li>
                                    <li><a href="">Khoa CNTT và TT - ĐHCT</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <h3>Thư điện tử:</h3>
                                <ul>
                                    <li><a href="">CTU Mail</a></li>
                                    <li><a href="">Google Mail</a></li>
                                    <li><a href="">Outlook Mail</a></li>
                                    <li><a href="">Yahoo Mail</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <h3>Hướng dẫn:</h3>
                                <ul>
                                    <li><a href="">Đăng ký tài khoản</a></li>
                                    <li><a href="">Đăng ký thực hành</a></li>
                                    <li><a href="">Xem lịch thực hành</a></li>
                                    <li><a href="">Tạo lớp thực hành</a></li>
                                </ul>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <h3>Liên hệ:</h3>
                                <p><a href="" title="Email me!"><i class="fa fa-envelope"></i> Email</a></p>
                                <p><a href="" title="Call me!"><i class="fa fa-phone"></i> Phone Number</a></p>
                                
                                <h3>Follow:</h3>
                                <a href="" id="gh" target="_blank" title="facebook"><span class="fa-stack fa-lg">
                                    <i class="fa fa-square-o fa-stack-2x"></i>
                                    <i class="fa fa-facebook fa-stack-1x"></i>
                                </span>
                                dlab's Facebook</a>
                            </div>
                        </div>
                        
                        <strong class="pull-left col-lg-12 bold">
                            <span>Trường Đại học Cần Thơ (Can Tho University)</span><br />
                            <span>Khu II, đường 3/2, P. Xuân Khánh, Q. Ninh Kiều, TP. Cần Thơ.</span><br />
                            <span>Điện thoại: (84-0710) 3832663; Fax: (84-0710) 3838474; Email: dhct@ctu.edu.vn.</span><br />
                            Copyright © dlab | <a href="">Privacy Policy</a> | <a href="">Terms of Use</a>
                        </strong>
                </div>
            </div>
        </footer>

        <!-- add new calendar event modal -->
        <!-- jQuery 2.0.2 -->
        <script src="resources/js/jquery/2.0.2/jquery.min.js"></script>
        <!-- jQuery UI 1.10.3 -->
        <script src="resources/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>