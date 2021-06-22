package com.bnb.message.model;


import java.sql.Timestamp;

public class MessageVO {
	/*
	 * private int msgno; private String content; private String name; private
	 * Timestamp regdate; private int hno;
	 */
	
	 private int msgno; 
	 private String content; 
	 private int sender; 
	 private int receiver;
	 private Timestamp regdate;
	 private String senderName;
	 private String senderId;
	 
	 public MessageVO() {
		// TODO Auto-generated method stub

	}
	 public MessageVO(int msgno, String content, int sender, int receiver, Timestamp regdate) {
			super();
			this.msgno = msgno;
			this.content = content;
			this.sender = sender;
			this.receiver = receiver;
			this.regdate = regdate;
		}
	public MessageVO(int msgno, String content, int sender, int receiver, Timestamp regdate, String senderName,
			String senderId) {
		super();
		this.msgno = msgno;
		this.content = content;
		this.sender = sender;
		this.receiver = receiver;
		this.regdate = regdate;
		this.senderName = senderName;
		this.senderId = senderId;
	}
	public int getMsgno() {
		return msgno;
	}
	public void setMsgno(int msgno) {
		this.msgno = msgno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public int getReceiver() {
		return receiver;
	}
	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	 
	


}
