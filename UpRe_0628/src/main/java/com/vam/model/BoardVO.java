package com.vam.model;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	// 아이디
	private String id;
	
	//카테고리
	private String category;
	
	/*게시판 번호 */
    private int board_no;
    
	/*게시판 제목 */
    private String title;
    
	/*게시판 내용 */
    private String content;
    
	/*게시판 작가 */
    private String writer;
    
	/*등록 날짜 */
    private Date reg_date;
    
	/*조회수 */
    private int view_cnt;
    
	/*좋아요수 */
    private int like_cnt;
    
    /*이미지 URL*/
    private String imgurl;
    
    
	
	
	
	

}
