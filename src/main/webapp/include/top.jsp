<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/search.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>


<body>
	<header>
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
									<a class="dropdown-item" href="#">메시지</a> 
									<a class="dropdown-item" href="<%=request.getContextPath()%>/n_list.jsp">알림</a> 
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
	</header>
