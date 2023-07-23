package com.vam.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.MemberMapper;
import com.vam.model.ClassCartVO;
import com.vam.model.MemberVO;
import com.vam.model.OrderVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;

	@Override
	public void MemberJoin(MemberVO member) {
		memberMapper.MemberJoin(member);

	}

	@Override
	public int idCheck(String id) {
		return memberMapper.idCheck(id);
	}

	@Override
	public MemberVO memberLogin(MemberVO member) {
		return memberMapper.memberLogin(member);
	}

	@Override
	public MemberVO idSearch(MemberVO member) {
		return memberMapper.idSearch(member);
	}

	@Override
	public MemberVO pwSearch(MemberVO member) {
		return memberMapper.pwSearch(member);
	}

	@Override
	public void pwReplace(MemberVO member) {
		memberMapper.pwReplace(member);
	}

	@Override
	public OrderVO orderDetail(int order_no) {
		return memberMapper.orderDetail(order_no);
	}

	@Override
	public void orderCancel(int order_no) {
		memberMapper.orderCancel(order_no);
	}

	@Override
	public List<OrderVO> orderList() {
		return memberMapper.orderList();
	}

	@Override
	public MemberVO checkMy(MemberVO member) {
		return memberMapper.checkMy(member);
	}

	@Override
	public void classjoin(ClassCartVO cart) {
		memberMapper.classjoin(cart);
		
	}

	@Override
	public List<ClassCartVO> cartList() {
		return memberMapper.cartList();
	}

	@Override
	public void classCancel(int cart_no) {
		memberMapper.classCancel(cart_no);
		
	}

	@Override
	public int classCheck(@Param("id")String id, @Param("class_id")int class_id) {
	    return memberMapper.classCheck(id, class_id);
	}
	
	@Override
	public int classCount(int class_id) {
		return memberMapper.classCount(class_id);
	}
	
	@Override
	public List<ClassCartVO> joinList(int class_id) {
		return memberMapper.joinList(class_id);
	}

}
