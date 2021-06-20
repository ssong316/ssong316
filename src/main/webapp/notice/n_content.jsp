<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.bnb.answer.model.AnswerVO"%>
<%@page import="com.bnb.answer.model.AnswerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js">
CKEDITOR.replace('p_content', 
{height: 500});
</script>    
<%
	String no = request.getParameter("no");

	AnswerDAO dao = new AnswerDAO();
	AnswerVO vo = null;
	
	try{
		vo = dao.selectByNo(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sd = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");

%>    
<div class="start">
	<form name="frmAnswer">
		<fieldset>
			<div class="title">
				<h1>※공지사항※</h1><br>
			</div>
			<br /> <br />
			<div class="form-group">
				<label>제목</label> 
				<input type="text" class="form-control" id="title"
					name="title" value="<%=vo.getTitle() %>" disabled>
			</div>
			<div class="form-group">
				<label>작성자</label> 
				<input type="text" class="form-control" id="name"
					name="name" value="<%=vo.getName()%>" disabled>
			</div>
			<div class="form-group">
				<label>작성일</label> 
				<input type="text" class="form-control" id="regdate"
					name="regdate" value="<%=sd.format(vo.getRegdate())%>" disabled>
			</div>
			<div class="form-group">
    			<label>내용</label>
    			<textarea class="form-control" id="editor4" rows="15"
    				name="answer" disabled><%=vo.getContent() %>
    			</textarea>
    			<script>CKEDITOR.replace('editor4');</script>
  			</div>
		</fieldset>
	</form>
</div>