<%@page import="com.bnb.question.model.Utility"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.bnb.question.model.QuestionVO"%>
<%@page import="com.bnb.question.model.QusetionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("no");
	if(no==null || no.isEmpty()){ %>
		<script type="text/javascript">
			alert("잘못된 url입니다.");
			location.href="f_list.jsp";
		</script>
	<%	return;
	}
	
	QusetionDAO dao = new QusetionDAO();
	QuestionVO vo = null;
	
	try{
		
		vo=dao.selectByNo(Integer.parseInt(no));
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	String content = vo.getContent();
	
	if(content !=null && !content.isEmpty()){
		content=content.replace("\r\n", "<br>");
	}else{
		content="";		
	}//
	
	SimpleDateFormat sd = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
	
	String fileInfo = Utility.getFileInfo(vo.getOriginalFileName(), vo.getFileSize());
	
%>
<div class="start">
	<form name="frmFeed" method="post" action="f_answer.jsp">
		<fieldset >
			<div class="title">
				<h1>문의글 확인</h1><br>
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
    			<textarea class="form-control" id="content" rows="6"
    				name="content" disabled><%=vo.getContent()%>
    			</textarea>
  			</div>
  			
			<div class="form-group">
				<label>첨부파일</label> 
				<span>
					<%=fileInfo %>
				</span>
			</div>

			<div class="bt">
				<button type="submit" class="btn btn-info">답변하기</button>
			</div>
		</fieldset>
	</form>
</div>