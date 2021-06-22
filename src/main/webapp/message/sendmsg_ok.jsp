<%@page import="java.sql.SQLException"%>
<%@page import="com.bnb.message .model.MessageVO"%>
<%@page import="com.bnb.message.model.MessageDAO"%>
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
      String content = request.getParameter("content");
      int sender = Integer.parseInt(request.getParameter("sender"));
      int receiver = Integer.parseInt(request.getParameter("receiver"));
      
      	MessageDAO dao = new MessageDAO();
      	MessageVO vo = new MessageVO();
      	vo.setContent(content);
      	vo.setReceiver(receiver);
      	vo.setSender(sender);
      	int cnt=0;
      	try{
      	cnt = dao.insertMsg(vo);
      	}catch(SQLException e){
      		e.printStackTrace();
      	}
		if(cnt>0){ %>
			<script type="text/javascript">
				location.href="<%=request.getContextPath()%>/showmsg.jsp?receiver=<%=receiver%>"; 
			</script>				
	<%	}else{%>
			<script type="text/javascript">
				alert('다시 시도해주세요.');
				history.back();
			</script>				
	<%	}
%>
   
</body>
</html>
