<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="com.airbnb.amenity.model.AmenityVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="amenityService" class="com.airbnb.amenity.model.AmenityService" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<style type="text/css">
	
	#map {
	  height: 100%;
	}
	
	/* Optional: Makes the sample page fill the window. */
	html,
	body {
	  height: 100%;
	  margin: 0;
	  padding: 0;
	}
	 a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 

	
	.button-hover-like {
	  border: 2px solid #767676;
	  background: transparent;
	  color: #767676;
	  text-transform: uppercase;
	  overflow: hidden;
	  letter-spacing: 0.07rem;
	  transition: all 0.2s ease-in-out;
	  position: relative;
	}
	
	.button-hover-like span {
	  transition: all 0.2s ease-in-out;
	}
	
	.button-hover-like .fa {
	  position: absolute;
	  font-size: 1.2rem;
	  top: 50%;
	  -webkit-transform: translateY(-50%);
	      -ms-transform: translateY(-50%);
	          transform: translateY(-50%);
	  color: #F15261;
	  right: -20px;
	  transition: 0.4s right cubic-bezier(0.38, 0.6, 0.48, 1);
	}
	
	.button-hover-like:hover {
	  border-color: #1779ba;
	  background: transparent;
	  transition: border-color 0.2s;
	}
	
	.button-hover-like:hover span {
	  margin-right: 20px;
	  color: #1779ba;
	}
	
	.button-hover-like:hover .fa {
	  right: 10px;
	}

	

</style>
</head>
<%@ include file="../inc/top.jsp"%>
<%	

	request.setCharacterEncoding("utf-8");
	
	String checkin=request.getParameter("checkin");
	String checkout=request.getParameter("checkout");
	int children= Integer.parseInt(request.getParameter("children"));
	int adults= Integer.parseInt(request.getParameter("adults"));
	int peopleCnt=children+adults;
	String location=request.getParameter("location");
	
	String[] months = {"January","Febuaray","March","April","May","June","July","August","September","October","November","December"};

	String[] arr = checkin.split(" ");
	 
		
	int cind=Integer.parseInt(arr[0]);
	int ciny=Integer.parseInt(arr[2])-1900;
	int cinm=0;
	for(int i=0;i<12;i++){
		if(arr[1].substring(0,arr[1].length()-1).equals(months[i])){
			cinm=i;
			break;
		}
	}
	
	//화면에 표시할 날짜 string 구하기
	String cindate2 = arr[2]+"년 "+(cinm+1)+"월 "+arr[0]+"일";

	arr = checkout.split(" ");
	
	
	
	int coutd=Integer.parseInt(arr[0]);
	int couty=Integer.parseInt(arr[2])-1900;
	int coutm=0;
	for(int i=0;i<12;i++){
		if(arr[1].substring(0,arr[1].length()-1).equals(months[i])){
			coutm=i;
			break;
		}
	}
	
	//화면에 표시할 날짜 string 구하기 
	String coutdate2 = arr[2]+"년 "+(coutm+1)+"월 "+arr[0]+"일";
	
	Date d = new Date(ciny,cinm,cind);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat df = new DecimalFormat("#,###");
	
	
	String cindate =sdf.format(d);
	
	d = new Date(couty,coutm,coutd);
	sdf = new SimpleDateFormat("yyyy-MM-dd");
	String coutdate =sdf.format(d);
	

	List<AmenityVO> list = null;
	try{
		list = amenityService.searchAmenity(cindate, coutdate, peopleCnt, location);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	%>
	
	<div>
		<section id="list_section">
			<%
				if(list!=null){
					if(list.size()==0){
						%>
							<h1>검색결과가 존재하지 않습니다</h1>
						<%
					}else{%>
							<div id="serach_header">
								<div class="font" style="font-size:17px"><%=list.size() %>개의 숙소들: <%=cindate2%> - <%=coutdate2%></div>
								<h4 class="font" style="font-weight:bold">' <%=location%> ' 지역의 숙소</h3>
							</div>
						<%	
						for(int i=0;i<list.size();i++){
							AmenityVO vo =list.get(i);
							if(i%2==0){
							%>
							<div class="row">
							<%
							}%>
							    <div class="col-6">
							      	<div class="card" style="width: 24rem; border-radius:20px">
									  <div id="carouselExampleIndicators_<%=i%>" class="carousel slide" data-bs-ride="carousel">
										  <div class="carousel-indicators">
										    <button type="button" data-bs-target="#carouselExampleIndicators_<%=i%>" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
										    <button type="button" data-bs-target="#carouselExampleIndicators_<%=i%>" data-bs-slide-to="1" aria-label="Slide 2"></button>
										    <button type="button" data-bs-target="#carouselExampleIndicators_<%=i%>" data-bs-slide-to="2" aria-label="Slide 3"></button>
										  </div>
										  <div class="carousel-inner">
										    <div class="carousel-item active">
										      <img src="images/hotel.jpg" class="amenity_images" style="width:24rem" class="d-block w-100" alt="...">
										    </div>
										    <div class="carousel-item">
										      <img src="images/4.jpeg" class="amenity_images" style="width:24rem" class="d-block w-100" alt="...">
										    </div>
										    <div class="carousel-item">
										      <img src="images/5.jpeg" class="amenity_images" style="width:24rem" class="d-block w-100" alt="...">
										    </div>
										  </div>
										  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators_<%=i%>" data-bs-slide="prev">
										    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Previous</span>
										  </button>
										  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators_<%=i%>" data-bs-slide="next">
										    <span class="carousel-control-next-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Next</span>
										  </button>
									</div>
								 	<div class="card-body">
									    <h6 class="card-title" class="font" style="font-weight:bold"><%=vo.getTitle()%></h6>
									    <p class="card-text">
											<div id="amenity_<%=i%>">
												<div class="font">
													<image src="<%=request.getContextPath() %>/images/grade.png" id="grade_image">
													<span> 4.42</span>
													<span>(후기)</span>
												</div>
												<h6 class="font" style="font-weight:bold">
													₩ <%=df.format(vo.getPrice()) %> 원/ 월
												</h6>
											</div>
									    </p>
									    <button class="button-hover-like button"><span>위시리스트에 담기</span><i class="fa fa-heart"></i></button>
									    <a href="detail.jsp?no=<%=vo.getAmenityNo()%>" class="btn btn-primary">자세히 보기</a>
								  	</div>
								</div>
						    </div>
						   <%
						  if(i%2==1 || i==list.size()-1){
							%>
						  </div>
						  <%}
						  
							}
						}
					}
				
			%>
		</section>
		<section id="map_section">
			<div id="map"></div>
		</section>
	</div>
	<footer>
	
	</footer>	
	<script type="text/javascript">
	let map;
	let contentString;
	let priceString;
	
	function initMap() {
	  map = new google.maps.Map(document.getElementById("map"), {
	    center: { lat: 36.36865649299275, lng: 127.38399073654526 },
	    zoom: 7,
	  });
	  <%if(list!=null){
	  	for(int i=0;i<list.size();i++){
	  		AmenityVO vo =list.get(i);
	  %>
	  const marker_<%=i%> = new google.maps.Marker({
		    position: { lat: <%=vo.getLat()%>, lng: <%=vo.getLng()%> },
		    map,
		    title: "Hello World!",
		    animation: google.maps.Animation.DROP
		  });
	  contentString =
		    '<h1 id="firstHeading" class="firstHeading"><%=vo.getLocation()%></h1>' +
		    '<image src="images/<%=vo.getImage()%>">';
	  priceString=
		  	'<div style="width:60px; height:20px; font-weight:bold">₩ <%=vo.getPrice()%></div>';
		    
	  const infowindow_<%=i%> = new google.maps.InfoWindow({
	    content: contentString,
	  }); 
	  
	  const pricewindow_<%=i%> = new google.maps.InfoWindow({
		    content: priceString,
	  }); 
	  
	  marker_<%=i%>.addListener("click", () => {
		    infowindow_<%=i%>.open(map, marker_<%=i%>);
	  });
	  
	  <%
	  }%>
	  window.onload = function(){
		  <%
		  	for(int i=0;i<list.size();i++){
		  		AmenityVO vo =list.get(i);
		  %>
	  
	  
			 pricewindow_<%=i%>.open(map,marker_<%=i%>); 
		  //가격은 항상 보이게
	<%}}
	%>
	}};
	
	</script>
	<!-- Async script executes immediately and must be after any DOM elements used in callback. -->
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBf4uRUg3aWq9NfgQ2EXWZIOJoaE3zzXu8&callback=initMap&libraries=&v=weekly"
      async
    ></script>
</body>
</html>