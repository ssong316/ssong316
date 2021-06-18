<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%-- <%@ include file ="../include/top.jsp"%>
 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
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
</script>
<div class="start">
	<form name="frmFeed" method="post" action="adfeedback_ok.jsp"
		ENCTYPE="multipart/form-data">
		<fieldset>
			<div class="title">
				<h1>WHATNI이용에 대한 문의를 위한 공간입니다!</h1><br>
			</div>
			<div class="feed_1">
				<div class="feed_2">
					WHATNI는 언제나 회원님들의 다양한 의견을 반영해 더 나은 서비스 이용 경험을 제공하고자 노력하고 있습니다.<br />
					<strong>이 페이지에서의 답변이 늦어질 수 있습니다.</strong> <br /> 빠른 해결이 필요하신 경우 <strong>도움말
						센터</strong>를 참조해주세요.
				</div>
			</div>
			<br /> <br />
			<div class="form-group">
				<label>제목</label> 
				<input type="text" class="form-control" id="title"
					name="title" placeholder="제목을 입력하세요">
			</div>
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

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroupFileAddon01">업로드</span>
				</div>
				<div class="custom-file">
					<input type="file" class="custom-file-input" id="upfile" name="upfile">
					 <label class="custom-file-label" for="upfile"> 
					 파일을 선택하세요</label>
				</div>
			</div>
			<div class="bt">
				<button type="submit" class="btn btn-info" id="send">보내기</button>
				<button type="button" class="btn btn-danger"
					onclick="location.href='f_list2.jsp'">취소하기</button>
			</div>
		</fieldset>
	</form>
</div>
<%-- <%@ include file ="../include/bottom.jsp"%> --%>
