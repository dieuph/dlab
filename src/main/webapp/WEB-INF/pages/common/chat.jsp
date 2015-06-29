<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="init.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>dLab | Sinh viên</title>
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
    <body class="skin-blue" ng-app="chatApp">
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
                            <c:choose>
                                <c:when test="${sessionScope.student != null}">
                                    <jsp:include page="chat_student_user_account.jsp" />    
                                </c:when>
                                <c:when test="${sessionScope.teacher != null}">
                                    <jsp:include page="chat_teacher_user_account.jsp" />
                                </c:when>
                                <c:otherwise>
                                </c:otherwise>
                            </c:choose>
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
                    <c:choose>
                        <c:when test="${sessionScope.student != null}">
                            <jsp:include page="chat_student_user_panel.jsp" />    
                        </c:when>
                        <c:when test="${sessionScope.teacher != null}">
                            <jsp:include page="chat_teacher_user_panel.jsp" />
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>
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
                        <li class="active">Chatroom</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- Main row -->
                    <div class="row">
                        <div class="col-xs-12">
                            
                            <!-- Chat box -->
                            <div class="box box-success" ng-controller="ChatCtrl">
                                <div class="box-header">
                                    <h3 class="box-title"><i class="fa fa-comments-o"></i> Chatroom</h3>
                                    <div class="box-tools pull-right" data-toggle="tooltip" title="Status">
                                        <div class="btn-group" data-toggle="btn-toggle" >
                                            <button type="button" class="btn btn-default btn-sm active"><i class="fa fa-square text-green"></i></button>                                            
                                            <button type="button" class="btn btn-default btn-sm"><i class="fa fa-square text-red"></i></button>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="box-body chat box-scroll" id="chat-box">
                                    <!-- chat item -->
                                    <div class="item message" ng-repeat="message in messages | orderBy:'time':true">
                                        <img ng-src="{{message.icon}}" alt="user image" class="online" />
                                        
                                        <p class="message">
                                            <a href="#" class="name">
                                                <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> {{message.time | date:'HH:mm'}}</small>
                                                {{message.user}}
                                            </a>
                                            <span ng-class="{self: message.self}">{{message.message}}</span>
                                        </p>
                                    </div><!-- /.item -->
                                </div><!-- /.chat -->
                                
                                <div class="box-footer">
                                    <form ng-submit="addMessage()" name="messageForm">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Type message..." ng-model="message" />
                                                                                        
                                            <c:choose>
                                                <c:when test="${sessionScope.student != null}">
                                                    <input type="text" style="position: absolute; left: -9999px; width: 1px; height: 1px;" 
                                                        ng-model="user" ng-init="user='${sessionScope.student.fullName}'" />
                                                    
                                                    <input type="text" style="position: absolute; left: -9999px; width: 1px; height: 1px;" 
                                                        ng-model="icon" ng-init="icon='resources/img/avatar5.png'" />
                                                </c:when>
                                                <c:when test="${sessionScope.teacher != null}">
                                                    <input type="text" style="position: absolute; left: -9999px; width: 1px; height: 1px;" 
                                                        ng-model="user" ng-init="user='${sessionScope.teacher.fullName}'" />
                                                        
                                                    <input type="text" style="position: absolute; left: -9999px; width: 1px; height: 1px;" 
                                                        ng-model="icon" ng-init="icon='resources/img/avatar04.png'" />
                                                </c:when>
                                                <c:otherwise>
                                                </c:otherwise>
                                            </c:choose>
                                            
                                            <div class="input-group-btn info">
                                                <button class="btn btn-success" ng-disabled="message.length > max || message.length === 0">
                                                    <span class="count" ng-bind="max - message.length" ng-class="{danger: message.length > max}">140</span>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div><!-- /.box (chat box) -->
                            
                        </div>
                    </div>

                </section><!-- /.content -->

            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- add new calendar event modal -->


        <!-- jQuery 2.0.2 -->
        <script src="resources/js/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- dlab App -->
        <script src="resources/js/dlab/app.js" type="text/javascript"></script>
        <!-- DATA TABES SCRIPT -->
        <script src="resources/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="resources/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <!-- dlab dashboard demo (This is only for demo purposes) -->
        <!-- <script src="js/dlab/dashboard.js" type="text/javascript"></script> -->

        <script src="resources/js/sockjs.min.js" type="text/javascript"></script>
        <script src="resources/js/stomp.min.js" type="text/javascript"></script>
        <script src="resources/js/angular.min.js"></script>
        <script src="resources/js/lodash.min.js"></script>
        <script src="resources/js/chatapp/app.js" type="text/javascript"></script>
        <script src="resources/js/chatapp/controllers.js" type="text/javascript"></script>
        <script src="resources/js/chatapp/services.js" type="text/javascript"></script>

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