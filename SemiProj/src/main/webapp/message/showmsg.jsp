<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="bnb.question.model.MessageVO"%>
<%@page import="java.util.List"%>
<%@page import="bnb.question.model.MessageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
.testimonial-block-vertical {
	width: 40%;
	margin: 0 auto;
}

.testimonial-block-vertical-quote {
	background: rgba(23, 121, 186, 0.25);
	padding: 1rem;
	border-radius: 0;
	margin-bottom: 1.875rem;
	position: relative;
}

.testimonial-block-vertical-quote p {
	margin-bottom: 0;
}

.testimonial-block-vertical-quote::after {
	content: '';
	bottom: -1.25rem;
	left: 2.25rem;
	width: 0px;
	height: 0px;
	border-style: solid;
	border-width: 1.25rem 1.125rem 0 1.125rem;
	border-color: rgba(23, 121, 186, 0.25) transparent transparent
		transparent;
	position: absolute;
}

.testimonial-block-vertical-person {
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	margin-left: 1.65rem;
	-webkit-align-items: center;
	-ms-flex-align: center;
	align-items: center;
}

.testimonial-block-vertical-name {
	text-transform: uppercase;
	font-weight: 600;
	margin-bottom: 0;
	margin-left: 0.65rem;
}

.around {
	width: 700px;
	height: 300px;
	margin-top: 70px;
	margin-bottom:50px;
	overflow: auto;
}
</style>
<%
MessageDAO dao = new MessageDAO();
List<MessageVO> list = null;

try {
	list = dao.showMsg();
} catch (SQLException e) {
	e.printStackTrace();
}

SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH시 mm분");
%>
<div style="border-radius: 3em; border: 2px solid gray; width: 720px; margin: 0 auto;">
<input type="hidden" name="name" id="name">
	<h3 style="margin-left: 100px; margin-top: 20px">메시지 확인</h3>
	<div class="around">
		<%if (list == null && list.isEmpty()) {%>
		<div class="testimonial-block-vertical">
			<div class="testimonial-block-vertical-quote">
				<p>데이터가 없습니다.</p>
			</div>
		</div>
		<%} else {%>
		
			<%for (int i = 0; i < list.size(); i++) {
				MessageVO vo = list.get(i);
		%>
		<div class="testimonial-block-vertical">
			<div class="testimonial-block-vertical-quote">
				<p>
					<%=vo.getContent()%>
				</p>
			</div>
			<label> <%=vo.getName()%> <%=sd.format(vo.getRegdate())%></label>
		</div>
			<%} //for%>
		<%} %>
	</div>
	<div style="text-align: center; margin-bottom: 20px;">
	<div class="form-group" style="width: 500px; margin-left: 100px">
		<input type="text" class="form-control" id="content"
			name="content" placeholder="메시지를 입력하세요">
	</div>
		<button type="submit" class="btn btn-info" id="send"
			onclick="location.href='sendmsg_ok.jsp'">전송</button>
	</div>	
</div>