package com.vam.model;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaVO {
	
	private String id;
	/* 게시판 번호 */
	private int bno;
	
	/* 게시판 제목 */
	private String title;
	
	/* 게시판 내용 */
	private String content;
	
	/* 게시판 작성자 */
	private String writer;
	
	/* 등록 날짜 */
	private Date regdate;
	
	/* 게시판 답변 */
	private String reple;
	
	/* 문의 유형 */
	private String category;
	
	/* 답변 여부 */
	private String answer;
	

	
	

	

	
}