<%@page import="bnb.answer.model.AnswerVO"%>
<%@page import="bnb.answer.model.AnswerDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
.a_list, .a_page {
	width: 70%;
	margin: 0 auto;
}

.a_page a, .a_list a {
	color: #1b52aa;
}
</style>
<%
	AnswerDAO dao = new AnswerDAO();
	List<AnswerVO> list = null;
		
	try{
		list=dao.showAll();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	
	
	//페이징 처리
	int currentPage=1;  //현재 페이지
	
	if(request.getParameter("currentPage") !=null ){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int totalRecord = 0; 
	if(list !=null && !list.isEmpty()){
		totalRecord=list.size();
	}
	int pageSize=5;  //한 페이지에 보여줄 레코드 수
	int totalPage = (int)Math.ceil((float)totalRecord/pageSize); 
	int blockSize=10; 
	
	int firstPage=currentPage - ((currentPage-1)%blockSize); 
	
	int lastPage=firstPage + (blockSize-1); 
	
	int curPos = (currentPage-1)*pageSize;
	
	int num=totalRecord-curPos;
%>
<div class="a_list">
	<h1>공지사항입니다</h1>
	<div class="bt" style="float: right;">
		<button type="button" class="btn btn-info" 
			onclick="location.href='notice.jsp'">글쓰기</button>
	</div>
	<br/><br/><br/>
	<table class="table table-hover">
		<colgroup>
			<col style="width: 1%;" />
			<col style="width: 10%;" />
			<col style="width: 50%;" />
			<col style="width: 15%;" />
			<col style="width: 10%;" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col"></th>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">이름</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			<%if(list==null && list.isEmpty()){ %>
			<tr>
				<td colspan="5" style="text-align: center;">데이터가 없습니다.</td>
			</tr>
			<%}else{ %>
			<%for(int i=0; i<pageSize; i++){
					if(num<1) break;
					AnswerVO vo = list.get(curPos++);
					num--;
				%>
			<tr>
				<td></td>
				<td><%=vo.getNo() %></td>
				<td>
					<a href="n_content.jsp?no=<%=vo.getNo() %>">
							<%=vo.getTitle() %>
					</a>
				</td>
				<td><%=vo.getName() %></td>
				<td><%=sdf.format(vo.getRegdate()) %></td>
			</tr>
			<%}//for %>

			<%}//if %>
		</tbody>
	</table>
</div>

<div class="a_page" style="text-align: center;">
	<%if(firstPage>1){ %>
	<a href="n_list.jsp?currentPage=<%=firstPage-1%>"> 
		<img src="images/ll.png" alt="이전 블럭으로">
	</a>
	<%}//if %>

	<%
		for(int i=firstPage;i<=lastPage;i++){
			if(i>totalPage) break;
			
			if(i == currentPage){%>
			<span style="color: red; font-weight: bold"><%=i %></span>
	
		<%}else{ %>	
			<a href="n_list.jsp?currentPage=<%=i%>">[<%=i %>]
			</a>
		<%}//if %>
	<%}//for %>

	<%if(lastPage < totalPage){ %>
	<a href="n_list.jsp?currentPage=<%=lastPage+1%>"> 
		<img src="images/rr.png" alt="다음 블럭으로">
	</a>
	<%}//if %>
	
</div>