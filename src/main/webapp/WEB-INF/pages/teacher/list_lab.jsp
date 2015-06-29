<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/init.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>dLab | Giáo viên</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- shortcut icon -->
        <link href="../resources/img/fav.ico" rel="icon" />
        <!-- bootstrap 3.0.2 -->
        <link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="../resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="../resources/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- daterange picker -->
        <link href="../resources/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- iCheck for checkboxes and radio inputs -->
        <link href="../resources/css/iCheck/all.css" rel="stylesheet" type="text/css" />
        <!-- Bootstrap Color Picker -->
        <link href="../resources/css/colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet"/>
        <!-- Bootstrap time Picker -->
        <link href="../resources/css/timepicker/bootstrap-timepicker.min.css" rel="stylesheet"/>
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
                            <c:if test="${sessionScope.teacher != null}">
                            <jsp:include page="../common/teacher_user_account.jsp" />
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
                    <c:if test="${sessionScope.teacher != null}">
                        <jsp:include page="../common/teacher_user_panel.jsp" />
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
                        <small>Giáo viên</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Giáo viên</a></li>
                        <li class="active">Xem lớp thực hành</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- Main row -->
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- create lab -->
                            <div class="box box-info">
                                <div class="box-header">
                                    <i class="fa fa-list-alt"></i>
                                    <h3 class="box-title">Xem lớp thực hành</h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    
                                    <c:if test="${delete_lab_success != null}">
                                    <div class="alert alert-success alert-dismissable alert-top">
                                        <i class="fa fa-check"></i>
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        <b>Alert!</b> ${delete_lab_success}
                                    </div>
                                    </c:if>
                                    
                                    <c:if test="${delete_lab_error != null}">
                                    <div class="alert alert-danger alert-dismissable alert-top">
                                        <i class="fa fa-ban"></i>
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        <b>Alert!</b> ${delete_lab_error}
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
                                            <c:forEach items="${requestScope.labs}" var="lab">
                                            <tr>
                                                <td>${lab.idLab}</td>
                                                <td>${lab.name}</td>
                                                <td>${lab.amount}</td>
                                                <td>${lab.idCourse}</td>
                                                <td>${sessionScope.teacher.fullName}</td>
                                                <td class="manager-lab-function-group">
                                                    <form action="${pageContext.request.contextPath}/teacher/manager-lab" method="POST">
                                                        <input hidden="hidden" value="${lab.idLab}" name="idLab" />
                                                        <button class="btn btn-success" type="submit">
                                                            <i class="fa fa-wrench"></i> Quản lý
                                                        </button> 
                                                    </form>
                                                    <form action="${pageContext.request.contextPath}/teacher/list-reg" method="POST">
                                                        <input hidden="hidden" value="${lab.idLab}" name="idLab" />
                                                        <button class="btn btn-info" type="submit">
                                                            <i class="fa fa-list-ol"></i> Danh sách đăng ký
                                                        </button> 
                                                    </form>
                                                    <form action="${pageContext.request.contextPath}/teacher/delete-lab" method="POST">
                                                        <input hidden="hidden" value="${lab.idLab}" name="idLab" />
                                                        <button class="btn btn-danger" type="submit">
                                                            <i class="fa fa-trash-o"></i> Xóa
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
        <!-- jQuery UI 1.10.3 -->
        <!-- <script src="js/jquery-ui-1.10.3.min.js" type="text/javascript"></script> -->
        <!-- InputMask -->
        <script src="../resources/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="../resources/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="../resources/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
        <!-- date-range-picker -->
        <script src="../resources/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <!-- bootstrap color picker -->
        <script src="../resources/js/plugins/colorpicker/bootstrap-colorpicker.min.js" type="text/javascript"></script>
        <!-- bootstrap time picker -->
        <script src="../resources/js/plugins/timepicker/bootstrap-timepicker.min.js" type="text/javascript"></script>
        <!-- DATA TABES SCRIPT -->
        <script src="../resources/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="../resources/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../resources/js/bootstrap.min.js" type="text/javascript"></script>

        <!-- dlab App -->
        <script src="../resources/js/dlab/app.js" type="text/javascript"></script>
        
        <!-- dlab dashboard demo (This is only for demo purposes) -->
        <!-- <script src="js/dlab/dashboard.js" type="text/javascript"></script> -->

        <!-- Page script -->
        <script type="text/javascript">
            $(function() {
                
                //Timepicker
                $(".timepicker").timepicker({
                    showInputs: false
                });
            });
        </script>

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