package com.vam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.LikeMapper;
import com.vam.model.LikeVO;

@Service
public class LikeServiceImpl implements LikeService{
	
	@Autowired
	private LikeMapper likeMapper;

	@Override
	public void likeCheck(LikeVO like) {
		
		likeMapper.likeCheck(like);
	}

	@Override
	public int deleteLike(LikeVO like) {
		return likeMapper.deleteLike(like);
		
	}

	@Override
	public LikeVO like(int board_no) {
		return likeMapper.like(board_no);
	}

	

}
