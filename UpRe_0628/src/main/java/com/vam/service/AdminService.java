package com.vam.service;

import java.util.List;

import com.vam.model.Criteria;
import com.vam.model.GoodsVO;
import com.vam.model.MemberVO;
import com.vam.model.OrderVO;

public interface AdminService {

	/* -----------------------회원------------------------ */

	// 회원목록
	public List<MemberVO> memberList(MemberVO member);
	
	// 회원 목록(페이징 적용)
    public List<MemberVO> memberListPaging(Criteria cri);
    
    // 회원 목록 총 개수
    public int memberTotal(Criteria cri);

	// 회원상세
	public MemberVO memberDetail(String id);

	// 회원 정보수정
	public void memberUpdate(MemberVO member);

	// 회원 삭제
	public void memberDelete(String id);

	/* -----------------------상품------------------------ */

	// 하나 밖에 없는 상품목록
	public List<GoodsVO> goodsList(GoodsVO goods);

	// 상품상세
	public GoodsVO goodsDetail(String name);

	// 상품 정보수정
	public void goodsUpdate(GoodsVO goods);

	// 상품정보 끌고오기
	public GoodsVO tumblr(GoodsVO goods);
	
	//구매 완료
	public void orderInfo(OrderVO order);
}
