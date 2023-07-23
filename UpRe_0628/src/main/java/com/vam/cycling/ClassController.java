package com.vam.cycling;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.vam.model.ClassVO;
import com.vam.model.Criteria;
import com.vam.model.MemberVO;
import com.vam.model.PageMakerDTO;
import com.vam.service.ClassService;
import com.vam.service.MemberService;


@Controller
@RequestMapping("/class/*")
public class ClassController {

	private static final Logger log = LoggerFactory.getLogger(ClassController.class);

	@Autowired
	private ClassService cservice;
	
	@Autowired
	private MemberService memberService;

	// class 목록 및 페이징 적용
	@GetMapping("/main")
	public String mainPageGet( Model model, Criteria cri) {
		log.info("mainPageGet");
		List<ClassVO> classList = cservice.getClassPaging(cri); // 게시판 목록을 가져옴
		model.addAttribute("list", classList); // 게시판 목록을 모델에 추가
		int total = cservice.getTotal(cri);
		
		

		// 페이지
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
		System.out.println(pageMake);
		
		 //참여자 수
	    Map<Integer, Integer> classCounts = new HashMap<>();
	    for (ClassVO classs : classList) {
	        Integer count = memberService.classCount(classs.getClass_id());
	        classCounts.put(classs.getClass_id(), count);
	    }
	    model.addAttribute("classCounts", classCounts);
		
	return "/class/main";
	}

	// class등록 페이지
	@GetMapping("/insert")
	public String insertPageGet(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(); // 세션을 가져옵니다.
		MemberVO member = (MemberVO) session.getAttribute("member");
		if (member == null) {
			return "redirect:/main";
		}
		
		model.addAttribute("member", member); // 사용자 정보를 모델에 추가합니다.
		System.out.println(model);
		log.info("게시판 등록 페이지 진입");
		return "/class/insert";

	}

	@PostMapping("/insert")
	public String classInsertPOST(ClassVO classs, RedirectAttributes rttr, MultipartFile uploadFile) {

		String uploadFolder = "C:/spring/upre_0702/src/main/webapp/resources/img/";

		// 폴더 생성
		File uploadPath = new File(uploadFolder);

		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}

		// 파일 이름
		String originalFileName = uploadFile.getOriginalFilename();
		String uploadFileName = originalFileName;

		// 중복 파일명 처리
		File saveFile = new File(uploadPath, uploadFileName);
		int count = 1;
		while (saveFile.exists()) {
			String fileNameWithoutExt = originalFileName.substring(0, originalFileName.lastIndexOf('.'));
			String fileExt = originalFileName.substring(originalFileName.lastIndexOf('.'));
			uploadFileName = fileNameWithoutExt + "_" + count + fileExt;
			saveFile = new File(uploadPath, uploadFileName);
			count++;
		}

		// 파일 저장
		try {
			uploadFile.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String fileName = uploadPath + uploadFileName;

		ClassVO cs = new ClassVO();
		cs.setClass_id(classs.getClass_id());
		cs.setClass_img(uploadFileName);
		cs.setClass_name(classs.getClass_name());
		cs.setClass_content(classs.getClass_content());
		cs.setClass_peopleno(classs.getClass_peopleno());

		log.info("ClassVO : " + cs);

		cservice.insert(cs);

		rttr.addFlashAttribute("result", "enrol success");

		return "redirect:/class/main";
	}

	// class 상세
	@GetMapping("/{class_id}")
	public String classDetailsGET(@PathVariable("class_id") int class_id, Model model) {
		cservice.updateViewCnt(class_id);
	    
	    model.addAttribute("pageInfo", cservice.getPage(class_id));
	    Integer classCounts = memberService.classCount(class_id);
	    model.addAttribute("classCounts", classCounts);
	    
	 // class_id 값 로그로 확인
	    System.out.println("class_id: " + class_id);
		return "/class/get";
	}

	/* 수정 페이지 이동 */
	@GetMapping("/update")
	public void boardModifyGET(int class_id, Model model, Criteria cri) {

		model.addAttribute("pageInfo", cservice.getPage(class_id));
		model.addAttribute("cri", cri);
	}

	@PostMapping("/update")
	public String classUpdatePOST(ClassVO classs, RedirectAttributes rttr,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile,
			@RequestParam("oldFilePath") String oldFilePath) {

		String uploadFolder = "C:/spring/upre_0702/src/main/webapp/resources/img/";
		// 폴더 생성
		File uploadPath = new File(uploadFolder);

		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}

		String uploadFileName = "";

		if (uploadFile != null && !uploadFile.isEmpty()) {
			// 새로운 파일이 선택된 경우
			// 파일 이름
			String originalFileName = uploadFile.getOriginalFilename();
			uploadFileName = originalFileName;

			// 중복 파일명 처리
			File saveFile = new File(uploadPath, uploadFileName);
			int count = 1;
			while (saveFile.exists()) {
				String fileNameWithoutExt = originalFileName.substring(0, originalFileName.lastIndexOf('.'));
				String fileExt = originalFileName.substring(originalFileName.lastIndexOf('.'));
				uploadFileName = fileNameWithoutExt + "_" + count + fileExt;
				saveFile = new File(uploadPath, uploadFileName);
				count++;
			}

			// 새로운 파일 업로드
			saveFile = new File(uploadPath, uploadFileName);
			try {
				uploadFile.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			// 파일 업로드 필드가 비어 있는 경우, 기존 파일 유지
			uploadFileName = oldFilePath;
		}

		// 나머지 수정 작업 처리

		ClassVO cs = new ClassVO();
		cs.setClass_id(classs.getClass_id());
		cs.setClass_img(uploadFileName);
		cs.setClass_name(classs.getClass_name());
		cs.setClass_content(classs.getClass_content());
		cs.setClass_peopleno(classs.getClass_peopleno());

		log.info("수정");
		log.info("CLASSVO: " + cs);

		cservice.update(cs);

		rttr.addFlashAttribute("result", "modify success");

		return "redirect:/class/main";
	}

	// class 삭제 처리
	@GetMapping("/delete")
	public String classDeletePOST(int class_id, RedirectAttributes rttr) {

		cservice.delete(class_id);

		rttr.addFlashAttribute("result", "delete success");

		return "redirect:/class/main";
	}

}
