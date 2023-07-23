package com.vam.service;

import java.util.List;

import com.vam.model.BoardVO;
import com.vam.model.Criteria;

public interface BoardService {
	
	/*게시판 등록*/
	public void enroll(BoardVO board);
	
	/* 게시판 목록 */
    public List<BoardVO> getList();
    
    /* 게시판 목록(페이징 적용) */
    public List<BoardVO> getListPaging(Criteria cri);
    
    /* 게시판 조회 */
    public BoardVO getPage(int board_no);
    
    /* 게시판 수정 */
    public int modify(BoardVO board);
    
    /* 게시판 삭제 */
    public int delete(int board_no);
    
    /* 게시판 총 갯수 */
    public int getTotal(Criteria cri);
    
    /* 조회수 증가 */
    public void updateViewCnt(int board_no);
    
    /* 좋아요수 증가 */
    public void updateLikeCnt(int board_no);
    
    /* 좋아요수 감소 */
    public void updateUnLikeCnt(int board_no);
    
    

}
