<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%-- <%@ include file ="../include/top.jsp"%>
 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js">
$(function(){
	$('form[name=frmFeed]').submit(function(){
		$('.form-control').each(function(idx, item){
			if($(this).val().length<1){
				alert($(this).prev().text()+"을(를) 입력하세요");
				$(item).focus();
				event.preventDefault();
				return false;
			}
		});
	});
});

CKEDITOR.replace('p_content', 
		{height: 700});
</script>
<div class="start">
	<form name="frmFeed" method="post" action="notice_ok.jsp">
		<fieldset>
			<div class="title">
				<h1>공지사항</h1><br>
			</div>
			
			<br /> <br />
			<div class="form-group">
				<label>제목</label> 
				<input type="text" class="form-control" id="title"
					name="title" placeholder="제목을 입력하세요">
			</div>
			<div class="form-group">
				<label>작성자</label> 
				<input type="text" class="form-control" id="name" name="name"
					placeholder="(관리자)" >
			</div>
			
			<div class="form-group">
    			<label>내용</label>
    			<textarea class="form-control" id="editor4" rows="6"
    				name="content">
    			</textarea>
    			<script>CKEDITOR.replace('editor4');</script>
  			</div>

			<div class="bt">
				<button type="submit" class="btn btn-info" id="send">등록하기</button>
				<button type="button" class="btn btn-danger"
					onclick="location.href='n_list.jsp'">취소하기</button>
			</div>
		</fieldset>
	</form>
</div>
<%-- <%@ include file ="../include/bottom.jsp"%> --%>
