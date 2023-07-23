package com.vam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.QnaMapper;
import com.vam.model.Criteria;
import com.vam.model.QnaVO;


@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaMapper mapper;

	/* 게시판 등록 */
	@Override
	public void enroll(QnaVO qna) {
		
		mapper.enroll(qna);
		
	}

	/* 게시판 목록 */
	@Override
	public List<QnaVO> getList() {
		
		return mapper.getList();
	}
	
	/* 게시판 목록(페이징 적용) */
	@Override
	public List<QnaVO> getListPaging(Criteria cri) {
		
		return mapper.getListPaging(cri);
	}	
	
	/* 게시판 조회 */
	@Override
	public QnaVO getPage(int bno) {
		 
		return mapper.getPage(bno);
	}

	
	/* 게시판 수정 */
	@Override
	public int modify(QnaVO qna) {
		
		return mapper.modify(qna);
	}

	/* 게시판 삭제 */
	@Override
	public int delete(int bno) {
		
		return mapper.delete(bno);
	}
	
	/* 게시물 총 갯수 */
	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotal(cri);
	}		

	@Override
	public void reply(QnaVO qna) {
		
		mapper.reply(qna);
	}

	@Override
	public void updateAnswer(QnaVO qnaVO) {
		mapper.updateAnswer(qnaVO);
		
	}
	
	
}