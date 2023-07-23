package com.vam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.ReplyMapper;
import com.vam.model.ReplyVO;
import com.vam.model.RreplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replymapper;

	// 댓글 보이기
	@Override
	public List<ReplyVO> readReply(int board_no) {
		return replymapper.readReply(board_no);
	}
	
	// 댓글 보이기
		@Override
		public List<RreplyVO> readRreply(int board_no) {
			return replymapper.readRreply(board_no);
		}

	// 댓글등록
	@Override
	public void writeReply(ReplyVO reply) {
		replymapper.writeReply(reply);
	}
	
	// 대댓글등록
		@Override
		public void writeRreply(RreplyVO rreply) {
			replymapper.writeRreply(rreply);
		}

//댓글수정
	@Override
	public int updateReply(ReplyVO reply) {
		return replymapper.updateReply(reply);

	}
	
	//대댓글수정
		@Override
		public int updateRreply(RreplyVO rreply) {
			return replymapper.updateRreply(rreply);

		}

//댓글 삭제
	@Override
	public int deleteReply(int board_no) {
		return replymapper.deleteReply(board_no);
	}
	//댓글 삭제
		@Override
		public int deleteRreply(int board_no) {
			return replymapper.deleteRreply(board_no);
		}
//댓글 수
	@Override
	public Integer replyCount(Integer board_no) {
		return replymapper.replyCount(board_no);
	}
	//대댓글 수
		@Override
		public Integer rreplyCount(Integer board_no) {
			return replymapper.rreplyCount(board_no);
		}

		

////댓글 조회= 댓글 번호_파라미터로 받고 번호에 해당하는 댓글 수정,삭제
//	@Override
//	public ReplyVO selectReply(int rno) {
//	
//		return replymapper.selectReply(rno);
//	}

}
