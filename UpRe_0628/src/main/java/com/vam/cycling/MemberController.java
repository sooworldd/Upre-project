package com.vam.cycling;

import java.net.MulticastSocket;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vam.model.BoardVO;
import com.vam.model.ClassCartVO;
import com.vam.model.MemberVO;
import com.vam.model.OrderVO;
import com.vam.service.AdminService;
import com.vam.service.BoardService;
import com.vam.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	@Autowired
	AdminService adminService;
	@Autowired
	BoardService boardService;

	/* 로그인 */

	@GetMapping("/login")
	public void loginPageGet() {
		log.info("로그인 페이지 진입");

	}

	@SuppressWarnings("null")
	@PostMapping("/login")
	public String loginPost(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {
		System.out.println("login 메서드 진입");
		System.out.println("전달된 데이터 : " + member);
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";

		MemberVO lvo = memberService.memberLogin(member); // 제출한아이디와 일치하는 아이디 있는지
		System.out.println(lvo);

		if (lvo != null) { // 일치하는 아이디 존재시

			rawPw = member.getPw(); // 사용자가 제출한 비밀번호
			encodePw = lvo.getPw(); // 데이터베이스에 저장한 인코딩된 비밀번호

			if (true == pwEncoder.matches(rawPw, encodePw)) { // 비밀번호 일치여부 판단

				lvo.setPw(""); // 인코딩된 비밀번호 정보 지움
				session.setAttribute("member", lvo); // session에 사용자의 정보 저장

				if ("1".equals(lvo.getLev())) {
					return "redirect:/main"; // 관리자 메인페이지 이동
				} else {
					return "redirect:/main"; // 사용자 메인페이지 이동
				}

			} else {

				rttr.addFlashAttribute("result", 0);
				rttr.addFlashAttribute("errorMessage", "아이디 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.");
				return "redirect:/member/login"; // 로그인 페이지로 이동

			}

		} else { // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)

			rttr.addFlashAttribute("result", 0);
			rttr.addFlashAttribute("errorMessage", "아이디 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.");
			return "redirect:/member/login"; // 로그인 페이지로 이동

		}

	}

	/* 로그아웃 */
	@GetMapping("/logout")
	public String logoutGet(HttpServletRequest request) throws Exception {

		log.info("로그아웃!");

		HttpSession session = request.getSession();

		session.invalidate();

		return "redirect:/main";

	}

	/* 회원가입 */

	@GetMapping("/join")
	public void joinPageGet() {
		log.info("회원가입 페이지 진입");

	}

	@PostMapping("/join")
	public String joinPost(MemberVO member) throws Exception {
		log.info("join 진입");

		String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호

		rawPw = member.getPw(); // 비밀번호 데이터 얻음
		encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
		member.setPw(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장

		/* 회원가입 쿼리 실행 */
		memberService.MemberJoin(member);

		log.info("join Service 성공");

		return "redirect:/main";

	}

	// 아이디 중복 검사
	@PostMapping("/idCheck")
	@ResponseBody
	public String idCheckPost(String id) throws Exception {
		log.info("idCheck() 진입");

		// 아이디 값이 비어있는 경우
		if (id == null || id.isEmpty()) {
			return "empty";
		}

		int result = memberService.idCheck(id);

		log.info("결과값 = " + result);

		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}
	}

	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheckGet(String mail) throws Exception {

		/* 뷰(View)로부터 넘어온 데이터 확인 */
		log.info("이메일 데이터 전송 확인");
		log.info("인증번호 : " + mail);
		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 " + checkNum);

		/* 이메일 보내기 */
		String setFrom = "tatittato@naver.com";
		String toMail = mail;
		String title = "회원가입 인증 이메일 입니다.";

		String content = "UpRe를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 code란에 기입하여 주세요.";
		/*
		 * try {
		 * 
		 * MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
		 * helper = new MimeMessageHelper(message, true, "utf-8");
		 * helper.setFrom(setFrom); helper.setTo(toMail); helper.setSubject(title);
		 * helper.setText(content, true); mailSender.send(message);
		 * 
		 * } catch (Exception e) { e.printStackTrace(); }
		 */
		String num = Integer.toString(checkNum);

		return num;

	}

	// 아이디 찾기
	@GetMapping("/idSearch")
	public void idSearchGet() {
		log.info("아이디 찾기");
	}

	@PostMapping("/idSearch")
	public String idSearchPost(MemberVO member, RedirectAttributes rttr) {
		log.info("아이디 찾기 요청 받음");

		// memberService를 통해 회원 정보를 찾습니다.
		MemberVO vo = memberService.idSearch(member);

		System.out.println(member);

		// 찾은 회원 정보가 없으면 에러 메시지를 추가하고 페이지를 리다이렉트합니다.
		if (vo == null) {
			rttr.addFlashAttribute("errorMessage", "가입된 정보가 없습니다. 입력하신 내용을 다시 확인해주세요.");
			return "redirect:/member/idSearch";
		}

		// 회원 정보가 존재하면 성공 메시지를 추가하고 페이지를 리다이렉트합니다.
		rttr.addFlashAttribute("successMessage", "회원가입하신 아이디는 " + vo.getId() + "입니다.");
		return "redirect:/member/idSearch";
	}

	// 비밀번호 찾기
	@GetMapping("/pwSearch")
	public void pwSearchGet() {
		log.info("비밀번호 찾기");
	}

	@PostMapping("/pwSearch")
	public String pwSearchPost(MemberVO member, RedirectAttributes rttr) {
		log.info("비밀번호 찾기 요청 받음");

		// memberService를 통해 회원 정보를 찾습니다.
		MemberVO vo = memberService.pwSearch(member);

		System.out.println(member);

		// 찾은 회원 정보가 없으면 에러 메시지를 추가하고 페이지를 리다이렉트합니다.
		if (vo == null) {
			rttr.addFlashAttribute("errorMessage", "가입된 정보가 없습니다. 입력하신 내용을 다시 확인해주세요.");
			return "redirect:/member/pwSearch";

		} else {
			rttr.addFlashAttribute("id", member.getId());
			return "redirect:/member/pwReplace";
		}

	}

	// 비밀번호 재설정
	@GetMapping("/pwReplace")
	public void pwReplaceGet() {
		log.info("비밀번호 재설정");
	}

	@PostMapping("/pwReplace")
	public String pwReplacePost(MemberVO member) throws Exception {
		log.info("비밀번호 재설정 요청");

		String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호

		rawPw = member.getPw(); // 비밀번호 데이터 얻음
		encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
		member.setPw(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장

		/* 회원가입 쿼리 실행 */
		memberService.pwReplace(member);

		log.info("비밀번호 변경 성공");

		return "redirect:/member/close";

	}

	// 창닫기
	@GetMapping("/close")
	public void closeGet() {
		log.info("창닫기");
	}

	// 마이페이지
	@GetMapping("/mypage")
	public String myPageGet(HttpSession session, Model model, OrderVO orders, BoardVO board, ClassCartVO cart) {
		MemberVO member = (MemberVO) session.getAttribute("member");

		model.addAttribute("member", member);

		List<OrderVO> orderList = memberService.orderList();
		model.addAttribute("orderList", orderList);

		List<BoardVO> boardList = boardService.getList();
		model.addAttribute("boardList", boardList);

		List<ClassCartVO> cartList = memberService.cartList();
		model.addAttribute("cartList", cartList);

		System.out.println("orderList : " + orderList);
		System.out.println("boardList : " + boardList);
		System.out.println("cartList: " + cartList);

		log.info("마이페이지 진입");

		return "member/mypage";
	}

	// 정보수정 비밀번호 확인
	@GetMapping("/checkMy")
	public void checkMyGet() {
		log.info("정보확인");
	}

	@PostMapping("/checkMy")
	public String checkMyPost(HttpServletRequest request, MemberVO member, RedirectAttributes rttr, String id) {
		HttpSession session = request.getSession();

		String rawPw = ""; // 인코딩 전 비밀번호
		String encodePw = ""; // 인코딩 후 비밀번호
		MemberVO lvo = memberService.checkMy(member);
		rawPw = member.getPw(); // 사용자가 제출한 비밀번호
		encodePw = lvo.getPw(); // 데이터베이스에 저장한 인코딩된 비밀번호

		// 요청에서 비밀번호를 가져옵니다.
		String password = request.getParameter("pw");

		System.out.println(password);

		// 현재 로그인된 회원을 세션에서 가져옵니다.

		System.out.println(lvo);

		// 비밀번호 확인 로직을 수행합니다.
		if (pwEncoder.matches(password, encodePw)) {
			// 비밀번호가 일치하는 경우
			// 원하는 작업을 수행합니다.

			return "redirect:/admin/memberDetail?id=" + id;// 적절한 리다이렉트 URL로 변경해주세요.
		} else {
			// 비밀번호가 일치하지 않는 경우
			// 다음 페이지에서 표시할 에러 메시지를 플래시 어트리뷰트에 설정합니다.
			rttr.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");

			return "redirect:/member/checkMy"; // 적절한 리다이렉트 URL로 변경해주세요.
		}
	}

	// 주문조회
	@GetMapping("/orderDetail")
	public String orderDetailGet(int order_no, Model model) {
		log.info("주문조회, 주문번호: " + order_no);

		OrderVO orderDetail = memberService.orderDetail(order_no);
		System.out.println(orderDetail);

		model.addAttribute("order", orderDetail);
		return "member/orderDetail";
	}

	// 주문취소
	@PostMapping("/orderCancel")
	public String memberDeletePost(int order_no) {
		System.out.println("주문취소 완료");
		memberService.orderCancel(order_no);
		return "redirect:/member/close";
	}

	// class 참여
	@PostMapping("/classjoin")
	public String classjoinPost(ClassCartVO cart) {
		memberService.classjoin(cart);
		return "redirect:/class/main";
	}

	// class 중복체크
	@PostMapping("/classCheck")
	@ResponseBody
	public String classCheckPost(String id, int class_id) {
		log.info("classCheck() 진입");

		int result = memberService.classCheck(id, class_id);
		System.out.println(id);
		System.out.println(class_id);

		log.info("결과값 = " + result);

		if (result != 0) {
			return "fail"; // 중복 클래스가 존재
		} else {
			return "success"; // 중복 아이디 x
		}
	}

	// class 참여 철회
	@PostMapping("/classCancle")
	public String classCanclePost(int cart_no) {
		System.out.println("클래스 취소 완료");
		memberService.classCancel(cart_no);
		return "redirect:/member/mypage";
	}
	
	//class 참여자 List
	@GetMapping("/joinList")
	public String classJoinList(ClassCartVO cart, int class_id, Model model) {
		
		List<ClassCartVO> cartList = memberService.joinList(class_id);
		model.addAttribute("cartList", cartList);
		
		return "/member/joinList";
	}
}