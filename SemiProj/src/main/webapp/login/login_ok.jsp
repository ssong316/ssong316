<%@page import="jdk.internal.misc.FileSystemOption"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="bnb.acc.model.AccVO"%>
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
<jsp:useBean id="accService" class="bnb.acc.model.AccService" scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String rem_id = request.getParameter("rem_id");
	System.out.println(id + pwd + rem_id);
	
	String msg="로그인 처리 실패", url="/temp_main.jsp";
	try{
		int result = accService.loginProc(id, pwd);
		
		if(result==accService.LOGIN_OK){
			AccVO accVo = accService.selectByUserid(id, pwd);
			
			session.setAttribute("id", id);
			session.setAttribute("pwd", pwd);
			session.setAttribute("name", accVo.getName());
			session.setAttribute("accVo", accVo);
			
			Cookie ck = new Cookie("ck_userid", id);
			ck.setPath("/");
			if(rem_id!=null){
				ck.setMaxAge(1000*24*60*60); //1000일
				response.addCookie(ck);
			}else{ //체크하지 않은 경우
				ck.setMaxAge(0); //쿠키 삭제
				response.addCookie(ck);
			}
			
			String name = accVo.getName();
			msg=name+"님, 로그인되었습니다";
			//url="temp_main.jsp";
		}else if(result==accService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==accService.ID_NONE){
			msg="해당 아이디는 존재하지 않습니다.";
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