<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/init.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>dLab | Sinh viên</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- shortcut icon -->
        <link href="../resources/img/fav.ico" rel="icon" />
        <!-- bootstrap 3.0.2 -->
        <link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="../resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="../resources/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- DATA TABLES -->
        <link href="../resources/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="../resources/css/dlab.css" rel="stylesheet" type="text/css" />
        <link href="../resources/css/custom.css" rel="stylesheet" type="text/css" />
        
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    
    <body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="#" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                dLab
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <c:if test="${sessionScope.student != null}">
                            <jsp:include page="../common/student_user_account.jsp" />
                            </c:if>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <c:if test="${sessionScope.student != null}">
                        <jsp:include page="../common/student_user_panel.jsp" />
                    </c:if>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Hệ thống quản lý phòng thí nghiệm
                        <small>Sinh viên</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Sinh viên</a></li>
                        <li class="active">Xem lớp thực hành</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- Main row -->
                    <div class="row">
                        <div class="col-xs-12">

                            <!-- Deregister lab -->
                            <div class="box box-warning">
                                <div class="box-header">
                                    <i class="fa fa-list-alt"></i>
                                    <h3 class="box-title">Xem lớp thực hành</h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    
                                    <c:if test="${delete_reglab_success != null}">
                                    <div class="alert alert-success alert-dismissable alert-top">
                                        <i class="fa fa-check"></i>
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        <b>Alert!</b> ${delete_reglab_success}
                                    </div>
                                    </c:if>
                                    
                                    <c:if test="${delete_reglab_error != null}">
                                    <div class="alert alert-danger alert-dismissable alert-top">
                                        <i class="fa fa-ban"></i>
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        <b>Alert!</b> ${delete_reglab_error}
                                    </div>      
                                    </c:if>
                                
                                    <table id="example2" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Tên lớp</th>
                                                <th>Sĩ số</th>
                                                <th>Môn học</th>
                                                <th>Giáo viên</th>
                                                <th>Chức năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.registedList}" var="reg" varStatus="loop">
                                            <tr>
                                                <td>${loop.index + 1}</td>
                                                <td>${reg.name}</td>
                                                <td>${reg.amount}</td>
                                                <td>${reg.idCourse}</td>
                                                <td>${reg.fullName}</td>
                                                <td class="manager-lab-function-group">
                                                    <form action="${pageContext.request.contextPath}/student/detail-lab" method="POST">
                                                        <input hidden="hidden" value="${reg.idLab}" name="idLab" />
                                                        <button class="btn btn-success" type="submit">
                                                            <i class="fa fa-info-circle"></i> Xem chi tiết
                                                        </button> 
                                                    </form>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>STT</th>
                                                <th>Tên lớp</th>
                                                <th>Sĩ số</th>
                                                <th>Môn học</th>
                                                <th>Giáo viên</th>
                                                <th>Chức năng</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                            
                            
                        </div>
                    </div>

                </section><!-- /.content -->

            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- add new calendar event modal -->


        <!-- jQuery 2.0.2 -->
        <script src="../resources/js/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="../resources/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- dlab App -->
        <script src="../resources/js/dlab/app.js" type="text/javascript"></script>
        <!-- DATA TABES SCRIPT -->
        <script src="../resources/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="../resources/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <!-- dlab dashboard demo (This is only for demo purposes) -->
        <!-- <script src="js/dlab/dashboard.js" type="text/javascript"></script> -->

        <!-- page script -->
        <script type="text/javascript">
            $(function() {
                $("#example1").dataTable();
                $('#example2').dataTable({
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": true,
                    "bInfo": true,
                    "bAutoWidth": false
                });
            });
        </script>

    </body>
</html>