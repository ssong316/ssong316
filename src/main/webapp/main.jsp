<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String t_id=(String)session.getAttribute("login_id");
	String t_name=(String)session.getAttribute("name");
	boolean t_login=false;
	if(t_id!=null && !t_id.isEmpty()){ //세션에 값이 있으면
		t_login=true;  //로그인 된 경우
	}
	Cookie[] ckArr = request.getCookies();
	String ck_value ="";
	if(ckArr!=null){
		for(int i=0;i<ckArr.length;i++){
			String name = ckArr[i].getName();
			if(name.equals("ck_userid")){
				ck_value = ckArr[i].getValue();
				break;
			}
		}
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
<style type="text/css">

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
<%
	
%>

<body>
<!-- Theme Style -->
</head>
<body data-spy="scroll" data-target="#templateux-navbar"
	data-offset="200">

	<nav
		class="navbar navbar-expand-lg navbar-dark pb_navbar pb_scrolled-light"
		id="templateux-navbar">
		<div class="container">
			<a class="navbar-brand" href="main.jsp"><span
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
						href="f_list2.jsp">Help</a></li>
				<%if(!t_login){ %>
					<li class="nav-item cta-btn ml-xl-2 ml-lg-2 ml-md-0 ml-sm-0 ml-0">
					<a class="nav-link" href="#" target="_blank" data-toggle="modal"
						data-target="#staticBackdrop">
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
									<a class="dropdown-item" href="#">메시지</a> 
									<a class="dropdown-item" href="<%=request.getContextPath()%>/n_list.jsp">알림</a> 
									<a class="dropdown-item" href="#">여행</a> 
									<a class="dropdown-item" href="">위시리스트</a>
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
		style="background-image: url(<%=request.getContextPath()%>/images/back.jpg)"
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
	
	<section class="section bg-light pb-0">
      <div class="container">

         <div class="row check-availabilty" id="next">
            <div class="block-32" data-aos="fade-up" data-aos-offset="-200">

               <form action="search.jsp" method="post">
                  <div class="row">
                     <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                        <label for="checkin_date" class="font-weight-bold text-black">Check
                           In</label>
                        <div class="field-icon-wrap">
                           <div class="icon">
                              <span class="icon-calendar"></span>
                           </div>
                           <input type="text" id="checkin_date" class="form-control" name="checkin">
                        </div>
                     </div>
                     <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                        <label for="checkout_date" class="font-weight-bold text-black">Check
                           Out</label>
                        <div class="field-icon-wrap">
                           <div class="icon">
                              <span class="icon-calendar"></span>
                           </div>
                           <input type="text" id="checkout_date" class="form-control" name="checkout">
                        </div>
                     </div>
                     <div class="col-md-6 mb-3 mb-md-0 col-lg-3">
                        <div class="row">
                           <div class="col-md-6 mb-3 mb-md-0">
                              <label for="adults" class="font-weight-bold text-black">Adults</label>
                              <div class="field-icon-wrap">
                                 <div class="icon">
                                    <span class="ion-ios-arrow-down"></span>
                                 </div>
                                 <select name="adults" id="adults" class="form-control">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4+</option>
                                 </select>
                              </div>
                           </div>
                           <div class="col-md-6 mb-3 mb-md-0">
                              <label for="children" class="font-weight-bold text-black">Children</label>
                              <div class="field-icon-wrap">
                                 <div class="icon">
                                    <span class="ion-ios-arrow-down"></span>
                                 </div>
                                 <select name="children" id="children" class="form-control">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4+</option>
                                 </select>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6 mb-3 mb-md-0 col-lg-3">
                        <div class="row">
                           <div class="col-md-6 mb-3 mb-md-0">
                              <label for="adults" class="font-weight-bold text-black">지역</label>
                              <div class="field-icon-wrap">
                                 <div class="icon">
                                    <span class="ion-ios-arrow-down"></span>
                                 </div>
                                 <select name="location" id="city" class="form-control">
                                    <option value="서울">서울</option>
                                    <option value="경기">경기</option>
                                    <option value="인천">인천</option>
                                    <option value="제주">제주</option>
                                 </select> 
                              </div>
                           </div>
                           <div class="col-md-6 mb-3 mb-md-0">
                              <label for="children" class="font-weight-bold text-black"></label>
                              <div class="field-icon-wrap">
                              <input type="submit" class="btn btn-primary" value="검색"></input>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </section>
   
    <section class="py-5 bg-light" id="section-about">
      <div class="container">
         <div class="row align-items-center">
            <div
               class="col-md-12 col-lg-7 ml-auto order-lg-2 position-relative mb-5"
               data-aos="fade-up">
               <img src="images/154.jpg" alt="Image" class="img-fluid rounded">
            </div>
         </div>
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
					<input type="button" class="btn" name="register" onclick="acc/register.jsp" value="Create Account">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<input type="submit" class="btn btn-primary" id="bt_login" value="Login">
				</div>
			</div>
			
		</form>
		</div>
		
	</div>
<%@ include file="include/bottom.jsp"%>