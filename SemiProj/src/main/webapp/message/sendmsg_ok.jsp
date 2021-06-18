<%@page import="java.sql.SQLException"%>
<%@page import="bnb.question.model.MessageVO"%>
<%@page import="bnb.question.model.MessageDAO"%>
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
      String content = request.getParameter("content");
      
      try{   
      	MessageDAO dao = new MessageDAO();
      	MessageVO vo = new MessageVO();
      	vo.setContent(content);
      	vo.setName(name);
      	
      	int cnt = dao.insertMsg(vo);
		 
		if(cnt>0){ %>
			<script type="text/javascript">
				alert('문의글이 등록되었습니다.');
				location.href="showmsg.jsp";
			</script>				
	<%	}else{%>
			<script type="text/javascript">
				alert('다시 시도해주세요.');
				history.back();
			</script>				
	<%	}
      }catch(SQLException e){
      		e.printStackTrace();
	  }	
%>
   
</body>
</html>
