<%@page import="java.sql.SQLException"%>
<%@page import="bnb.question.model.AdminqtDAO"%>
<%@page import="bnb.question.model.AdminqtVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

	String no=request.getParameter("no");

	if(no==null || no.isEmpty()){ %>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href="f_list2.jsp";
		</script>
	<%	return;	
	}
	
	AdminqtDAO dao = new AdminqtDAO();
	AdminqtVO vo = null;
	
	try{
		vo = dao.selectByNo(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}//
	
%>
<div class="start">
	<form name="frmFeed" method="post" action="f_reply_ok.jsp">
		<input type="hidden" name="groupNo" value="<%=vo.getGroupNo() %>">
		<input type="hidden" name="step" value="<%=vo.getStep() %>">
		<input type="hidden" name="sortNo" value="<%=vo.getSortNo() %>">
		<fieldset>
			<div class="title">
				<h1>문의글 답변하기</h1><br>
			</div>
			
			<div class="form-group">
				<label>제목</label> 
				<input type="text" class="form-control" id="title"
					name="title">
			</div>
			<div class="form-group">
				<label>작성자</label> 
				<input type="text" class="form-control" id="name"
					name="name">
			</div>
			<div class="form-group">
    			<label>답변내용</label>
    			<textarea class="form-control" id="content" rows="15"
    				name="content">
    			</textarea>
  			</div>

			<div class="bt">
				<button type="submit" class="btn btn-info">등록하기</button>
			</div>
		</fieldset>
	</form>
</div>