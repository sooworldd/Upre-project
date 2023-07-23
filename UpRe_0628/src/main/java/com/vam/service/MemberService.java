package com.vam.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.vam.model.ClassCartVO;
import com.vam.model.MemberVO;
import com.vam.model.OrderVO;

public interface MemberService {
	// 회원가입
	public void MemberJoin(MemberVO member);

	// 중복확인
	public int idCheck(String id);

	// 로그인
	public MemberVO memberLogin(MemberVO member);

	// 아이디 찾기
	public MemberVO idSearch(MemberVO member);

	// 비밀번호 찾기
	public MemberVO pwSearch(MemberVO member);

	// 비밀번호 변경
	public void pwReplace(MemberVO member);

	// 주문목록
	public List<OrderVO> orderList();

	// 주문조회
	public OrderVO orderDetail(int order_no);

	// 주문취소
	public void orderCancel(int order_no);

	// 정보수정 비밀번호 확인
	public MemberVO checkMy(MemberVO member);

	// class 참여하가
	public void classjoin(ClassCartVO cart);

	// 참여목록
	public List<ClassCartVO> cartList();

	// class 참여 철회
	public void classCancel(int cart_no);

	// class 중복체크
	public int classCheck(@Param("id") String id, @Param("class_id") int class_id);

	// class 참여자수
	public int classCount(int class_id);

	// 참여자 명단
	public List<ClassCartVO> joinList(int class_id);
}
