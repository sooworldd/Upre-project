package com.vam.model;

import java.util.Date;

public class ReplyVO {
	
	private String id;// 아이디
	
	private int board_no; //댓글번호
	private int rno; //댓글번호
	private String content; //내용
	private String writer; //작성자
	private Date regdate; //작성일
	
	//private boolean isSecret; // 비밀댓글 여부
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ReplyVO [id=" + id + ", board_no=" + board_no + ", rno=" + rno + ", content="
				+ content + ", writer=" + writer + ", regdate=" + regdate + "]";
	}
	
	
}