<%@page import="bnb.question.model.QuestionVO"%>
<%@page import="bnb.question.model.QuestionService"%>
<%@page import="bnb.question.model.QusetionDAO"%>
<%@page import="bnb.question.model.Utility"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
      //파일 업로드 처리하기
      request.setCharacterEncoding("utf-8");
   
      String upPath="qt_upload"; 
      String saveDir=application.getRealPath(upPath);
      saveDir=config.getServletContext().getRealPath(upPath);
      saveDir = Utility.TEST_UPLOAD_PATH;
      int maxSize=2*1024*1024;
      
      try{
    	 MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize,
    		         "utf-8", new DefaultFileRenamePolicy());
         System.out.println("업로드 완료!");
         
         String fileName=mr.getFilesystemName("upfile");
         
         String originalFileName="";
         long fileSize=0;
         
         //업로드 한 경우에만 파일 크기 얻어오기
         if(fileName!=null && !fileName.isEmpty()){
            originalFileName=mr.getOriginalFileName("upfile");
            File file=mr.getFile("upfile");
            fileSize=file.length();
         }
         
         String title = mr.getParameter("title");
         String name = mr.getParameter("name");
         String content = mr.getParameter("content");
         
         String ip=request.getRemoteAddr();
		 String ip2=request.getRemoteHost();
		 System.out.println("ip="+ip+", ip2="+ip2);
         
		 QusetionDAO dao = new QusetionDAO();
		 QuestionVO vo = new QuestionVO();
		 
		 vo.setTitle(title);
		 vo.setName(name);
		 vo.setContent(content);
		 vo.setFileName(fileName);
		 vo.setFileSize(fileSize);
		 vo.setOriginalFileName(originalFileName);
		 
		 int cnt = dao.insertQuestion(vo);
		 
		 if(cnt>0){ %>
			<script type="text/javascript">
				alert('문의글이 등록되었습니다.');
				location.href="list.jsp";
			</script>				
		<%}else{%>
			<script type="text/javascript">
				alert('다시 시도해주세요.');
				history.back();
			</script>				
		<%}
      }catch(IOException e){
         e.printStackTrace();
      }catch(SQLException e){
         e.printStackTrace();
      }
      
   %>
   
</body>
</html>


