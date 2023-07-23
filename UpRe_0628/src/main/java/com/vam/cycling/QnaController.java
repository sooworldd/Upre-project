package com.vam.cycling;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vam.model.Criteria;
import com.vam.model.PageMakerDTO;
import com.vam.model.QnaVO;
import com.vam.service.QnaService;

@Controller
@RequestMapping("/qna")
public class QnaController {
    private static final Logger log = LoggerFactory.getLogger(QnaController.class);
	
    @Autowired
    private QnaService bservice;
	
    // 게시판 목록 페이지 접속(페이징 적용)
    @GetMapping("/list")
    public void qnaListGet(Model model, Criteria cri) {
        log.info("qnaListGET");
        model.addAttribute("list", bservice.getListPaging(cri));
        int total = bservice.getTotal(cri);
        PageMakerDTO pageMake = new PageMakerDTO(cri, total);
        model.addAttribute("pageMaker", pageMake);
    }
	
	/* 게시판 등록 페이지 접속 */
	@GetMapping("/enroll")
	// => @RequestMapping(value="enroll", method=RequestMethod.GET)
	public void qnaEnrollGet() {
		
		log.info("qna게시판 등록 페이지 진입");
		
	}
	
	/* 게시판 등록 */
	@PostMapping("/enroll")
	public String qnaEnrollPoset(QnaVO qna, RedirectAttributes rttr) {
		
		log.info("QnaVO : " + qna);
		
		bservice.enroll(qna);
		
		log.info("QnaVO : " + qna);
		
		rttr.addFlashAttribute("result", "enrol success");
		
		return "redirect:/qna/list";
		
	}
	
	/* 게시판 조회 */
	@GetMapping("/get")
	public void qnaGetPageGet(int bno, Model model, Criteria cri) {
		
		model.addAttribute("pageInfo", bservice.getPage(bno));
		
		model.addAttribute("cri", cri);
		
	}
	
	
	/* 수정 페이지 이동 */
	@GetMapping("/modify")
	public void qnaModifyGet(int bno, Model model, Criteria cri) {
		
		model.addAttribute("pageInfo", bservice.getPage(bno));
		
		model.addAttribute("cri", cri);
		
	}
	
	/* 페이지 수정 */
	@PostMapping("/modify")
	public String qnaModifyPost(QnaVO qna, RedirectAttributes rttr) {
		
		bservice.modify(qna);
		
		rttr.addFlashAttribute("result", "modify success");
		
		return "redirect:/qna/list";
		
	}
	
	/* 페이지 삭제 */
	@PostMapping("/delete")
	public String qnaDeletePost(int bno, RedirectAttributes rttr) {
		
		bservice.delete(bno);
		
		rttr.addFlashAttribute("result", "delete success");
		
		return "redirect:/qna/list";
	}
	
	/*어드민 답변 등록 페이지 접속 */
	@GetMapping("/reply")
	// => @RequestMapping(value="enroll", method=RequestMethod.GET)
	public void qnaReplyGet(int bno, Model model, Criteria cri) {
		System.out.println("bno:"+bno);
        model.addAttribute("pageInfo", bservice.getPage(bno));	
		model.addAttribute("cri", cri);
		log.info("qna게시판 등록 페이지 진입");
		
	}
	
	/* 어드민 답변하기 */
	@PostMapping("/reply")
    public String replyQna(QnaVO qna,@RequestParam("bno") int bno, @RequestParam("reple") String reple, RedirectAttributes rttr) {
        // 여기에서 업데이트문을 실행하고 필요한 로직을 처리합니다.
        // bno와 reple 값을 사용하여 업데이트 작업을 수행합니다.
		bservice.reply(qna);
		
		bservice.updateAnswer(qna);
		
		rttr.addAttribute("bno", qna.getBno());
       
        return "redirect:/qna/get"; // 이동할 페이지의 URL을 지정합니다.
    }
    
    // ...
	
	@GetMapping("/faq")
	public void qnaFaqGET(Model model) {
	    
	}
	
    
}
	
	
	
	

