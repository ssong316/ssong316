<%@page import="java.sql.SQLException"%>
<%@page import="com.airbnb.reservation.model.ReservationVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="reservationService" class="com.airbnb.reservation.model.ReservationService" scope="page"></jsp:useBean>
<%
	int adultCount=Integer.parseInt(request.getParameter("adults"));
	int childCount=Integer.parseInt(request.getParameter("children"));
	int userNo = Integer.parseInt(request.getParameter("userno"));
	int amenityNo=Integer.parseInt(request.getParameter("amenityno"));
	int payment=Integer.parseInt(request.getParameter("payment"));
	String s_startdate = request.getParameter("checkin");
	String s_enddate=request.getParameter("checkout");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date date = sdf.parse(s_startdate);
    Timestamp startdate = new Timestamp(date.getTime());
    date = sdf.parse(s_enddate);
    Timestamp enddate = new Timestamp(date.getTime());
    
    ReservationVO vo =new ReservationVO();
    vo.setAdultCount(adultCount);
    vo.setChildCount(childCount);
    vo.setUserNo(userNo);
    vo.setAmenityNo(amenityNo);
    vo.setPayment(payment);
    vo.setStartdate(startdate);
    vo.setEnddate(enddate);
    String msg="결제 실패하였습니다 ! ";
    String url="/detail.jsp?no="+amenityNo;
    int cnt=0;
    try{
    	cnt = reservationService.insertReservation(vo);
    }catch(SQLException e){
    	e.printStackTrace();
    	
    }
    if(cnt>0){
    	msg="결제 성공하였습니다 ! ";
    	url="/finish.jsp?no="+amenityNo;
    }
    request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="common/message.jsp"></jsp:forward>
<body>
	
</body>
</html>