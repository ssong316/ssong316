<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.airbnb.reservation.model.ReservationVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 여행</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></script>
<script src="<%=request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<style type="text/css">
	body {
    margin: 0;
    font-family: Roboto, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    font-size: .8125rem;
    font-weight: 400;
    line-height: 1.5385;
    color: #333;
    text-align: left;
    background-color: #f5f5f5
}

.mt-50 {
    margin-top: 50px
}

.mb-50 {
    margin-bottom: 50px
}

.bg-teal-400 {
    background-color: #26a69a
}

a {
    text-decoration: none !important
}

.fa {
    color: red
}
</style>
<jsp:useBean id="reservationService" class="com.airbnb.reservation.model.ReservationService" scope="page"></jsp:useBean>
<%
	int userNo = Integer.parseInt((String)session.getAttribute("no"));
	List<ReservationVO> list =null;
	try{
		list = reservationService.selectMyReservation(userNo);
	}catch(SQLException e){
		e.printStackTrace();
	}
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat df = new DecimalFormat("#,###");
%>
</head>
<%@ include file="../inc/top.jsp"%>
<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">예정된 예약</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">이전 예약</button>
  </li>
</ul>
<div class="tab-content" id="pills-tabContent">
  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
  	<div class="container d-flex justify-content-center mt-50 mb-50">
    <div class="row">
        <div class="col-md-10">
        <%if(list.size()>0){
        	for(int i=0;i<list.size();i++){
        	Date today =new Date();
        	ReservationVO vo =list.get(i);
        	if(vo.getEnddate().getTime()-today.getTime()>0){
        	%>
            <div class="card card-body mt-3">
                <div class="media align-items-center align-items-lg-start text-center text-lg-left flex-column flex-lg-row">
                    <div class="mr-2 mb-3 mb-lg-0"> <img src="images/<%=vo.getImage() %>" width="150" height="150" alt=""> </div>
                    <div class="media-body">
                        <h6 class="media-title font-weight-semibold"> <a href="#" data-abc="true"><%=vo.getTitle() %></a> </h6>
                        <ul class="list-inline list-inline-dotted mb-3 mb-lg-2">
                            <li class="list-inline-item"><a href="#" class="text-muted" data-abc="true"><%=vo.getLocation() %></a></li>
                            <li class="list-inline-item"><a href="#" class="text-muted" data-abc="true">성인 : <%=vo.getAdultCount() %>명</a></li>
                            <li class="list-inline-item"><a href="#" class="text-muted" data-abc="true">어린이 : <%=vo.getChildCount() %>명</a></li>
                        </ul>
                        <p class="mb-3"><%=vo.getContent() %></p>
                        <ul class="list-inline list-inline-dotted mb-0">
                            <li class="list-inline-item">체크인: <%=sdf.format(vo.getStartdate()) %> / 체크아웃: <%=sdf.format(vo.getEnddate()) %>

                        </ul>
                    </div>
                    <div class="mt-3 mt-lg-0 ml-lg-3 text-center">
                        <h3 class="mb-0 font-weight-semibold" style="text-decoration: underline;">₩ <%=df.format(vo.getPayment()) %></h3>
                        <div> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div>
                        <div class="text-muted">2349 reviews</div> <button type="button" class="btn btn-warning mt-4 text-white"><i class="icon-cart-add mr-2"></i> 호스트에게 문의하기 </button>
                    </div>
                </div>
            </div>
            <%}}}else{ %>
            	예정된 예약 정보가 없습니다.
            <%}%>
        </div>
    </div>
</div>
  </div>
  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
  	<div class="container d-flex justify-content-center mt-50 mb-50">
    <div class="row">
        <div class="col-md-10">
        <%if(list.size()>0){
        	for(int i=0;i<list.size();i++){
        	Date today =new Date();
        	ReservationVO vo =list.get(i);
        	if(vo.getEnddate().getTime()-today.getTime()<=0){
        	%>
            <div class="card card-body mt-3">
                <div class="media align-items-center align-items-lg-start text-center text-lg-left flex-column flex-lg-row">
                    <div class="mr-2 mb-3 mb-lg-0"> <img src="images/<%=vo.getImage() %>" width="150" height="150" alt=""> </div>
                    <div class="media-body">
                        <h6 class="media-title font-weight-semibold"> <a href="#" data-abc="true"><%=vo.getTitle() %></a> </h6>
                        <ul class="list-inline list-inline-dotted mb-3 mb-lg-2">
                            <li class="list-inline-item"><a href="#" class="text-muted" data-abc="true"><%=vo.getLocation() %></a></li>
                            <li class="list-inline-item"><a href="#" class="text-muted" data-abc="true">성인 : <%=vo.getAdultCount() %>명</a></li>
                            <li class="list-inline-item"><a href="#" class="text-muted" data-abc="true">어린이 : <%=vo.getChildCount() %>명</a></li>
                        </ul>
                        <p class="mb-3"><%=vo.getContent() %></p>
                        <ul class="list-inline list-inline-dotted mb-0">
                            <li class="list-inline-item" style="color:red;">체크인: <%=sdf.format(vo.getStartdate()) %> / 체크아웃: <%=sdf.format(vo.getEnddate()) %>

                        </ul>
                    </div>
                    <div class="mt-3 mt-lg-0 ml-lg-3 text-center">
                        <h3 class="mb-0 font-weight-semibold" style="text-decoration: underline;">₩ <%=df.format(vo.getPayment()) %></h3>
                        <div> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div>
                        <div class="text-muted">2349 reviews</div> <button type="button" class="btn btn-warning mt-4 text-white"><i class="icon-cart-add mr-2"></i> 후기쓰러 가기 </button>
                    </div>
                </div>
            </div>
            <%}}}else{ %>
            	이전 예약 정보가 없습니다.
            <%}%>
        </div>
    </div>
</div>
  </div>
</div>
</body>
</html>