package com.vam.mapper;

import java.util.List;

import com.vam.model.Criteria;
import com.vam.model.QnaVO;

public interface QnaMapper {
	/* 게시판 등록 */
	public void enroll(QnaVO board);
	
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
	
	/* 어드민 답변하기 */
	public void reply(QnaVO qna);

	/* 답변 상태 */
	public void updateAnswer(QnaVO qnaVO);
}