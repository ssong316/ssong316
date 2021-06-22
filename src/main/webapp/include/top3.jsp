<%@page import="com.SemiProj.acc.model.AccDAO"%>
<%@page import="com.SemiProj.acc.model.AccVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>GoodHome</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=|Roboto+Sans:400,700|Playfair+Display:400,700">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aos.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.timepicker.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fancybox.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/_custom.css">

<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('input[name=register]').click(function(){
	         location.href="<%=request.getContextPath()%>/acc/register.jsp";
	      });
	});
</script>
<%
	String t_id = (String) session.getAttribute("login_id");
	String t_name = (String) session.getAttribute("name");
	String t_pwd = (String) session.getAttribute("login_pwd");
	AccVO t_vo = new AccVO();
	AccDAO dao = new AccDAO();
	t_vo = dao.selectByUserid(t_id, t_pwd);
	boolean t_login = false;
	if (t_id != null && !t_id.isEmpty()) { //세션에 값이 있으면
		t_login = true; //로그인 된 경우
	}
	Cookie[] ckArr = request.getCookies();
	String ck_value = "";
	if (ckArr != null) {
		for (int i = 0; i < ckArr.length; i++) {
			String name = ckArr[i].getName();
			if (name.equals("ck_userid")) {
		ck_value = ckArr[i].getValue();
		break;
			}
		}
	}
%>    
</head>
<body>
<!-- Theme Style -->
</head>
<body>

	<nav
		class="navbar navbar-expand-lg navbar-light pb_navbar pb_scrolled-light"
		id="templateux-navbar">
		<div class="container">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/main.jsp"><span
				class="text-danger">What</span>Ni</a>
			<div class="site-menu-toggle js-site-menu-toggle  ml-auto"
				data-aos="fade" data-toggle="collapse"
				data-target="#templateux-navbar-nav"
				aria-controls="templateux-navbar-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span></span> <span></span> <span></span>
			</div>
			<!-- END menu-toggle -->

			<div class="collapse navbar-collapse" id="templateux-navbar-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/main.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/f_list2.jsp">Help</a></li>
				<%if(!t_login){ %>
					<li class="nav-item cta-btn ml-xl-2 ml-lg-2 ml-md-0 ml-sm-0 ml-0">
					<a class="nav-link" href="#" target="_blank" data-toggle="modal"
						data-target="#staticBackdrop1">
						<span class="pb_rounded-4 px-4 rounded">Login</span></a></li>
				<%}else{ %>
				
					<li class="nav-item cta-btn ml-xl-2 ml-lg-2 ml-md-0 ml-sm-0 ml-0">
						
							<a class="nav-link" role="button" id="dropdownMenuLink"
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
								<span class="pb_rounded-4 px-4 rounded"><%=t_name%></span>
							</a>
							<div class="dropdown">
							<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<div class="ddi1">
									<a class="dropdown-item" href="<%=request.getContextPath()%>/sendmsg.jsp">메시지</a> 
									<a class="dropdown-item" href="<%=request.getContextPath()%>/n_list.jsp">알림</a> 
									<a class="dropdown-item" href="<%=request.getContextPath()%>/mytrip.jsp">여행</a> 
									<a class="dropdown-item" href="#">위시리스트</a>
								</div>
								<hr>
								<a class="dropdown-item" href="#">호스트되기</a> 
								<a class="dropdown-item" href="<%=request.getContextPath()%>/acc/register.jsp">계정</a>
								<hr>
								<a class="dropdown-item" href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a>
							</div>
						</div>
					</li>
					<%} %>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="modal fade" id="staticBackdrop1" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
		<form name="frmLogin" method="post" action="<%=request.getContextPath() %>/login/login_ok.jsp">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Login</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="col-md-12 mb-3 mb-lg-0 col-lg-12">
						<label for="id" class="font-weight-bold text-black">ID</label>
						<div class="field-icon-wrap">
							<input type="text" class="form-control" name="login_id" id="login_id" value="<%=ck_value%>">
							<span></span>
						</div>
						<div>
							&nbsp<span><input type="checkbox" class="text-black" name="rem_id" id="rem_id" value="remember me" <%if(ck_value!=null&&!ck_value.isEmpty()) {%>
            	checked="checked"
            <%} %>></span>
							&nbsp<span>remember me</span>
						</div>
					</div>
					<br>
					<div class="col-md-12 mb-3 mb-lg-0 col-lg-12">
						<label for="pwd" class="font-weight-bold text-black">PASSWORD</label>
						<div class="field-icon-wrap">
							<input type="password" class="form-control" name="login_pwd" id="login_pwd">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn" name="register" onclick="<%=request.getContextPath()%>/acc/register.jsp" value="Create Account">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<input type="submit" class="btn btn-primary" id="bt_login" value="Login">
				</div>
			</div>
			
		</form>
		</div>
		
	</div>
	
		

<section class="py-5 bg-light">
      <div class="container">
         <div class="row align-items-center" style="padding-top:100px;">
            