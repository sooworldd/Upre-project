package com.vam.cycling;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vam.model.Criteria;
import com.vam.model.GoodsVO;
import com.vam.model.MemberVO;
import com.vam.model.PageMakerDTO;
import com.vam.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	AdminService adminService;

	/* -------------------------------회원------------------------------------- */
	// 회원목록
	@GetMapping("/memberManage")
	public String memberManageGet(MemberVO member, Model model, Criteria cri, HttpSession session) {
		MemberVO Member = (MemberVO) session.getAttribute("member");

		if (Member == null || Member.getLev() == null) {
			return "redirect:/main";
		}

		log.info("회원 관리 페이지 진입");

		List<MemberVO> memberList = adminService.memberListPaging(cri);
		model.addAttribute("memberList", memberList);
		
		
		int total = adminService.memberTotal(cri);

		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		
		System.out.println(pageMake);
		
		model.addAttribute("totalMembers", memberList.size());
		model.addAttribute("pageMaker", pageMake);

		return "admin/memberManage";
	}

	// 회원상세
	@GetMapping("/memberDetail")
	public String memberDetailGet(String id, Model model, HttpSession session) {
		MemberVO Member = (MemberVO) session.getAttribute("member");
	//	if (Member == null || Member.getLev() == null)
		
	// 정보수정을 어드민과 일반 회원이 같은 메소드를 사용하기 위해 수정했음
		if (Member == null) {
			return "redirect:/member/close";
		}
		
		log.info("회원 상세 페이지 진입, 아이디: " + id);

		MemberVO memberDetail = adminService.memberDetail(id);
		model.addAttribute("member", memberDetail);

		return "admin/memberDetail";
	}

	// 회원수정
	@PostMapping("/memberUpdate")
	public String memberUpdatePost(MemberVO member) {
		adminService.memberUpdate(member);
		return "redirect:/member/close";
	}

	// 회원삭제
	@PostMapping("/memberDelete")
	public String memberDeletePost(String id) {
		adminService.memberDelete(id);

		return "redirect:/member/close";
	}

	/* -------------------------------상품------------------------------------- */

	// 상품목록
	@GetMapping("/goodsManage")
	public String goodsManageGet(GoodsVO goods, Model model, HttpSession session) {
		MemberVO Member = (MemberVO) session.getAttribute("member");

		if (Member == null || Member.getLev() == null) {
			return "redirect:/main";
		}
		log.info("상품 관리 페이지 진입");

		List<GoodsVO> goodsList = adminService.goodsList(goods);
		System.out.println("전달된 데이터 : " + goodsList);

		model.addAttribute("goodsList", goodsList);
		model.addAttribute("totalGoods", goodsList.size());

		return "/admin/goodsManage";
	}

	// 상품상세
	@GetMapping("/goodsDetail")
	public String goodsDetailGet(String name, Model model, HttpSession session) {
		MemberVO Member = (MemberVO) session.getAttribute("member");

		if (Member == null || Member.getLev() == null) {
			return "redirect:/main";
		}
		log.info("회원 상세 페이지 진입, 아이디: " + name);

		GoodsVO goodsDetail = adminService.goodsDetail(name);
		model.addAttribute("goods", goodsDetail);
		System.out.println("전달된 데이터 : " + goodsDetail);
		return "admin/goodsDetail";
	}

	// 회원수정
	@PostMapping("/goodsUpdate")
	public String goodsUpdatePost(GoodsVO goods) {
		adminService.goodsUpdate(goods);
		return "redirect:/member/close";
	}

}
