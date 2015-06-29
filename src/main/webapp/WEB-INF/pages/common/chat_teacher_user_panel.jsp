<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="init.jsp" %>

<!-- Sidebar user panel -->
<div class="user-panel">
	<div class="pull-left image">
		<img src="resources/img/avatar04.png" class="img-circle" alt="User Image" />
	</div>
	<div class="pull-left info">
		<c:set var="splitName" value='${fn:split(sessionScope.teacher.fullName, " ")}' />
		<p>Xin chào, ${splitName[fn:length(splitName) - 1]}</p>
	
		<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
	</div>
</div>

<!-- search form -->
<form action="#" method="get" class="sidebar-form">
	<div class="input-group">
		<input type="text" name="q" class="form-control" placeholder="Tìm kiếm..." /> <span class="input-group-btn">
			<button type='submit' name='seach' id='search-btn' class="btn btn-flat">
				<i class="fa fa-search"></i>
			</button>
		</span>
	</div>
</form>

<!-- /.search form -->
<!-- sidebar menu: : style can be found in sidebar.less -->
<ul class="sidebar-menu">
	<li>
	    <a href="${pageContext.request.contextPath}/teacher/teacher-main-page">
	        <i class="fa fa-list-alt"></i> <span>Xem lớp thực hành</span>
	    </a>
	</li>
	<li>
	   <a href="${pageContext.request.contextPath}/teacher/create-lab">
	       <i class="fa fa-plus-square"></i> <span>Tạo lớp thực hành</span>
	   </a>
	</li>
	<li>
        <a href="${pageContext.request.contextPath}/chat">
            <i class="fa fa-users"></i> <span>Chatroom</span>
        </a>
    </li>
</ul>