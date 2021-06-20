<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");	

	String no=request.getParameter("no");
	if(no==null || no.isEmpty()){ %>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href="f_list2.jsp";
		</script>

<%	return;
	}
	
	String step=request.getParameter("step");
	String groupNo=request.getParameter("groupNo");
	
	//2	
	//3	
%>
<div class="modal fade" id="intro" role="dialog"
	aria-labelledby="introHeader" aria-hidden="true" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">삭제하기</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" name="no" value="<%=no%>"> 
				<input type="hidden" name="step" value="<%=step%>"> 
				<input type="hidden" name="groupNo" value="<%=groupNo%>">
				<p>
				작성하신 글을 삭제하시겠습니까?
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal"
					onclick="location.href='f_delete_ok.jsp'">삭제하기</button>
			</div>
		</div>
	</div>
</div>

