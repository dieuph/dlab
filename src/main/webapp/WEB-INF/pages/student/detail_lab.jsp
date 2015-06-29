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
                        <li class="active">Chi tiết lớp thực hành</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- Main row -->
                    <div class="row">
                        <div class="col-xs-12">

                            <!-- Register lab -->
                            <div class="box box-primary">
                                <div class="box-header">
                                    <i class="fa fa-info-circle"></i>
                                    <h3 class="box-title">Chi tiết lớp thực hành</h3>                                    
                                </div><!-- /.box-header -->
                                <div class="box-body">
                                    <div class="box-group" id="accordion">
                                        <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                                        <div class="panel box box-primary">
                                            <div class="box-header">
                                                <h4 class="box-title">
                                                    <i class="fa fa-info"></i>
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                        Thông tin chung
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseOne" class="panel-collapse collapse in">
                                                <div class="box-body">
                                                    <c:if test="${requestScope.lab == null}">
                                                    Dont do that, mah :)
                                                    </c:if>
                                                
                                                    <c:if test="${requestScope.lab != null}">
                                                    <p>Tên lớp thực hành: <strong>${requestScope.lab.name}</strong></p>
                                                    <p>Sĩ số: <strong>${requestScope.lab.amount}</strong></p>
                                                    <p>Môn học/ Học phần: <strong>${requestScope.course.idCourse} - ${requestScope.course.name}</strong></p>
                                                    <form action="${pageContext.request.contextPath}/student/load-file-vpn" id="vpnForm" target="_blank" method="POST">
                                                    <p>File mô tả VPN: 
                                                        <input value="${requestScope.lab.idLab}" name="idLab" hidden="hidden"/>
                                                        <input value="${requestScope.lab.fileVPN}" name="fileVPN" hidden="hidden"/>
                                                        <strong>
                                                            <a href="javascript:{}" onclick="document.getElementById('vpnForm').submit();">File VPN</a>
                                                        </strong>
                                                    </p>
                                                    </form>
                                                    <p>Giáo viên: <strong>${requestScope.user.fullName}</strong></p>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel box box-danger">
                                            <div class="box-header">
                                                <h4 class="box-title">
                                                    <i class="fa fa-bullhorn"></i>
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                        Thông báo
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseTwo" class="panel-collapse collapse in">
                                                <div class="box-body">
                                                    <c:if test="${fn:length(requestScope.labNotifyList) == 0}">
                                                    Chưa có thông báo
                                                    </c:if>
                                                
                                                    <c:forEach items="${requestScope.labNotifyList}" var="labNotify">
                                                    <strong>${labNotify.name}</strong><br />
                                                    ${labNotify.content}
                                                    <hr />
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel box box-success">
                                            <div class="box-header">
                                                <h4 class="box-title">
                                                    <i class="fa fa-file-o"></i>
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                                        Bài thực hành
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseThree" class="panel-collapse collapse in">
                                                <div class="box-body">
                                                    <c:if test="${fn:length(requestScope.labResourceList) == 0}">
                                                    Chưa có bài thực hành
                                                    </c:if>
                                                
                                                    <%
	                                                    @SuppressWarnings("unchecked")
	                                                    List<LabResource> labResourceList = (List<LabResource>) request.getAttribute("labResourceList");
	                                                    if (labResourceList != null && labResourceList.size() > 0) {
	                                                        for(LabResource labResource : labResourceList) {
                                                    %>
                                                    <p>Tên bài thực hành: <strong><%=labResource.getName()%></strong></p>
                                                    
                                                    <p>Ngày bắt đầu: 
                                                        <strong>
                                                            <%=DateTimeFormatImpl.getDateFromDate(labResource.getStartDateTime())%>
                                                        </strong>
                                                    </p>

                                                    <p>Ngày kết thúc: 
                                                        <strong>
                                                            <%=DateTimeFormatImpl.getDateFromDate(labResource.getEndDateTime())%>
                                                        </strong>
                                                    </p>

                                                    <p>Thời gian: 
                                                        <strong>
                                                            <%=DateTimeFormatImpl.getTimeFromDate(labResource.getStartDateTime())%> - 
                                                            <%=DateTimeFormatImpl.getTimeFromDate(labResource.getEndDateTime())%>
                                                        </strong>
                                                    </p>
                                                    
                                                    <p>Link thực hành: <a href="<%=labResource.getLabLink()%>" title="">Link bài thực hành</a></p>
                                                    <hr />    
                                                    <%
                                                            }
                                                        }
                                                    %>  
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- /.box-body -->
                                <div class="box-footer">
                                    <a href="${pageContext.request.contextPath}/student/student-main-page" class="btn btn-default">
                                        <i class="fa fa-arrow-circle-o-left"></i> 
                                        Trở về
                                    </a>
                                    
                                    <form action="${pageContext.request.contextPath}/student/un-register-lab" class="footer-form-inline" method="POST">
	                                    <input value="${requestScope.lab.idLab}" name="idLab" hidden="hidden"/>
	                                    <button class="btn btn-danger"><i class="fa fa-exclamation-triangle"></i> Hủy đăng ký</button>
                                    </form>
                                </div>
                            </div><!-- /.box -->
                        </div>
                    </div>
                </section><!-- /.content -->

            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- add new calendar event modal -->


        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- jQuery UI 1.10.3 -->
        <!-- <script src="js/jquery-ui-1.10.3.min.js" type="text/javascript"></script> -->
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