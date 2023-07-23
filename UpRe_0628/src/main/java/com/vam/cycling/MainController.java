package com.vam.cycling;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vam.model.GoodsVO;
import com.vam.model.MemberVO;
import com.vam.model.OrderVO;
import com.vam.service.AdminService;

@Controller
public class MainController {
	private static final Logger log = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	AdminService adminService;
	
	// 메인 페이지 이동
	@GetMapping("/main")
	public void mainPageGet() {
		log.info("메인 페이지");
	}

	// 텀블러
	@GetMapping("/tumblr")
	public void tumblrGET(HttpServletRequest request, GoodsVO goods, Model model) throws Exception {
		HttpSession session = request.getSession();
		Object user = session.getAttribute("user");

		GoodsVO tumblr = adminService.tumblr(goods);
		model.addAttribute("tumblr", tumblr);

		log.info("텀블러 구매 페이지");
	}

	// 구매페이지
	@GetMapping("/purchase")
	public void purchaseGET(HttpServletRequest request, @RequestParam("quantity") int quantity,
			@RequestParam("totalPrice") int totalPrice, Model model) throws Exception {

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		model.addAttribute("member", member);
		GoodsVO goods = (GoodsVO) session.getAttribute("goods");
		model.addAttribute("goods",goods);

		model.addAttribute("quantity", quantity);
		model.addAttribute("totalPrice", totalPrice);
		log.info("결제 페이지");
	}
	
	@PostMapping("/kakaopay")
	@ResponseBody
	public String kakaopayPOST() {
		try {
		URL kakaopayUrl = new URL("https://kapi.kakao.com/v1/payment/ready");
		HttpURLConnection serverCon = (HttpURLConnection) kakaopayUrl.openConnection();
		serverCon.setRequestProperty("Authorization", "KakaoAK cf0f0c40137f2f8890531f5d8d088351");
		serverCon.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		serverCon.setDoOutput(true);
		String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=UpRe Stainless Tumbler 550ml&quantity=1&total_amount=25000&tax_free_amount=0&"
				+ "approval_url=http://localhost:8082/completion&fail_url=http://localhost:8082/purchase&cancel_url=localhost:8082/purchase";
		OutputStream ops = serverCon.getOutputStream();
		DataOutputStream dops = new DataOutputStream(ops);
		dops.writeBytes(parameter);
		dops.close();
		
		int result = serverCon.getResponseCode();
		
		InputStream ips;
		
		if(result==200) {
			ips = serverCon.getInputStream();
		}else {
			ips = serverCon.getErrorStream();
		}

		InputStreamReader reader = new InputStreamReader(ips);
		BufferedReader bReader = new BufferedReader(reader);
		return bReader.readLine();
		}catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@GetMapping("/completion")
	public void completionGET(OrderVO order) {
		log.info("구매 완료 페이지");
		
		System.out.println(order);
		adminService.orderInfo(order);
	}
}