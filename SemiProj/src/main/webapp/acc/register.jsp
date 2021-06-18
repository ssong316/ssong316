<%@page import="bnb.acc.model.AccDAO"%>
<%@page import="bnb.acc.model.AccVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	String t_id=(String)session.getAttribute("id");
	String t_name=(String)session.getAttribute("name");
	String t_pwd=(String)session.getAttribute("pwd");
	AccVO t_vo= new AccVO();
	AccDAO dao = new AccDAO();
	t_vo = dao.selectByUserid(t_id, t_pwd);
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
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- <link rel="stylesheet" type="text/css"
   href="//fonts.googleapis.com/css?family=|Roboto+Sans:400,700|Playfair+Display:400,700"> -->
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=|Roboto+Sans:400,700|Playfair+Display:400,700">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/animate.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/aos.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery.timepicker.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/fancybox.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<style type="text/css">
footer.footer {
    width: 100%;
    background: #1b3042;
}

.link-column {
    display: inline-block;
    position: relative;
    left: 15%;
    width: 300px;
    margin-top: 20px;
}

.copy{
   text-align: center;
   height: 50px;
   color: white;
}    
.warn{
	font-weight: normal;
	color: red;
	display: none;
	font-size: 0.7em;
	
}
#zipcode{
	width: 50%;	
} 
#reg-frame{
	border-radius: 3px;
}
.col-md-10.text-center.aos-init.aos-animate {
    padding-top: 120px;
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
<script src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
			$('#bt_createAccount').click(function(){
				chk_void();
				//confirm_pwd();
			});
			
			$('#address').click(function(){
				$('div[name=add_spc]').modal('show');
			});
			
			var address;
			$('#bt_address').click(function(){
				address = $('#address1').val()+ $('#address2').val();
				$('#address').val(address);
				$('div[name=add_spc]').modal('hide');
			});
	});
	
	function chk_void(){
		$('#info input').each(function(idx, item){
			var pwd = $('#pwd').val();
			var pwdc = $('#pwd_chk').val();
			if($(this).val().length<1){
				$(this).prev().show();
				$(item).focus();
				event.preventDefault();
				return false;
			}
		});
	}
	
	function invalid_id(){
		
	}
	
	function confirm_pwd(){
		var pwd = $('#pwd').val();
		var pwdc = $('#pwd_chk').val();
		if(pwd!=pwdc){
			//$('#pwd_chk').prev().text("비밀번호를 다시 확인하세요"); 
			//$('#pwd_chk').prev().show();
			$('#pwd_chk').focus();
			event.preventDefault();
			//return false;
		}
	}
	
	function invalid_pn(){
		
	}
</script>
</head>
<body data-spy="scroll" data-target="#templateux-navbar"
   data-offset="200">


	<nav
		class="navbar navbar-expand-lg navbar-light pb_navbar pb_scrolled-light"
		id="templateux-navbar">
		<div class="container">
			<a class="navbar-brand" href="<%=request.getContextPath() %>/temp_main.jsp"><span
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
						data-target="div[name=acc_spc]">
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
   <!-- END nav -->

<%--    <section class="site-hero overlay"
      style="background-image: url(../images/back.jpg)"
      data-stellar-background-ratio="0.5" id="section-home">
      <div class="container" id="reg-frame">
         <div
            class="row site-hero-inner justify-content-center align-items-center">
            <div class="col-md-10 text-center" data-aos="fade-up">
               <div class="block-32" data-aos="fade-up">
               	<form name="frmReg" action="register_ok.jsp">
               		<div id="info">
	               		<div class="row">
	               			<label for="id" class="font-weight-bold text-black">아이디&nbsp</label><span class="warn">아이디를 입력하세요</span>
	               			<input type="text" id="id" class="form-control" name="id" value="<%=t_login?t_id:""%>">
	               			<br>
	               			<br>
	               			<label for="pwd" class="font-weight-bold text-black">비밀번호&nbsp</label><span class="warn">비밀번호를 입력하세요</span>
	               			<input type="password" id="pwd" class="form-control" name="pwd">
	               			<br>
	               			<br>
	               			<label for="password_chk" class="font-weight-bold text-black">비밀번호 확인&nbsp</label><span class="warn">비밀번호를 한번 더 입력하세요</span>
	               			<input type="password" id="pwd_chk" class="form-control" name="pwd_chk">
	               			<br>
	               			<br>
	               			<label for="name" class="font-weight-bold text-black">이름&nbsp</label><span class="warn">이름을 입력하세요</span>
	               			<input type="text" id="name" class="form-control" name="name" value="<%=t_login?t_vo.getName():""%>">
		               		<br>
		               		<br>
		               		<label for="age" class="font-weight-bold text-black">나이&nbsp</label><span class="warn">나이를 입력하세요</span>
		               		<input type="text" id="age" class="form-control" name="age" value="어떻게 할지 고민중" value="<%=t_login?t_vo.getAge():""%>">
		               		<br>
		               		<br>
	               			<label for="address" class="font-weight-bold text-black">주소&nbsp</label><span class="warn">주소를 입력하세요</span>
	               			<input type="text" id="address" class="form-control" name="address" ReadOnly value="asdf" value="<%=t_login?t_vo.getAddress():""%>">
	               			<br>
	               			<br>
	               			<label for="email" class="font-weight-bold text-black">이메일&nbsp</label><span class="warn">이메일을 입력하세요</span>
	               			<input type="text" id="email" class="form-control" name="email" value="<%=t_login?t_vo.getEmail():""%>">
	               			<br>
	               			<br>
	               			<label for="pn" class="font-weight-bold text-black">전화번호&nbsp</label><span class="warn">전화번호를 입력하세요</span>
	               			<input type="text" id="pn" class="form-control" name="pn" value="<%=t_login?t_vo.getPn():""%>">
	               		</div>
               		</div>
               		<hr>
               		<div>
               			<input type="submit" class="btn btn-primary" id="bt_createAccount" value="<%=t_login?"Save Change":"Create Account"%>" style="font-weight:bold">
               		</div>
               	</form>
               </div>
            </div>
         </div>
      </div>

   </section> --%>
   <!-- END section -->
   <div class="modal fade" id="staticBackdrop" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true" name="acc_spc">
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
							<input type="password" class="form-control" name="pwd" id="t_pwd">
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
   
   <!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true" name="add_spc">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Address</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="col-md-12 mb-3 mb-lg-0 col-lg-12">
						<label for="zipcode" class="font-weight-bold text-black">우편번호 입력</label>
						<div class="field-icon-wrap">
							<span><input type="text" class="form-control" name="zipcode" id="zipcode"><input type="button" class="test" name="test" value="test"></span>
							
							<input type="button" class="btn btn-secondary" name="btSearch" value="search">
							<span></span>
						</div>
					</div>
					<div class="col-md-12 mb-3 mb-lg-0 col-lg-12">
						<div class="field-icon-wrap">
							<input type="text" class="form-control" name="address1" id="address1" readonly>
						</div>
					</div>
					<div class="col-md-12 mb-3 mb-lg-0 col-lg-12">
						<label for="address2" class="font-weight-bold text-black">상세 주소 입력</label>
						<div class="field-icon-wrap">
							<input type="text" class="form-control" name="address2" id="address2">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-primary" id="bt_address" value="확인">
				</div>
			</div>
		</div>
	</div>

<section class="py-5 bg-light">
      <div class="container">
         <div class="row align-items-center" >
            <div
               class="col-md-12 col-lg-7 mx-auto order-lg-2 position-relative mb-5"
               data-aos="fade-up" style="padding-top:100px;">
               <form name="frmReg" action="<%=t_login?"edit_ok.jsp":"register_ok.jsp" %>">
               		<div id="info">
	               		<div class="row">
	               			<label for="id" class="font-weight-bold text-black">아이디&nbsp</label><span class="warn">아이디를 입력하세요</span>
	               			<input type="text" id="id" class="form-control" name="id" value="<%=t_login?t_id:""%>">
	               			<br>
	               			<br>
	               			<label for="pwd" class="font-weight-bold text-black">비밀번호&nbsp</label><span class="warn">비밀번호를 입력하세요</span>
	               			<input type="password" id="pwd" class="form-control" name="pwd">
	               			<br>
	               			<br>
	               			<label for="password_chk" class="font-weight-bold text-black">비밀번호 확인&nbsp</label><span class="warn">비밀번호를 한번 더 입력하세요</span>
	               			<input type="password" id="pwd_chk" class="form-control" name="pwd_chk">
	               			<br>
	               			<br>
	               			<label for="name" class="font-weight-bold text-black">이름&nbsp</label><span class="warn">이름을 입력하세요</span>
	               			<input type="text" id="name" class="form-control" name="name" value="<%=t_login?t_vo.getName():""%>">
		               		<br>
		               		<br>
		               		<label for="age" class="font-weight-bold text-black">나이&nbsp</label><span class="warn">나이를 입력하세요</span>
		               		<input type="text" id="age" class="form-control" name="age" value="어떻게 할지 고민중" value="<%=t_login?t_vo.getAge():""%>">
		               		<br>
		               		<br>
	               			<label for="address" class="font-weight-bold text-black">주소&nbsp</label><span class="warn">주소를 입력하세요</span>
	               			<input type="text" id="address" class="form-control" name="address" ReadOnly value="asdf" value="<%=t_login?t_vo.getAddress():""%>">
	               			<br>
	               			<br>
	               			<label for="email" class="font-weight-bold text-black">이메일&nbsp</label><span class="warn">이메일을 입력하세요</span>
	               			<input type="text" id="email" class="form-control" name="email" value="<%=t_login?t_vo.getEmail():""%>">
	               			<br>
	               			<br>
	               			<label for="pn" class="font-weight-bold text-black">전화번호&nbsp</label><span class="warn">전화번호를 입력하세요</span>
	               			<input type="text" id="pn" class="form-control" name="pn" value="<%=t_login?t_vo.getPn():""%>">
	               		</div>
               		</div>
               		<hr>
               		<div>
               			<input type="submit" class="btn btn-primary" id="bt_createAccount" value="<%=t_login?"Save Change":"Create Account"%>" style="font-weight:bold">
               		</div>
               	</form>
            </div>
         </div>
      </div>
   </section>

   <footer class="footer">
      <div class="main">
         <div class="link-column">
            <ul class="menu vertical">
               <li class="one"><a href="#" >소개</a></li>
               <li><a href="#">이용방법</a></li>
               <li><a href="#">연락처</a></li>
               <li><a href="#">개인정보 보호정책</a></li>
            </ul>
         </div>
         <div class="link-column">
            <ul class="menu vertical">
               <li class="one"><a href="#" >커뮤니티</a></li>
               <li><a href="#">다양성 및 소속감</a></li>
               <li><a href="#">게스트 추천</a></li>
               <li><a href="#">접근성</a></li>
            </ul>
         </div>
         <div class="link-column">
            <ul class="menu vertical">
               <li class="one"><a href="#" >호스팅하기</a></li>
               <li><a href="#">자료 센터</a></li>
               <li><a href="#">호스트 추천</a></li>
               <li><a href="#">커뮤니티 센터</a></li>
            </ul>
         </div>
         <div class="link-column">
            <ul class="menu vertical">
               <li class="one"><a href="#" >지원</a></li>
               <li><a href="#">도움말 센터</a></li>
               <li><a href="#">예약 취소 옵션</a></li>
               <li><a href="#">신뢰와 안전</a></li>
            </ul>
         </div>
            <hr>
            <p class="copy">Copyright &copy; 2021 WHATNI All Rights Reserved.</p>
      </div>   
   </footer>

   <script src="../js/jquery-3.3.1.min.js"></script>
   <script src="../js/jquery-migrate-3.0.1.min.js"></script>
   <script src="../js/popper.min.js"></script>
   <script src="../js/bootstrap.min.js"></script>
   <script src="../js/owl.carousel.min.js"></script>
   <script src="../js/jquery.stellar.min.js"></script>
   <script src="../js/jquery.fancybox.min.js"></script>
   <script src="../js/jquery.easing.1.3.js"></script>
   <script src="../js/aos.js"></script>
   <script src="../js/bootstrap-datepicker.js"></script>
   <script src="../js/jquery.timepicker.min.js"></script>
   <script src="../js/main.js"></script>
</body>
</html>