package com.bnb.answer.model;

import java.sql.Timestamp;

public class AnswerVO {

	private int no;
	private String name;
	private String title;
	private Timestamp regdate;
	private String content;
	
	public AnswerVO() {
		super();
	}

	public AnswerVO(int no, String name, String title, Timestamp regdate, String content) {
		super();
		this.no = no;
		this.name = name;
		this.title = title;
		this.regdate = regdate;
		this.content = content;
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

	@Override
	public String toString() {
		return "AnswerVO [no=" + no + ", name=" + name + ", title=" + title + ", regdate=" + regdate + ", content="
				+ content + "]";
	}
	
}
