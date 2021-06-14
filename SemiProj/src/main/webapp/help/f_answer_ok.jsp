<%@page import="bnb.answer.model.AnswerVO"%>
<%@page import="bnb.answer.model.AnswerDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Timestamp"%>
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

		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String content = request.getParameter("content"); 
		
		try{	
			AnswerDAO dao = new AnswerDAO();
			AnswerVO vo = new AnswerVO();
			
			vo.setName(name);
			vo.setTitle(title);
			vo.setContent(content);
			
			int cnt = dao.insertAnswer(vo);
			
			if(cnt>0){	%>
				<script type="text/javascript">
					alert('답변을 완료하였습니다.');
					location.href="f_list.jsp";
				</script>
		<% 	}else{%>
				<script type="text/javascript">
					alert('등록실패. 다시 한번 확인해주세요.');
					history.back();
				</script>
		<% 	}	
		}catch(SQLException e){
			e.printStackTrace();
		}
%>
   
</body>
</html>