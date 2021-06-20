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
<jsp:useBean id="accVo" class="com.SemiProj.acc.model.AccVO" scope="page"></jsp:useBean>
<jsp:useBean id="accService" class="com.SemiProj.acc.model.AccService" scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String address = request.getParameter("address");
	String email = request.getParameter("email");
	String pn = request.getParameter("pn");
	
	accVo.setId(id);
	accVo.setPwd(pwd);
	accVo.setName(name);
	accVo.setAge(Integer.parseInt(age));
	accVo.setAddress(address);
	accVo.setEmail(email);
	accVo.setPn(pn);
	
	String msg="회원등록 실패", url="/acc/register.jsp";
	try{
		int cnt=accService.createNewAcc(accVo);
		if(cnt>0){
			msg="회원가입되었습니다.";
			url="/main.jsp";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
	<jsp:forward page="../common/message.jsp"></jsp:forward>

</body>
</html>