package com.vam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.BoardMapper;
import com.vam.model.BoardVO;
import com.vam.model.Criteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;

	@Override
	public void enroll(BoardVO board) {

		mapper.enroll(board);

	}

	/* 게시판 목록 */
	@Override
	public List<BoardVO> getList() {

		return mapper.getList();
	}

	/* 게시판 목록(페이징 적용) */
	@Override
	public List<BoardVO> getListPaging(Criteria cri) {

		return mapper.getListPaging(cri);
	}

	/* 게시판 조회 */
	@Override
	public BoardVO getPage(int board_no) {

		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_no(board_no);
		
		return mapper.getPage(boardVO);
	}

	/* 게시판 수정 */
	@Override
	public int modify(BoardVO board) {
		return mapper.modify(board);
	}

	/* 게시판 삭제 */
	@Override
	public int delete(int board_no) {

		return mapper.delete(board_no);
	}

	/* 게시물 총 갯수 */
	@Override
	public int getTotal(Criteria cri) {

		return mapper.getTotal(cri);
	}

	/* 조회수 증가 */
	@Override
	public void updateViewCnt(int board_no) {

		mapper.updateViewCnt(board_no);

	}
	/* 좋아요수 증가 */
	@Override
	public void updateLikeCnt(int board_no) {
		mapper.updateLikeCnt(board_no);
		
	}
	/* 좋아요수 감소 */
	@Override
	public void updateUnLikeCnt(int board_no) {
		mapper.updateUnLikeCnt(board_no);
		
	}

}
