package com.vam.model;

import java.util.Date;

import lombok.Data;
@Data
public class RreplyVO {

private String id;// 아이디
	
	private int board_no; //댓글번호
	private int rno; //댓글번호
	private int rrno; //댓글번호
	private String content; //내용
	private String writer; //작성자
	private Date regdate; //작성일
}
