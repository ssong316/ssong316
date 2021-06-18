<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="start">
	<form name="frmFeed" method="post" action="sendmsg_ok.jsp">
		<fieldset>
			<div class="title">
				<h1>질문이 더 있으신가요?</h1><br>
				<h1>호스트에게 메시지를 보내 문의하세요</h1><br>
			</div>
			<hr />
			<div class="form-group">
				<label>작성자</label> 
				<input type="text" class="form-control" id="name"
					name="name" placeholder="이름을 입력하세요">
			</div>
			<div class="form-group">
    			<label>내용</label>
    			<textarea class="form-control" id="content" rows="6"
    				name="content" placeholder="내용을 입력하세요..">
    			</textarea>
  			</div>

			<div class="bt">
				<button type="submit" class="btn btn-info" id="send">메시지 전송하기</button>
			</div>
		</fieldset>
	</form>
</div>
<%-- <%@ include file ="../include/bottom.jsp"%> --%>
