<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<a href="#" class="dropdown-toggle" data-toggle="dropdown">
    <i class="glyphicon glyphicon-user"></i> 
    <span>
        ${sessionScope.teacher.idTeacher}
        <i class="caret"></i>
    </span>
</a>
<ul class="dropdown-menu">
	<!-- User image -->
	<li class="user-header bg-light-blue">
	    <img src="resources/img/avatar04.png" class="img-circle" alt="User Image" />
		<p>
			${sessionScope.teacher.fullName}
			<small>${sessionScope.teacher.idTeacher} - Giáo viên</small>
		</p>
    </li>

	<!-- Menu Footer-->
	<li class="user-footer">
		<div class="pull-left">
			<a href="#" class="btn btn-default btn-flat">Tài khoản</a>
		</div>
		<div class="pull-right">
			<a href="${pageContext.request.contextPath}/logout/action" class="btn btn-default btn-flat">Đăng xuất</a>
		</div>
	</li>
</ul>