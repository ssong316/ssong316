<%@page import="bnb.question.model.QuestionVO"%>
<%@page import="bnb.question.model.QusetionDAO"%>
<%@page import="bnb.question.model.Utility"%>
<%@page import="java.io.IOException"%>
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
		
		String title=request.getParameter("title");
		String name=request.getParameter("name");
		String content=request.getParameter("content");
	
      try{
    	  
		 QusetionDAO dao = new QusetionDAO();
		 QuestionVO vo = new QuestionVO();
		 
		 vo.setTitle(title);
		 vo.setName(name);
		 vo.setContent(content);
		 
		 int cnt = dao.insertQuestion(vo);
		 
		 if(cnt>0){ %>
			<script type="text/javascript">
				alert('문의글이 등록되었습니다.');
				location.href="list.jsp";
			</script>				
		<%}else{%>
			<script type="text/javascript">
				alert('다시 시도해주세요.');
				history.back();
			</script>				
		<%}
      }catch(IOException e){
         e.printStackTrace();
      }catch(SQLException e){
         e.printStackTrace();
      }
      
   %>
   
</body>
</html>


