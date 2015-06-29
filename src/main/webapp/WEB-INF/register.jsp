<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="bg-black" ng-app="registerApp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>dLab | Đăng ký tài khoản</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- shortcut icon -->
        <link href="resources/img/fav.ico" rel="icon" />
        <!-- bootstrap 3.0.2 -->
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="resources/css/dlab.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/custom.css" rel="stylesheet" type="text/css" />

        <!-- AngularJS 1.2.6 -->
        <script src="resources/js/angular.min.js"></script>
        
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="bg-black">

        <div class="form-box" id="login-box" ng-controller="registerCtrl">
            <div class="header">Đăng  ký tài khoản</div>
            <form action="${pageContext.request.contextPath}/register/action" name="regForm" method="post" novalidate="novalidate">
                <div class="body bg-gray">
                    <c:if test="${create_student_success != null}">
                    <div class="alert alert-success alert-dismissable alert-top">
                        <i class="fa fa-check"></i>
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <b>Alert!</b> ${create_student_success}
                    </div>
                    </c:if>
                    
                    <c:if test="${studentid_exists != null}">
                    <div class="alert alert-danger alert-dismissable alert-top">
                        <i class="fa fa-ban"></i>
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <b>Alert!</b> ${studentid_exists}
                    </div>      
                    </c:if>
                    
                    <!-- form body -->
                    <div class="form-group">
                        <input type="text" name="idStudent" class="form-control" placeholder="Mã số sinh viên" required="required" 
                            ng-model="idStudent" ng-minlength="7" ng-maxlength="10" />
                        <div class="form-error" ng-show="regForm.idStudent.$dirty && regForm.idStudent.$invalid">
                            <span ng-show="regForm.idStudent.$error.required">Thông tin bắt buộc nhập</span>
                            <span ng-show="regForm.idStudent.$error.minlength">Mã số tối thiểu 7 ký tự</span>
                            <span ng-show="regForm.idStudent.$error.maxlength">Mã số tối đa 10 ký tự</span>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <input type="text" name="fullName" class="form-control" placeholder="Họ tên" required="required"
                            ng-model="fullName" ng-minlength="3" />
                        <div class="form-error" ng-show="regForm.fullName.$dirty && regForm.fullName.$invalid">
                            <span ng-show="regForm.fullName.$error.required">Thông tin bắt buộc nhập</span>
                            <span ng-show="regForm.fullName.$error.minlength">Vui lòng nhập họ tên đầy đủ</span>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <input type="password" name="password" id="password" class="form-control" placeholder="Mật khẩu" required="required"
                            ng-model="password" ng-minlength="6" ng-maxlength="20" />
                        <div class="form-error" ng-show="regForm.password.$dirty && regForm.password.$invalid">
                            <span ng-show="regForm.password.$error.required">Thông tin bắt buộc nhập</span>
                            <span ng-show="regForm.password.$error.minlength">Mật khẩu từ 6-20 ký tự</span>
                            <span ng-show="regForm.password.$error.maxlength">Mật khẩu từ 6-20 ký tự</span>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <input type="password" name="password2"  id="password2" class="form-control" placeholder="Xác nhận mật khẩu" required="required"
                            ng-model="password2" valid-password-c />
                        <div class="form-error" ng-show="regForm.password2.$dirty && regForm.password2.$invalid">
                            <span ng-show="regForm.password2.$error.required">Thông tin bắt buộc nhập</span>
                            <span ng-show="regForm.password2.$error.noMatch">Mật khẩu xác nhận không trùng</span>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <select name="idStudentClass" class="form-control" required="required"
                            ng-model="idStudentClass" >
                            <option value="" disabled="disabled" selected="selected">Chọn lớp</option>
                            <c:forEach items="${requestScope.stuClassList}" var="studentClass">
                                <option value="${studentClass.idStudentClass}">
                                    ${studentClass.idStudentClass} - ${studentClass.name}
                                </option>
                            </c:forEach>
                        </select>
                        <div class="form-error" ng-show="regForm.idStudentClass.$dirty && regForm.idStudentClass.$invalid">
                            <span ng-show="regForm.idStudentClass.$error.required">Thông tin bắt buộc nhập</span>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <input type="email" name="email" class="form-control" placeholder="Địa chỉ email" required="required" 
                             ng-model="email" />
                        <div class="form-error" ng-show="regForm.email.$dirty && regForm.email.$invalid">
                            <span ng-show="regForm.email.$error.required">Thông tin bắt buộc nhập</span>
                            <span ng-show="regForm.email.$error.invalid">Email không hợp lệ</span>
                        </div>
                    </div>
                </div>
                <div class="footer">                    
                    <button type="submit" class="btn bg-olive btn-block"
                        ng-disabled="!regForm.$valid">
                        Đăng ký
                    </button>

                    <p><a href="${pageContext.request.contextPath}/login" class="text-center">Đăng nhập</a></p>
                    
                    <p><a href="${pageContext.request.contextPath}/index" class="text-center">Trang chủ</a></p>
                </div>
            </form>
        </div>
        <script>
            var registerApp = angular.module("registerApp", []);
            
            registerApp.controller("registerCtrl", function($scope) {
                $scope.idStudent = null;
                $scope.fullName = null;
                $scope.password = null;
                $scope.password2 = null;
                $scope.idStudentClass = null;
                $scope.email = null;
            });
            
            registerApp.directive("validPasswordC", function() {
                return {
                    require: 'ngModel',
                    link: function (scope, elm, attrs, ctrl) {
                        ctrl.$parsers.unshift(function (viewValue, $scope) {
                            var noMatch = viewValue != scope.regForm.password.$viewValue
                            ctrl.$setValidity('noMatch', !noMatch);
                        });
                    }
                }
            });
        </script>
        
        <!-- jQuery 2.0.2 -->
        <script src="resources/js/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="resources/js/bootstrap.min.js" type="text/javascript"></script> 

    </body>
</html>