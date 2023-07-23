package com.vam.mapper;

import java.util.List;

import com.vam.model.ReplyVO;
import com.vam.model.RreplyVO;

public interface ReplyMapper {

	// 댓글 보이기
	public List<ReplyVO> readReply(int board_no);

	// 대댓글 보이기
	public List<RreplyVO> readRreply(int board_no);

	// 댓글등록
	public void writeReply(ReplyVO reply);

	// 대댓글등록
	public void writeRreply(RreplyVO rreply);

	// 댓글수정
	public int updateReply(ReplyVO reply);

	// 대댓글수정
	public int updateRreply(RreplyVO rreply);

	// 댓글삭제
	public int deleteReply(int board_no);

	// 대댓글삭제
	public int deleteRreply(int board_no);

	// 선택된 댓글 조회= 댓글 번호_파라미터로 받고 번호에 해당하는 댓글 수정,삭제
	// public ReplyVO selectReply(int rno);
	// 댓글수 출력
	public Integer replyCount(Integer board_no);

	// 대댓글수 출력
	public Integer rreplyCount(Integer board_no);
}
