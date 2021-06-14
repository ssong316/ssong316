package bnb.question.model;

import java.util.Date;

public class Utility {

	public static final String UPLOAD_PATH="qt_upload"; 
	public static final String TEST_UPLOAD_PATH
    	= "D:\\lecture\\workspace_list\\jsp_ws\\SemiProj\\src\\main\\webapp\\qt_upload";
    
	public static String displayRe(int step) {
		//답변글인 경우 단계별로 이미지 보여주기
		String result="";

		if(step>0) {
			for(int k=0; k<step; k++) {
				result+="&nbsp";
			}//for

			result+="<img src='../images/re.gif'>";
		}
		return result;
	}//
	
	/*
	 * public static String cutTitle(String title) { //제목이 긴 경우 일부만 보여주기 String
	 * result=""; if(title.length()>30) { result=title.substring(0, 30)+"..."; }else
	 * { result=title; } return result; }
	 */
	
	public static String cutTitle(String title, int len) {
		//제목이 긴 경우 일부만 보여주기
		String result="";
		if(title.length()>len) {
			result=title.substring(0, len)+"...";
		}else {
			result=title;
		}
		return result;
	}//
	
	public static String displayNew(Date regdate) {
		//24시간 이내의 글인 경우 new 이미지 보여주기
		Date today = new Date();	//오늘날짜
		
		long gap = (today.getTime() - regdate.getTime())/1000;
		gap = gap/(60*60);	//시간으로 변환
		
		String result="";
		if(gap<24) {
			result="<img src='../images/new.gif'>";
		}
		return result;
	}//
	
	public static String displayFile(String fileName) {
		String result="";
		if(fileName!=null && !fileName.isEmpty()) {
			result="<img src='../images/file.gif' alt='file이미지'/>";
		}
		return result;
	}//
	
	public static String getFileInfo(String originalfileName, long fileSize ) {
		String result="";
		
		if(originalfileName!=null && !originalfileName.isEmpty()) {
			float sFileSize = fileSize/1024f;
			sFileSize = Math.round(sFileSize*10)/10f;
			
			result = displayFile(originalfileName) + " "
					+ originalfileName + " (" + sFileSize + "KB)";
		}
		return result;
	}//
}