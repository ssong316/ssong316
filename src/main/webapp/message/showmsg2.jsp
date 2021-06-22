<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.bnb.message.model.MessageVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bnb.message.model.MessageDAO"%>
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
int no=Integer.parseInt((String)session.getAttribute("no"));
String myname =(String)session.getAttribute("name");
String userid=(String)session.getAttribute("login_id");
try {
	list = dao.showMsgByNo(no);
} catch (SQLException e) {
	e.printStackTrace();
}

SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH시 mm분");
%>
<div style="border-radius: 3em; border: 2px solid gray; width: 720px; margin: 0 auto;">
	<h3 style="margin-left: 100px; margin-top: 20px">메시지 확인</h3>
	<div class="around">
		<%if (list == null && list.isEmpty()) {%>
		<div class="testimonial-block-vertical">
			<div class="testimonial-block-vertical-quote">
				<p>메시지 기록이 없습니다.</p>
			</div>
		</div>
		<%} else {%>
		
			<%for (int i = 0; i < list.size(); i++) {
				MessageVO vo = list.get(i);
				if(no==vo.getSender()){
				
		%>
		<div class="testimonial-block-vertical" style="margin-left:30px;float:left;width:100%">
			<div class="testimonial-block-vertical-quote" style="width:50%;border-radius:10px" >
				<p>
					<%=vo.getContent()%>
				</p>
			</div>
			<img src="<%=request.getContextPath() %>/images/profiles/<%=userid %>.jpeg" style="width:40px; height:40px; border-radius:20px;">
			<label style="font-weight:bold;font-size:17px"><%=myname%> (나)</label> <span style="color:gray; font-size:12px"><%=sd.format(vo.getRegdate())%></span>
		</div>
			<%}else{
				%>
		<div class="testimonial-block-vertical" style="margin-right:30px;float:right;width:90%">
			<div class="testimonial-block-vertical-quote" style="width:50%;border-radius:10px;float:right" >
				<p>
					<%=vo.getContent()%>
				</p>
			</div>
			<div style="float:right;width:51%">
				<img src="<%=request.getContextPath() %>/images/profiles/<%=vo.getSenderId() %>.jpeg" style="width:40px;height:40px; border-radius:20px;">
				<label style="font-weight:bold;font-size:17px"><%=vo.getSenderName()%> (상대)</label> <span style="color:gray; font-size:12px"><%=sd.format(vo.getRegdate())%></span>
			</div>
		</div>		
				
				<%
			}
		} //for%>
		<%} 
		%>
	</div>
	<div style="text-align: center; margin-bottom: 20px;">
	<div class="form-group" style="width: 500px; margin-left: 100px">
		<input type="text" class="form-control" id="name"
			name="name" placeholder="메시지를 입력하세요">
	</div>
		<button type="submit" class="btn btn-info" id="send"
			onclick="location.href='sendmsg_ok.jsp'">전송</button>
	</div>	
</div>