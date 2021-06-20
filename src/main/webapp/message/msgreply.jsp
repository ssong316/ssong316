<%@page import="java.sql.SQLException"%>
<%@page import="com.bnb.message.model.MessageVO"%>
<%@page import="com.bnb.message.model.MessageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	String no=request.getParameter("no");
	
	if(no==null || no.isEmpty()){ %>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href="main.jsp";
		</script>
	<%	return;	
	}
	
	MessageDAO dao = new MessageDAO();
	MessageVO vo = null;
	
	try{
		vo = dao.selectByNo(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
%>