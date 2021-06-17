<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String t_id=(String)session.getAttribute("id");
	String t_name=(String)session.getAttribute("name");
	boolean t_login=false;
	if(t_id!=null && !t_id.isEmpty()){ //세션에 값이 있으면
		t_login=true;  //로그인 된 경우
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>GoodHome</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=|Roboto+Sans:400,700|Playfair+Display:400,700">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">
<link rel="stylesheet" href="css/fancybox.min.css">
<link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
.footer {
	text-align: center;
	background: #0b2352;
	font-weight: bold;
	color: white;
	height: 50px;
	padding: 10px
}
.dropdown-item{
	font-size:0.8em
}
.ddi1 a{
	font-weight:bold;
}

.pb_navbar ul > li.cta-btn > div > a > span {
    padding: 10px;
    border: 1px solid rgba(255, 255, 255, 0.5); }
    @media (max-width: 991.98px) {
      .pb_navbar ul > li.cta-btn > div > a > span {
        border: none;
        background: #ff0000;
        color: #fff; } }
        
@media (max-width: 991.98px) {
  .pb_navbar {
  	background: #fff;
    padding: 15px 15px; }
      
  .pb_navbar ul li div a {
    color: #000 !important; } }

.site-hero overlay{
	padding-top: 30px;
}
        
</style>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('input[name=register]').click(function(){
	         location.href="acc/register.jsp";
	      });
	});
</script>
</head>
<body data-spy="scroll" data-target="#templateux-navbar"
	data-offset="200">

	<nav
		class="navbar navbar-expand-lg navbar-dark pb_navbar pb_scrolled-light"
		id="templateux-navbar">
		<div class="container">
			<a class="navbar-brand" href="temp_main.jsp"><span
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
					<li class="nav-item"><a class="nav-link" href="temp_main.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="#section-contact">Contact</a></li>
				<%if(!t_login){ %>
					<li class="nav-item cta-btn ml-xl-2 ml-lg-2 ml-md-0 ml-sm-0 ml-0">
					<a class="nav-link" href="#" target="_blank" data-toggle="modal"
						data-target="#staticBackdrop">
						<span class="pb_rounded-4 px-4 rounded">Login</span></a></li>
				<%}else{ %>
				
					<li class="nav-item cta-btn ml-xl-2 ml-lg-2 ml-md-0 ml-sm-0 ml-0">
						<div class="dropdown">
							<a class="nav-link" href="#" role="button" id="dropdownMenuLink"
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
								<span class="pb_rounded-4 px-4 rounded"><%=t_name%></span>
							</a>

							<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<div class="ddi1">
									<a class="dropdown-item" href="#">메시지</a> 
									<a class="dropdown-item" href="#">알림</a> 
									<a class="dropdown-item" href="#">여행</a> 
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
	
	<section class="site-hero overlay"
		style="background-image: url(images/back.jpg)"
		data-stellar-background-ratio="0.5" id="section-home">
		<div class="container">
			<div
				class="row site-hero-inner justify-content-center align-items-center">
				<div class="col-md-10 text-center" data-aos="fade-up">
					<h1 class="heading">HAVE A GOOD TIME</h1>
				</div>
			</div>
		</div>
		<div class="container">

		</div>
	</section>

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
		<form name="frmLogin" method="post" action="login/login_ok.jsp">
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
							<input type="text" class="form-control" name="id" id="id">
							<span></span>
						</div>
						<div>
							&nbsp<span><input type="checkbox" class="text-black" name="rem_id" id="rem_id" value="remember me"></span>
							&nbsp<span>remember me</span>
						</div>
					</div>
					<br>
					<div class="col-md-12 mb-3 mb-lg-0 col-lg-12">
						<label for="pwd" class="font-weight-bold text-black">PASSWORD</label>
						<div class="field-icon-wrap">
							<input type="password" class="form-control" name="pwd" id="pwd">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn" name="register" onclick="acc/register.jsp" value="Create Account">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<input type="submit" class="btn btn-primary" id="bt_login" value="Login">
				</div>
			</div>
			
		</form>
		</div>
		
	</div>



	<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/jquery.fancybox.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/aos.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/jquery.timepicker.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>