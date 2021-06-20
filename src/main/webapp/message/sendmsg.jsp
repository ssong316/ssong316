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

.a_list, .a_page {
   width: 700px;
   margin: 0 auto;
}

.a_page a, .a_list a {
   color: #1b52aa;
}
</style>
<%
MessageDAO dao = new MessageDAO();
List<MessageVO> list = null;
int userno =Integer.parseInt((String)session.getAttribute("no"));
try {
   list = dao.showMsgByNo(userno);
} catch (SQLException e) {
   e.printStackTrace();
}

SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH시 mm분");


int mycount=0;
%>
<div class="a_list">
   <h1>나의 메시지</h1>
   <br/><br/><br/>
   <table class="table table-hover">
      <colgroup>
         <col style="width: 1%;" />
         <col style="width: 10%;" />
         <col style="width: 10%;" />
         <col style="width: 30%;" />
         <col style="width: 20%;" />
      </colgroup>
      <thead>
         <tr>
            <th scope="col"></th>
            <th scope="col">번호</th>
            <th scope="col">보낸사람</th>
            <th scope="col">보낸메시지</th>
            <th scope="col">작성일</th>
         </tr>
      </thead>
      <tbody>
         <%if((list==null && list.isEmpty()) || session.getAttribute("login_id")==null){ %>
         <tr>
            <td colspan="4" style="text-align: center;">데이터가 없습니다.</td>
         </tr>
         <%}else{ %>
         <%for(int i=0; i<list.size(); i++){
               MessageVO vo = list.get(i);
               
            %>
         <tr>
            <td></td>
            <td><%=vo.getMsgno() %></td>
            <td><%=vo.getHostname()%></td>
            <td><%=vo.getContent() %></td>
            <td><%=sd.format(vo.getRegdate()) %></td>
         </tr>
         <%}//for %>

         <%}//if %>
      </tbody>
   </table>
</div>
