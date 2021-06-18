package bnb.question.model;

import java.sql.Timestamp;

public class MessageVO {
	
	private int no;
	private String content;
	private String name;
	private Timestamp regdate;
	private int groupNo;
	private int step;
	private int sortNo;
	private String delFlag;
	
	public MessageVO() {
		super();
	}

	public MessageVO(int no, String content, String name, Timestamp regdate, int groupNo, int step, int sortNo,
			String delFlag) {
		super();
		this.no = no;
		this.content = content;
		this.name = name;
		this.regdate = regdate;
		this.groupNo = groupNo;
		this.step = step;
		this.sortNo = sortNo;
		this.delFlag = delFlag;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getSortNo() {
		return sortNo;
	}

	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	@Override
	public String toString() {
		return "MessageVO [no=" + no + ", content=" + content + ", name=" + name + ", regdate=" + regdate + ", groupNo="
				+ groupNo + ", step=" + step + ", sortNo=" + sortNo + ", delFlag=" + delFlag + "]";
	}

}
