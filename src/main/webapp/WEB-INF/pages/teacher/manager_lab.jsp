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
                        <li class="active">Quản lý lớp thực hành</li>
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
                                    <i class="fa fa-cogs"></i>
                                    <h3 class="box-title">Quản lý lớp thực hành</h3>
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
                                                    <form action="${pageContext.request.contextPath}/teacher/load-file-vpn" id="vpnForm" target="_blank" method="POST">
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
                                                    <form action="${pageContext.request.contextPath}/teacher/delete-lab-notify" method="POST">
                                                        <input hidden="hidden" name="idLab" value="${requestScope.lab.idLab}" />
                                                        <input hidden="hidden" name="idLabNotify" value="${labNotify.idLabNotify}"  />
                                                        <button class="btn btn-danger btn-position" type="submit">
                                                            <i class="fa fa-trash-o"></i> Xóa
                                                        </button> 
                                                    </form>
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
                                                    
                                                    <p>Link thực hành: <a href="<%=labResource.getLabLink()%>" target="_blank">Link bài thực hành</a></p>
                                                    
                                                    <form action="${pageContext.request.contextPath}/teacher/delete-lab-resource" method="POST">
                                                        <input hidden="hidden" name="idLab" value="${requestScope.lab.idLab}" />
                                                        <input hidden="hidden" name="idLabResource" value="<%=labResource.getIdLabResource() %>"  />
                                                        <button class="btn btn-danger" type="submit">
                                                            <i class="fa fa-trash-o"></i> Xóa
                                                        </button> 
                                                    </form>
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
                                    <a href="${pageContext.request.contextPath}/teacher/teacher-main-page" class="btn btn-default">
                                        <i class="fa fa-arrow-circle-o-left"></i> 
                                        Trở về
                                    </a>
                                    <button class="btn btn-primary" data-toggle="modal" data-target="#infoModal"><i class="fa fa-info-circle"></i> Cập nhật thông tin chung</button>
                                    <button class="btn btn-warning" data-toggle="modal" data-target="#bullhornModal"><i class="fa fa-bullhorn"></i> Thêm thông báo</button>
                                    <button class="btn btn-success" data-toggle="modal" data-target="#fileModal"><i class="fa fa-file-o"></i> Thêm bài thực hành</button>
                                </div>
                            </div><!-- /.box -->
                        </div>
                    </div>
                </section><!-- /.content -->

            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- Modal cap nhat thong tin chung -->
        <div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Cập nhật thông tin chung</h4>
                    </div>
                    
                    <form action="${pageContext.request.contextPath}/teacher/update-lab" method="POST" enctype="multipart/form-data">
                    <div class="modal-body">
                        <c:if test="${requestScope.lab != null}">
                        <!-- text input -->
                        <div class="form-group">
                            <label>Tên lớp thực hành</label>
                            <input type="text" name="name" value="${requestScope.lab.name}" class="form-control" placeholder="" required="required" />
                        </div>
                        
                        <div class="form-group">
                            <label>Sĩ số</label>
                            <input type="number" name="amount" value="${requestScope.lab.amount}" class="form-control" placeholder="" required="required" />
                        </div>
                        
                        <div class="form-group">
                            <label>Môn học / Học phần</label>
                            <select class="form-control" name="idCourse" required="required">
                                <option value="" disabled="disabled">Chọn học phần</option>
                                
                                <c:forEach items="${requestScope.courses}" var="course">
                                <option value="${course.idCourse}" ${course.idCourse == requestScope.lab.idCourse ? "selected" : "" }>
                                    ${course.idCourse} - ${course.name}
                                </option>
                                </c:forEach>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleInputFile">File mô tả VPN</label>
                            <input type="file" name="fileVPN" id="fileVPN" />
                            <!--<p class="help-block">Example block-level help text here.</p>-->
                        </div>
                        
                        <input hidden="hidden" name="idLab" value="${requestScope.lab.idLab}" />
                        </c:if>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Lưu</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Modal them thong bao -->
        <div class="modal fade" id="bullhornModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Thêm thông báo</h4>
                    </div>
                    <form action="${pageContext.request.contextPath}/teacher/add-lab-notify" method="POST">
                    <div class="modal-body">
                        <!-- text input -->
                        <div class="form-group">
                            <label>Tên thông báo</label>
                            <input type="text" name="name" class="form-control" placeholder="" required="required" />
                        </div>
                        
                        <div class="form-group">
                            <label>Nội dung</label>
                            <textarea name="content" rows="3" class="form-control" placeholder="" required="required"></textarea>
                        </div>
                        
                        <input hidden="hidden" name="idLab" value="${requestScope.lab.idLab}" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Lưu</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Modal them bai thuc hanh-->
        <div class="modal fade" id="fileModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Thêm bài thực hành</h4>
                    </div>
                    <form action="${pageContext.request.contextPath}/teacher/add-lab-resource" method="POST">
                    <div class="modal-body">
                        <!-- text input -->
                        <div class="form-group">
                            <label>Tên bài thực hành</label>
                            <input type="text" name="name" class="form-control" placeholder="" required="required" />
                        </div>
                        
                        <div class="form-group">
                            <label>Ngày bắt đầu</label>
                            <div class="bootstrap-timepicker">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="text" name="startDate" class="form-control" data-inputmask="'alias': 'dd-mm-yyyy'" 
                                            data-mask required="required" />
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                    </div><!-- /.input group -->
                                </div><!-- /.form group -->
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label>Ngày kết thúc</label>
                            <div class="bootstrap-timepicker">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="text" name="endDate" class="form-control" data-inputmask="'alias': 'dd-mm-yyyy'"
                                            data-mask required="required" />
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                    </div><!-- /.input group -->
                                </div><!-- /.form group -->
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label>Thời gian bắt đầu</label>
                            <div class="bootstrap-timepicker">
                                <div class="form-group">
                                    <div class="input-group">                                            
                                        <input type="text" name="startTime" class="form-control timepicker" required="required" />
                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>
                                    </div><!-- /.input group -->
                                </div><!-- /.form group -->
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label>Thời gian kết thúc</label>
                            <div class="bootstrap-timepicker">
                                <div class="form-group">
                                    <div class="input-group">                                            
                                        <input type="text" name="endTime" class="form-control timepicker" required="required" />
                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>
                                    </div><!-- /.input group -->
                                </div><!-- /.form group -->
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label>Link thực hành</label>
                            <input type="text" name="labLink" class="form-control" placeholder="" required="required" />
                        </div>
                        
                        <input hidden="hidden" name="idLab" value="${requestScope.lab.idLab}" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Lưu</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- jQuery 2.0.2 -->
        <script src="../resources/js/jquery/2.0.2/jquery.min.js"></script>
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
                //Datemask dd/mm/yyyy
                $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
                //Datemask2 mm/dd/yyyy
                $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
                //Money Euro
                $("[data-mask]").inputmask();
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