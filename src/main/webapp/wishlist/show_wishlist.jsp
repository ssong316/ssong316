<%@page import="java.sql.SQLException"%>
<%@page import="com.bnb.wishlist.model.wishlistVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bnb.wishlist.model.wishlistDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
.featured-image-block-grid-header {
	margin-left: auto;
	margin-right: auto;
}

.featured-image-block {
	margin-bottom: 20px;
	margin-right: 50px;
}

.featured-image-block .featured-image-block-title {
	font-weight: 600;
	margin-top: 10px;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-size: 1em;
	color: #404040;
}

.featured-image-block a:hover p {
	color: #1779ba;
}
</style>
<%
	wishlistDAO dao = new wishlistDAO();
	List<wishlistVO> list = null;
	
	try{
		list = dao.showList();
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<div class="featured-image-block-grid"">
	<div
		class="featured-image-block-grid-header small-10 medium-8 large-7 columns text-center">
		<h2>나의 위시리스트</h2>
		<br> <br> <br>

		<%if (list == null && list.isEmpty()) {%>
		<h2 style="color: blue;">위시리스트가 없습니다.</h2>
		<%} else {%>

		<%for (int i = 0; i < list.size(); i++) {
				wishlistVO vo = list.get(i);
		%>
	</div>
	<div class="row large-up-4 small-up-2" style="width: 300px;">

		<div class="featured-image-block column">
			<a href="#"> <img
				src="<%=request.getContextPath() %>/images/1.jpeg" />
				<p class="text-center featured-image-block-title"><%=vo.getName()%></p>
			</a>
		</div>
		<%} %>
		<%} %>
	</div>
</div>



