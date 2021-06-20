<%@page import="com.bnb.answer.model.AnswerVO"%>
<%@page import="com.bnb.answer.model.AnswerDAO"%>
<%@page import="java.sql.SQLException"%>
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

	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	AnswerDAO dao = new AnswerDAO();
	AnswerVO vo = new AnswerVO();
	
	vo.setTitle(title);
	vo.setName(name);
	vo.setContent(content);
	
	try{
		int cnt = dao.insertAnswer(vo);
		
		if(cnt>0){ %>
		<script type="text/javascript">
			alert('공지사항이 등록되었습니다.');
			location.href="n_list.jsp";
		</script>				
		<%}else{%>
			<script type="text/javascript">
				alert('다시 시도해주세요.');
				history.back();
			</script>				
		<%}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>


