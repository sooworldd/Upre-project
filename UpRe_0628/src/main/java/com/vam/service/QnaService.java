package com.vam.service;

import java.util.List;

import com.vam.model.BoardVO;
import com.vam.model.Criteria;
import com.vam.model.QnaVO;


public interface QnaService {
	/* 게시판 등록 */
	public void enroll(QnaVO qna);
	
	/* 게시판 목록 */
	public List<QnaVO> getList();
	
	/* 게시판 목록(페이징 적용) */
	public List<QnaVO> getListPaging(Criteria cri);
	
	/* 게시판 조회 */
	public QnaVO getPage(int bno);	
	
	/* 게시판 수정 */
	public int modify(QnaVO qna);
	
	/* 게시판 삭제 */
	public int delete(int bno);
	
	/* 게시판 총 갯수 */
	public int getTotal(Criteria cri);
	
	/* 어드민 답변 달기 */
	public void reply(QnaVO qna);
	
	/* 답변 상태 변경 */
	public void updateAnswer(QnaVO qnaVO);
	
}
