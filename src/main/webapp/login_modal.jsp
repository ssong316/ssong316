<%@page import="com.SemiProj.acc.model.AccDAO"%>
<%@page import="com.SemiProj.acc.model.AccVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String t_id=(String)session.getAttribute("login_id");
	String t_name=(String)session.getAttribute("name");
	String t_pwd=(String)session.getAttribute("login_pwd");
	AccVO t_vo= new AccVO();
	AccDAO dao = new AccDAO();
	t_vo = dao.selectByUserid(t_id, t_pwd);
	boolean t_login=false;
	if(t_id!=null && !t_id.isEmpty()){ //세션에 값이 있으면
		t_login=true;  //로그인 된 경우
	}
	Cookie[] ckArr = request.getCookies();
	String ck_value ="";
	if(ckArr!=null){
		for(int i=0;i<ckArr.length;i++){
			String name = ckArr[i].getName();
			if(name.equals("ck_userid")){
				ck_value = ckArr[i].getValue();
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="modal fade" id="staticBackdrop" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
		<form name="frmLogin" method="post" action="login/login_ok.jsp">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Login</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="col-md-12 mb-3 mb-lg-0 col-lg-12">
						<label for="id" class="font-weight-bold text-black">ID</label>
						<div class="field-icon-wrap">
							<input type="text" class="form-control" name="login_id" id="id" value="<%=ck_value%>">
							<span></span>
						</div>
						<div>
							&nbsp<span><input type="checkbox" class="text-black" name="rem_id" id="rem_id" value="remember me" <%if(ck_value!=null&&!ck_value.isEmpty()) {%>
            	checked="checked"
            <%} %>></span>
							&nbsp<span>remember me</span>
						</div>
					</div>
					<br>
					<div class="col-md-12 mb-3 mb-lg-0 col-lg-12">
						<label for="pwd" class="font-weight-bold text-black">PASSWORD</label>
						<div class="field-icon-wrap">
							<input type="password" class="form-control" name="login_pwd" id="pwd">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn" name="register" onclick="<%=request.getContextPath()%>/acc/register.jsp" value="Create Account">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<input type="submit" class="btn btn-primary" id="bt_login" value="Login">
				</div>
			</div>
			
		</form>
		</div>
		
	</div>
</body>
</html>