<%@page import="java.sql.SQLException"%>
<%@page import="com.bnb.wishlist.model.wishlistVO"%>
<%@page import="com.bnb.wishlist.model.wishlistDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");	

	String amenityno = request.getParameter("amenityno");
	String name = request.getParameter("wish");
	String accno= (String)session.getAttribute("no");
	
	if(accno==null || accno.isEmpty()){	%>
		<script type="text/javascript">
			alert('로그인 먼저 해주세요');
			location.href="main.jsp";
		</script>
	<%} 
	
	wishlistDAO dao = new wishlistDAO();
	wishlistVO vo = new wishlistVO();
	
	vo.setAmenityno(Integer.parseInt(amenityno));
	vo.setName(name);
	vo.setAccno(Integer.parseInt(accno));
	
	try{
		int cnt = dao.insertWishList(vo);
		
		if(cnt>0){	%>
			<script type="text/javascript">
				alert('위시리스트가 등록되었습니다.');
				location.href="show_wishlist.jsp";
			</script>
	<%	}else{ %>
			<script type="text/javascript">
				alert('등록실패. 다시 시도해주세요.');
				history.back();
			</script>
	<%	}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	

%>
</body>
</html>