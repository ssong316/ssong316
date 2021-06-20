<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="start">
	<form name="frmFeed" method="post" action="f_answer_ok.jsp">
		<fieldset>
			<div class="title">
				<h1>문의글 답변하기</h1><br>
			</div>
			<br /> <br />
			<div class="form-group">
				<label>제목</label> 
				<input type="text" class="form-control" id="title"
					name="title" value="안녕하세요~ WHATNI에서 답변드립니다." disabled>
			</div>
			<div class="form-group">
    			<label>답변내용</label>
    			<textarea class="form-control" id="answer" rows="15"
    				name="answer">
    			</textarea>
  			</div>

			<div class="bt">
				<button type="submit" class="btn btn-info">등록하기</button>
			</div>
		</fieldset>
	</form>
</div>