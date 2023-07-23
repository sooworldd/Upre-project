package com.vam.service;

import com.vam.model.LikeVO;

public interface LikeService {

	/*좋아요 등록 */
	public void likeCheck(LikeVO like);
	
	/* 좋아요 삭제 */
    public int deleteLike(LikeVO like);
    
    /*좋아요 목록 */
    public LikeVO like(int board_no);
}
