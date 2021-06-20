<%@page import="com.bnb.question.model.AdminqtVO"%>
<%@page import="com.bnb.question.model.AdminqtDAO"%>
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

   String no = request.getParameter("no");
   String step = request.getParameter("step");
   String groupNo = request.getParameter("groupNo");
   String pwd = request.getParameter("pwd");
   
	AdminqtDAO dao = new AdminqtDAO();
	AdminqtVO vo = new AdminqtVO();
   
   vo.setNo(Integer.parseInt(no));
   vo.setStep(Integer.parseInt(step));
   vo.setGroupNo(Integer.parseInt(groupNo));
   
   try{
		 dao.deleteQ(vo);
		%>
         <script type="text/javascript">
            alert("삭제가 완료되었습니다.");
            location.href="f_list2.jsp";
         </script>
	<%
   }catch(SQLException e){
      e.printStackTrace();
   }
   
%>
</body>
</html>