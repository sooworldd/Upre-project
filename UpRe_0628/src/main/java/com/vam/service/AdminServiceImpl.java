package com.vam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.AdminMapper;
import com.vam.model.BoardVO;
import com.vam.model.Criteria;
import com.vam.model.GoodsVO;
import com.vam.model.MemberVO;
import com.vam.model.OrderVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMapper adminMapper;

	/* -----------------------회원------------------------ */
	@Override
	public List<MemberVO> memberList(MemberVO member) {
		return adminMapper.memberList(member);
	}
	
	
	@Override
	public List<MemberVO> memberListPaging(Criteria cri) {

		return adminMapper.memberListPaging(cri);
	}
	
	
	@Override
	public int memberTotal(Criteria cri) {

		return adminMapper.memberTotal(cri);
	}

	@Override
	public MemberVO memberDetail(String id) {
		return adminMapper.memberDetail(id);
	}

	@Override
	public void memberUpdate(MemberVO member) {
		 adminMapper.memberUpdate(member);

		
	}

	@Override
	public void memberDelete(String id) {
		adminMapper.memberDelete(id);
		
	}
	/* -----------------------상품------------------------ */
	@Override
	public List<GoodsVO> goodsList(GoodsVO goods) {
		return adminMapper.goodsList(goods);
	}

	@Override
	public GoodsVO goodsDetail(String name) {
		return adminMapper.goodsDetail(name);
	}

	@Override
	public void goodsUpdate(GoodsVO goods) {
		adminMapper.goodsUpdate(goods);		
	}

	@Override
	public GoodsVO tumblr(GoodsVO goods) {
		return adminMapper.tumblr(goods);
	}

	@Override
	public void orderInfo(OrderVO order) {
		adminMapper.orderInfo(order);
	}

}