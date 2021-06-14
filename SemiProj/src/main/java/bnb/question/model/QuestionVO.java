package bnb.question.model;

import java.sql.Timestamp;

public class QuestionVO {

    private int no; 
    private String name; 
    private String title; 
    private Timestamp regdate; 
    private String content;   
    private String fileName; 
    private long fileSize;    
    private String originalFileName; 
    private String delFlag;
	
    public QuestionVO() {
		super();
	}

	public QuestionVO(int no, String name, String title, Timestamp regdate, String content, String fileName,
			long fileSize, String originalFileName, String delFlag) {
		super();
		this.no = no;
		this.name = name;
		this.title = title;
		this.regdate = regdate;
		this.content = content;
		this.fileName = fileName;
		this.fileSize = fileSize;
		this.originalFileName = originalFileName;
		this.delFlag = delFlag;
	}

	public QuestionVO(int no, String name, String title, Timestamp regdate, String content, String delFlag) {
		super();
		this.no = no;
		this.name = name;
		this.title = title;
		this.regdate = regdate;
		this.content = content;
		this.delFlag = delFlag;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	@Override
	public String toString() {
		return "QuestionVO [no=" + no + ", name=" + name + ", title=" + title + ", regdate=" + regdate + ", content="
				+ content + ", fileName=" + fileName + ", fileSize=" + fileSize + ", originalFileName="
				+ originalFileName + ", delFlag=" + delFlag + "]";
	}
    
}
