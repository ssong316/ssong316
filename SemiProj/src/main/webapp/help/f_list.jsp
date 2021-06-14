<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bnb.question.model.QuestionVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="bnb.question.model.QusetionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
.f_list, .f_page {
	width: 70%;
	margin: 0 auto;
}

.f_page a, .f_list a {
	color: #1b52aa;
}
</style>
<%
	QusetionDAO dao = new QusetionDAO();
	List<QuestionVO> list = null;
		
	try{
		list=dao.selectAll();
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

<div class="f_list">
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
					QuestionVO vo = list.get(curPos++);
					num--;
				%>
			<tr>
				<td></td>
				<td><%=vo.getNo() %></td>
				<td>
					<a href="f_content.jsp?no=<%=vo.getNo() %>">
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

<div class="f_page" style="text-align: center;">
	<!-- 페이지 번호 추가 -->
	<!-- 이전 블럭으로 이동 -->
	<%if(firstPage>1){ %>
	<a href="f_list.jsp?currentPage=<%=firstPage-1%>"> 
		<img src="../images/page.png" alt="이전 블럭으로">
	</a>
	<%}//if %>

	<%
		for(int i=firstPage;i<=lastPage;i++){
			if(i>totalPage) break;
			
			if(i == currentPage){%>
			<span style="color: red; font-weight: bold"><%=i %></span>
	
		<%}else{ %>	
			<a href="f_list.jsp?currentPage=<%=i%>">[<%=i %>]
			</a>
		<%}//if %>
	<%}//for %>

	<!-- 다음 블럭으로 이동 -->
	<%if(lastPage < totalPage){ %>
	<a href="f_list.jsp?currentPage=<%=lastPage+1%>"> 
		<img src="../images/page1.png" alt="다음 블럭으로" />
	</a>
	<%}//if %>
	<!--  페이지 번호 끝 -->
</div>