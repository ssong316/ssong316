<%@page import="com.SemiProj.acc.model.AccService"%>
<%@page import="com.SemiProj.acc.model.AccVO"%>
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
<jsp:useBean id="accService" class="com.SemiProj.acc.model.AccService" scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String login_id = request.getParameter("login_id");
	String login_pwd = request.getParameter("login_pwd");
	String rem_id = request.getParameter("rem_id");
	
	String msg="로그인 처리 실패", url="/main.jsp";
	try{
		int result = accService.loginProc(login_id, login_pwd);
		
		if(result==AccService.LOGIN_OK){
			AccVO accVo = accService.selectByUserid(login_id, login_pwd);
			
			session.setAttribute("login_id", login_id);
			session.setAttribute("no",Integer.toString(accVo.getAccNo()));
			session.setAttribute("login_pwd", login_pwd);
			session.setAttribute("name", accVo.getName());
			session.setAttribute("accVo", accVo);
			boolean isAdmin = login_id.equals("admin")?true:false;
			session.setAttribute("isAdmin", isAdmin);
			
			Cookie ck = new Cookie("ck_userid", login_id);
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
		}else if(result==AccService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==AccService.ID_NONE){
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