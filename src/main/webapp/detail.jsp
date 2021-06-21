<%@page import="com.airbnb.facility.model.FacilityVo"%>
<%@page import="com.airbnb.review.model.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.airbnb.reservation.model.ReservationVO"%>
<%@page import="java.util.List"%>
<%@page import="com.airbnb.amenity.model.AmenityVO"%>
<%@page import="com.airbnb.amenity.model.AmenityDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="amenityService" class="com.airbnb.amenity.model.AmenityService" scope="page"></jsp:useBean>
<jsp:useBean id="reservationService" class="com.airbnb.reservation.model.ReservationService" scope="page"></jsp:useBean>
<jsp:useBean id="reviewService" class="com.airbnb.review.model.ReviewService" scope="page"></jsp:useBean>
<jsp:useBean id="facilityService" class="com.airbnb.facility.model.FacilityService" scope="page"></jsp:useBean>

<%
	AmenityVO vo =new AmenityVO();
	List<ReservationVO> list = null;
	List<ReviewVO> list2 = null;
	FacilityVo vo3 = null;
	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 MM월 dd일");
	int amenityNo = Integer.parseInt(request.getParameter("no"));;
	if(!request.getParameter("no").isEmpty() && request.getParameter("no")!=null){
		
		try{
			vo = amenityService.selectByAmenityNo(amenityNo);
			list = reservationService.selectByAmenityNo(amenityNo);
			list2 = reviewService.selectByAmenityNo(amenityNo);
			vo3= facilityService.selectFacilityByAmenityNo(amenityNo);
		}catch(SQLException e){
			e.printStackTrace();
		}
			
	}
	//평점 구하기(소수아래 둘째자리까지)
	float sum_cleanGrade = 0f;
	float sum_accuracyGrade = 0f;
	float sum_communicationGrade=0f;
	float sum_locationGrade=0f;
	float sum_checkinGrade=0f;
	float sum_satisfactionpriceGrade=0f;
	
	for(ReviewVO vo2 : list2){
		sum_cleanGrade+=vo2.getCleanGrade();
		sum_accuracyGrade+=vo2.getAccuracyGrade();
		sum_communicationGrade+=vo2.getCommunicationGrade();
		sum_locationGrade+=vo2.getLocationGrade();
		sum_checkinGrade+=vo2.getCheckinGrade();
	    sum_satisfactionpriceGrade+=vo2.getSatisfactionpriceGrade();	
	}
	
	float avg_cleanGrade=Math.round((sum_cleanGrade/(float)list2.size())*100f)/100f;
	float avg_accuracyGrade=Math.round((sum_accuracyGrade/(float)list2.size())*100f)/100f;
	float avg_communicationGrade=Math.round((sum_communicationGrade/(float)list2.size())*100f)/100f;
    float avg_locationGrade=Math.round((sum_locationGrade/(float)list2.size())*100f)/100f;
    float avg_checkinGrade=Math.round((sum_checkinGrade/(float)list2.size())*100f)/100f;
    float avg_satisfactionpriceGrade=Math.round((sum_satisfactionpriceGrade/(float)list2.size())*100f)/100f;
    float total_grade=Math.round((avg_cleanGrade+avg_accuracyGrade+avg_communicationGrade+avg_locationGrade+avg_checkinGrade+avg_satisfactionpriceGrade)/6f*100f)/100f;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=vo.getTitle()%></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="<%=request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="css/bootstrap-datepicker.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.3/moment.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/bootstrap-datepicker.ko.js"></script>
<!-- Theme Style -->
<link rel="stylesheet" href="css/style.css">
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script type="text/javascript">

	
	
	
	
	let map;
	let contentString;
	let priceString;
	
	function initMap() {
	  map = new google.maps.Map(document.getElementById("map"), {
	    center: { lat: <%=vo.getLat()%>, lng: <%=vo.getLng()%> },
	    zoom: 15,
	  });
	  new google.maps.Marker({
		    position: { lat: <%=vo.getLat()%>, lng: <%=vo.getLng()%> },
		    map,
		    title: "<%=vo.getTitle()%>",
		    animation: google.maps.Animation.DROP
		  });
	 
	}
	</script>
	<!-- Async script executes immediately and must be after any DOM elements used in callback. -->
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBf4uRUg3aWq9NfgQ2EXWZIOJoaE3zzXu8&callback=initMap&libraries=&v=weekly"
      async
    ></script>
<style type="text/css">
	header {height: 80px;}

	body {
	    width: 61%;
	    margin: 0 auto;
	}
	
	div#title {
	    height: 60%;
	}
	
	header>div:last-child {
	    height: 40%;
	}
	
	.col-6 {
    height: 200px;
	}
	
	#first {
    height: 400px;
	}
	
	#image img {
	    height: 100%;
	    width:100%
	   
	}
	
	#image img:hover{
		opacity: 0.5;
	}
	
	div#first {
    padding-right: 5px;
	}
	
	#first-row > .col-6:first-child {
	    padding: 0px 5px;
	    padding-bottom: 5px;
	}
	
	#first-row > .col-6:last-child {
	    padding: 0px 5px;
	    padding-bottom: 5px;
	}
	
	#second-row > .col-6:first-child {
	    padding: 0px 5px;
	    padding-top: 5px;
	}
	
	#second-row > .col-6:last-child {
	    padding: 0px 5px;
	    padding-top: 5px;
	}
	
	#rightside span{
		text-decoration: underline;
		font-weight:bold;
		font-size:12px;
	}
	
	div#leftside {
    float: left;
	}
	
	div#rightside {
	    float: right;
	}
	
	#rightside > div{
		float:left;
		border-radius:10px;
	}
	
	#rightside > div:hover{
		background:#0000001f;
	}
	
	#rightside > div:first-child{
		margin-right:20px;
	}
	
	.block-32.aos-init.aos-animate {
    width: 600px;
	}
	
	button.btn.btn-primary.btn-block.text-white {
	    width: 200px;
	}
	
	.row {
	    width: 570px;
	}
	#next {
    position: absolute;
    top: 670px;
    right: 0px;
	}
	body{
	height:2000px
	}
	
	div#next {
    width: 350px;
	}
	
    a:link { color: black; text-decoration: none;}
    a:visited { color: black; text-decoration: none;}
    .col-md-6.mb-3.mb-md-0 {
    padding-left: 7px;
	}
	div#showInfo {width: 450px;}
	img#profile_image {
    border-radius: 30px;
	}
	
	div#showInfo {
	    margin-top: 20px;
	}
	
	.col-md-6.col-lg-3.align-self-end {
    width: 100%;
	}
	
	button.btn.btn-info {
	    width: 250px;
	}
	
	button.btn.btn-info {
	    margin-top: 20px;
	}
	
	div#child {
	    margin-left: 2px;
	}

	.modal-content{
	overflow-y: initial !important
	}
	.modal-body{
	height: 500px;
	overflow-y: auto;
	}
</style>
<script type="text/javascript">
function getDatesStartToLast(startDate, lastDate) {
	var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
	if(!(regex.test(startDate) && regex.test(lastDate))) return "Not Date Format";
	var result = [];
	var curDate = new Date(startDate);
	while(curDate <= new Date(lastDate)) {
		result.push(curDate.toISOString().split("T")[0]);
		curDate.setDate(curDate.getDate() + 1);
	}
	return result;
}




$(function(){
	
	$('#showAllReviews').click(function(e){
		e.preventDefault();
		$('#reviewModal').modal("show");
	});
	
	$('.modal-footer>button').click(function(){
		$('#reviewModal').modal("hide");
	});
	
	let res=[];
	let temp;
	<% 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	for(ReservationVO vo2:list){
		String startdate = sdf.format(vo2.getStartdate());
		String enddate = sdf.format(vo2.getEnddate());
		%>
		
	temp=getDatesStartToLast("<%=startdate%>","<%=enddate%>");
	temp.forEach(function(item,index,array){
		res.push(item);
	});
	<%
	}
	
	%>
	$('#wishlist-link').click(function(){
		open('wishlist.jsp?amenityNo='+<%=vo.getAmenityNo()%>,'wishlist','width=400,height=300,left=0,top=0,location=yes,resizable=yes');
	});
	$('#m_date').datepicker({
	      'format': 'm/d/yyyy',
	      'autoclose': true
	    });
	
	//체크인
    $('#checkin_date').datepicker({
    	format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
	    startDate: 'd',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
	    endDate: '+360d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
	    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
	    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
	    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true 
	    //선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
	    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
	    templates : {
	        leftArrow: '&laquo;',
	        rightArrow: '&raquo;'
	    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
	    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
	    title: "날짜 선택",	//캘린더 상단에 보여주는 타이틀
	    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
	    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
	    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일  
	    language : "ko",	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
	    beforeShowDay: function(date) {
	        var sdate = moment(date).format('YYYY-MM-DD');
	        if ($.inArray(sdate, res) === -1) {
	          return {
	            enabled: true
	          }
	        } else {
	          return {
	            enabled: false
	          }
	        }
	      }
    });
    
	//체크아웃 
    $('#checkout_date').datepicker({
    	format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
	    startDate: 'd',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
	    endDate: '+360d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
	    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
	    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
	    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true 
	    //선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
	    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
	    templates : {
	        leftArrow: '&laquo;',
	        rightArrow: '&raquo;'
	    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
	    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
	    title: "날짜 선택",	//캘린더 상단에 보여주는 타이틀
	    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
	    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
	    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
	    language : "ko",	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
	    beforeShowDay: function(date) {
	        var sdate = moment(date).format('YYYY-MM-DD');
	        if ($.inArray(sdate, res) === -1) {
	          return {
	            enabled: true
	          }
	        } else {
	          return {
	            enabled: false
	          }
	        }
	      }
    });
    
    $(window).scroll(function(){
        var position = $(document).scrollTop();
        if(position>=493){
        	$("#next").css('position','fixed' );
        	$("#next").css('top','180px' ).css('right','263px');
        }else{
        	$("#next").css('position','absolute' ).css('top','670px').css('right','0px');
        }
            
	 });
})
	
</script>
</head>
<body>
	<header>
		<div id="title" class="font" style="font-weight:bold; font-size:25px; line-height:2">
			<%=vo.getTitle() %>
		</div>
		<div class="font" style="line-height:2">
			<div id="leftside">
				<img src="<%=request.getContextPath() %>/images/grade2.png" id="grade_image">
				<span style="font-size:12px"> <%=total_grade%></span>
				<a href="#" style="color:gray; font-size:12px;text-decoration: underline;">(후기 <%=list2.size() %> 개)</a>
			</div>
			<div id="rightside">
				<div>
					<a href="#">
						<img src="<%=request.getContextPath() %>/images/share.png">
						<span>공유하기</span>
					</a>
				</div>
				<div>
					<a href="#" id="wishlist-link">
						<img src="<%=request.getContextPath() %>/images/save.png">
						<span>저장</span>
					</a>
				</div>
			</div>
		</div>
	</header>
	<div id="image">
		<div class="row">
			<div class="col-6" id="first">
				<img id="image1" src="<%=request.getContextPath()%>/images/1.jpeg" style="border-radius:10px 0px 0px 10px">
			</div>
			<div class="col-6" >
				<div class="row" id="first-row">
					<div class="col-6">
						<img id="image2" src="<%=request.getContextPath() %>/images/2.jpeg">
					</div>
					<div class="col-6">
						<img id="image3" src="<%=request.getContextPath() %>/images/3.jpeg" style="border-radius:0px 10px 0px 0px">
					</div>
				</div>
				<div class="row" id="second-row">
					<div class="col-6">
						<img id="image4" src="<%=request.getContextPath() %>/images/4.jpeg">
					</div>
					<div class="col-6">
						<img id="image5" src="<%=request.getContextPath() %>/images/5.jpeg" style="border-radius:0px 0px 10px 0px">
					</div>
				</div>
			</div>
		</div>
	</div>
	<section>
	
	</section>
	<div class="container" id="scroll" >  
         <div class="row check-availabilty" id="next">
           <div class="block-32" data-aos="fade-up" data-aos-offset="-200">
           <form action="reservation.jsp?no=<%=amenityNo %>" method="post">
               <div class="row">
                 <div class="col-md-6 mb-3 mb-lg-0 col-lg-6">
                   <label for="checkin_date" class="font-weight-bold text-black">체크 인</label>
                   <div class="field-icon-wrap">
                     <div class="icon"><span class="icon-calendar"></span></div>
                     <input type="text" id="checkin_date" class="form-control" name="checkin">
                   </div>
                 </div>
               </div>
               <div class="row">
                 <div class="col-md-6 mb-3 mb-lg-0 col-lg-6">
                   <label for="checkout_date" class="font-weight-bold text-black" >체크 아웃</label>
                   <div class="field-icon-wrap">
                     <div class="icon"><span class="icon-calendar"></span></div>
                     <input type="text" id="checkout_date" class="form-control" name="checkout">
                   </div>
                 </div>
               </div>
               	 <div class="row" id="adult">
	                 <div class="col-md-6 mb-3 mb-md-0 col-lg-6">
	                     <div class="col-md-6 mb-3 mb-md-0">
	                       <label for="adults" class="font-weight-bold text-black">성인</label>
	                       <div class="field-icon-wrap">
	                         <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                         <select name="adults" id="adults" class="form-control">
	                           <option value="1">1</option>
	                           <option value="2">2</option>
	                           <option value="3">3</option>
	                           <option value="4">4+</option>
	                         </select>
	                       </div>
	                     </div>
	                 </div>
	                </div>
                 <div class="row" id="child">
                     <div class="col-md-6 mb-3 mb-md-0 col-lg-6">
                       <label for="children" class="font-weight-bold text-black">어린이</label>
                       <div class="field-icon-wrap">
                         <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                         <select name="children" id="children" class="form-control">
                           <option value="1">1</option>
                           <option value="2">2</option>
                           <option value="3">3</option>
                           <option value="4">4+</option>
                         </select>
                       </div>
                     </div>
                 </div>
                 <div class="col-md-6 col-lg-3 align-self-end">
                   <button type="submit" class="btn btn-info">예약하기</button>
                 </div>
                 
             </form>
           </div>


         </div>
    </div>
    </div>
    <div id="showInfo">
    	<div style="padding:10px 0px; border-bottom:1px solid gray">
    		<div style="font-weight:bold; font-size:20px;height:50px;line-height: 2" class="font"><%=vo.getHostno() %>님이 호스팅하는 숙박 전체
    			<img id="profile_image" src="images/profile_image.png" style="height:100%; width:50px;float:right">
    		</div>
    		<div>최대 인원 6명·침실 <%=vo3.getBedroomCount() %>개·침대<%=vo3.getBedCount() %>개·욕실<%=vo3.getBathroomCount() %>개·주방<%=vo3.getKitchen() %>개</div>
    	</div>
    	<div>
    		
    	</div>
  		<div style="padding:30px 0px; border-bottom:1px solid gray">
    		<%=vo.getContent() %>
    	</div>
    	<div style="padding:10px 0px; border-bottom:1px solid gray">
    		<div style="font-weight:bold; font-size:20px;height:50px;" class="font">숙소 편의시설
    		</div>
    		<div style="height:130px"> <!-- 편의시설 개수에 따라 높이 변경하도록 하기 -->
    			<%if(vo3.getAirconditioner()>0){ %>
    			<div style="float:left; width:48%;padding:1px 0px;"><img src="images/facilities/airconditioner.png"><span> 에어컨</span></div>
    			<%}if(vo3.getAnimal()>0){ %>
    			<div style="float:left; width:48%;padding:1px 0px;"><img src="images/facilities/animal.png"><span> 반려동물 입실 가능</span></div>
    			<%}if(vo3.getWifi()>0){ %>
    			<div style="float:left; width:48%;padding:1px 0px;"><img src="images/facilities/wifi.png"><span> 무선 인터넷</span></div>
    			<%}if(vo3.getKitchen()>0){%>
    			<div style="float:left; width:48%;padding:1px 0px;"><img src="images/facilities/dinner.png"><span> 주방</span></div>
    			<%}if(vo3.getHairdryer()>0){ %>
    			<div style="float:left; width:48%;padding:1px 0px;"><img src="images/facilities/hairdryer.png"><span> 헤어 드라이어</span></div>
    			<%} %>
    			<div style="float:left; width:48%;padding:1px 0px;"><img src="images/facilities/laundry.png"><span> 세탁기</span></div>
    			<%if(vo3.getParking()>0){ %>
    			<div style="float:left; width:48%;padding:1px 0px;"><img src="images/facilities/parking.png"><span> 도로 주차 (무료)</span></div>
    			<%}if(vo3.getTv()>0){ %>
    			<div style="float:left; width:48%;padding:1px 0px;"><img src="images/facilities/tv.png"><span> TV + 일반 케이블 TV</span></div>
    			<%} %>
    		</div>
    		
    	</div>
    	<div style="height:600px;padding:10px 0px; border-bottom:1px solid gray">
    		<div style="font-weight:bold; font-size:20px;height:50px;" class="font">호스팅 지역
    		</div>
    		<div id="map" style="height:500px">
    		</div>
    	</div>
    	<div style="padding:10px 0px;border-bottom:1px solid gray">
    		<div style="font-weight:bold; font-size:20px;height:50px;" class="font"><img src="images/biggrade.png"> <%=total_grade%> · 후기 <%=list2.size()%>개
    		</div>
    		<div style="height:80px;margin-top:5px"> 
    			<div style="float:left; width:100%;padding:3px 0px;">청결도
	    			<div style="float:right;width:5%;margin-left:10px;margin-bottom:5px"><%=avg_cleanGrade %></div>
	    			<div class="progress" style="float:right;width:50%">
					  <div class="progress-bar" role="progressbar" aria-valuenow="<%=Math.floor(avg_cleanGrade/5.0f*100f) %>"
					  aria-valuemin="0" aria-valuemax="100" style="width:<%=Math.floor(avg_cleanGrade/5.0f*100f) %>%">
					    <span class="sr-only">70% Complete</span>
					  </div>
					</div>
					
				</div>
    			<div style="float:left; width:100%;padding:3px 0px;">정확성
    			<div style="float:right;width:5%;margin-left:10px;margin-bottom:5px"><%=avg_accuracyGrade %></div>
	    			<div class="progress" style="float:right;width:50%">
					  <div class="progress-bar" role="progressbar" aria-valuenow="<%=Math.floor(avg_accuracyGrade/5.0f*100f) %>"
					  aria-valuemin="0" aria-valuemax="100" style="width:<%=Math.floor(avg_accuracyGrade/5.0f*100f) %>%">
					    <span class="sr-only">70% Complete</span>
					  </div>
					</div>
				</div>
    			<div style="float:left; width:100%;padding:3px 0px;">의사소통
    			<div style="float:right;width:5%;margin-left:10px;margin-bottom:5px"><%=avg_communicationGrade %></div>
	    			<div class="progress" style="float:right;width:50%">
					  <div class="progress-bar" role="progressbar" aria-valuenow="<%=Math.floor(avg_communicationGrade/5.0f*100f) %>"
					  aria-valuemin="0" aria-valuemax="100" style="width:<%=Math.floor(avg_communicationGrade/5.0f*100f) %>%">
					    <span class="sr-only">70% Complete</span>
					  </div>
					</div>
    			</div>
    			<div style="float:left; width:100%;padding:3px 0px;">위치
    			<div style="float:right;width:5%;margin-left:10px;margin-bottom:5px"><%=avg_locationGrade %></div>
	    			<div class="progress" style="float:right;width:50%">
					  <div class="progress-bar" role="progressbar" aria-valuenow=<%=Math.floor(avg_locationGrade/5.0f*100f) %>
					  aria-valuemin="0" aria-valuemax="100" style="width:<%=Math.floor(avg_locationGrade/5.0f*100f) %>%">
					    <span class="sr-only">70% Complete</span>
					  </div>
					</div>
    			</div>
    			<div style="float:left; width:100%;padding:3px 0px;">체크인
    			<div style="float:right;width:5%;margin-left:10px;margin-bottom:5px"><%=avg_checkinGrade %></div>
	    			<div class="progress" style="float:right;width:50%">
					  <div class="progress-bar" role="progressbar" aria-valuenow="<%=Math.floor(avg_checkinGrade/5.0f*100f) %>"
					  aria-valuemin="0" aria-valuemax="100" style="width:<%=Math.floor(avg_checkinGrade/5.0f*100f) %>%">
					    <span class="sr-only">70% Complete</span>
					  </div>
					</div>
    			</div>
    			<div style="float:left; width:100%;padding:3px 0px;">가격대비 만족도
    				<div style="float:right;width:5%;margin-left:10px;margin-bottom:5px"><%=avg_satisfactionpriceGrade %></div>
	    			<div class="progress" style="float:right;width:50%">
					  <div class="progress-bar" role="progressbar" aria-valuenow="<%=Math.floor(avg_satisfactionpriceGrade/5.0f*100f) %>"
					  aria-valuemin="0" aria-valuemax="100" style="width:<%=Math.floor(avg_satisfactionpriceGrade/5.0f*100f) %>%">
					    <span class="sr-only">70% Complete</span>
					  </div>
					</div>
    			</div>
    		</div>
    		<div>
    			<%
    				if(list2.size()==0){%>
    					등록된 후기가 없습니다.
    				<%}else{
    				for(int i=0;i<5;i++){
    					if(list2.size()==i){
    						break;
    					}
    					ReviewVO vo2=list2.get(i);
    					%>
    					<span>
    						<img src="images/profiles/<%=vo2.getUserid()%>.jpeg" style="width:50px; height:50px; border-radius:25px;">
    					</span>
    					<span>
				    		<span style="font-weight:bold;margin-left:20px; font-size:15px"><%=vo2.getUsername() %> 님의 후기
				    		</span>
				    		<div style="font-size:12px; color:gray"><%=sdf2.format(vo2.getRegdate())%>
				    		</div>
	    				</span>
			    		<div style="margin-bottom:20px"><%=vo2.getContent() %>
			    		</div>
    					<%
    				}
    				%>
    				<div id="showAllReviews" class="btn btn-primary" style="margin:10px 10px">후기 <%=list2.size() %>개 모두 보기
			    	</div>
			    	<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel"><%=list2.size() %>개의 후기</h5>
									<button class="close" type="button" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">X</span>
									</button>
								</div>
								<div class="modal-body">
								<%
								for(int i=0;i<list2.size();i++){
			    					ReviewVO vo2=list2.get(i);
			    					%>
			    					<span>
			    						<img src="images/profiles/<%=vo2.getUserid()%>.jpeg" style="width:50px; height:50px; border-radius:25px;">
			    					</span>
			    					<span>
							    		<span style="font-weight:bold;margin-left:20px; font-size:15px"><%=vo2.getUsername() %> 님의 후기
							    		</span>
							    		<div style="font-size:12px; color:gray"><%=sdf2.format(vo2.getRegdate())%>
							    		</div>
				    				</span>
						    		<div style="margin-bottom:20px"><%=vo2.getContent() %>
						    		</div>
								<%} %>
								</div>
								<div class="modal-footer">
									<button class="btn" type="button" data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
			    	<%
    				}
    			%>
	    		
    		</div>
    	</div>
    	<div style="height:600px;padding:10px 0px;border-bottom:1px solid gray">
    		
    	</div>
    </div>
	
	
</body>
</html>