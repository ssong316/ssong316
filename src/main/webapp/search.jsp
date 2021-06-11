<%@page import="java.sql.Date"%>
<%@page import="com.mystudy.amenity.model.AmenityVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="amenityService" class="com.mystudy.amenity.model.AmenityService" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
</head>
<body>
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
	
	Date d = new Date(ciny,cinm,cind);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
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
	if(list!=null){
		if(list.size()==0){
			%>
				<h1>검색결과x</h1>
			<%
		}else{
			for(int i=0;i<list.size();i++){
				AmenityVO vo =list.get(i);
				%>
					<h2><%=vo.getContent()%></h2>
				
				<%
			}
		}
	}
	
%>
</body>
</html>