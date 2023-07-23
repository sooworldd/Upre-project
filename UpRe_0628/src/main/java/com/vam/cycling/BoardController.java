package com.vam.cycling;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vam.model.BoardVO;
import com.vam.model.Criteria;
import com.vam.model.LikeVO;
import com.vam.model.MemberVO;
import com.vam.model.PageMakerDTO;
import com.vam.model.ReplyVO;
import com.vam.model.RreplyVO;
import com.vam.service.BoardService;
import com.vam.service.LikeService;
import com.vam.service.ReplyService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService bservice;
	@Autowired
	private ReplyService rservice;
	@Autowired
	private LikeService lservice;

	/* 게시판 목록 페이지 접속(페이징 적용) */
	@GetMapping("/list")
	public void boardListGET(Model model, Criteria cri) {
	    log.info("boardListGET");

	    cri.setCategory("Honey Tips"); // 카테고리 설정

	    List<BoardVO> boardList = bservice.getListPaging(cri); // 카테고리와 검색어를 포함하여 게시판 목록을 가져옴

	    model.addAttribute("list1", boardList);

	    int total = bservice.getTotal(cri);

	    // 페이지
	    PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
	    
	   System.out.println(pageMaker);

	    model.addAttribute("pageMaker", pageMaker);

	    // 댓글수
	    Map<Integer, Integer> replyCounts = new HashMap<>();
	    for (BoardVO board : boardList) {
	        Integer count = rservice.replyCount(board.getBoard_no());
	        replyCounts.put(board.getBoard_no(), count);
	    }
	    model.addAttribute("replyCounts", replyCounts);

	    // 댓글수
	    Map<Integer, Integer> rreplyCounts = new HashMap<>();
	    for (BoardVO board : boardList) {
	        Integer count = rservice.rreplyCount(board.getBoard_no());
	        rreplyCounts.put(board.getBoard_no(), count);
	    }
	    model.addAttribute("rreplyCounts", rreplyCounts);
	}



	
	/* 게시판 목록 페이지 접속(페이징 적용) */
	@GetMapping("/list2")
	public void boardList2GET(Model model, Criteria cri2) {
	    log.info("boardListGET");

	    cri2.setCategory("Reviews"); // 카테고리 설정

	    List<BoardVO> boardList = bservice.getListPaging(cri2); // 카테고리와 검색어를 포함하여 게시판 목록을 가져옴

	    model.addAttribute("list2", boardList);
	    
	   System.out.println(boardList);

	    int total = bservice.getTotal(cri2);

	    // 페이지
	    PageMakerDTO pageMake = new PageMakerDTO(cri2, total);

	    model.addAttribute("pageMaker", pageMake);

	    // 댓글수
	    Map<Integer, Integer> replyCounts = new HashMap<>();
	    for (BoardVO board : boardList) {
	        Integer count = rservice.replyCount(board.getBoard_no());
	        replyCounts.put(board.getBoard_no(), count);
	    }
	    model.addAttribute("replyCounts", replyCounts);

	    // 댓글수
	    Map<Integer, Integer> rreplyCounts = new HashMap<>();
	    for (BoardVO board : boardList) {
	        Integer count = rservice.rreplyCount(board.getBoard_no());
	        rreplyCounts.put(board.getBoard_no(), count);
	    }
	    model.addAttribute("rreplyCounts", rreplyCounts);
	}

	/* 게시판 등록 페이지 접속 */
	@GetMapping("/enroll")
	public String boardEnrollGET(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(); // 세션을 가져옵니다.
		MemberVO member = (MemberVO) session.getAttribute("member"); // 세션에 저장된 사용자 정보를 가져옵니다.

		if (member == null) {
			// 로그인하지 않은 사용자가 접근했을 때 처리하는 코드를 작성하세요.
			// 예를 들어, 로그인 페이지로 리다이렉트 시킬 수 있습니다.
			return "redirect:/member/login";
		}

		model.addAttribute("member", member); // 사용자 정보를 모델에 추가합니다.
		System.out.println(model);

		log.info("게시판 등록 페이지 진입");

		return "/board/enroll";
	}

	@PostMapping("/enroll")
	public String boardEnrollPOST(BoardVO board, RedirectAttributes rttr, MultipartFile uploadFile) {

	    String uploadFolder = "C:/spring/upre_0702/src/main/webapp/resources/img/";

	    // 폴더 생성
	    File uploadPath = new File(uploadFolder);

	    if (!uploadPath.exists()) {
	        uploadPath.mkdirs();
	    }

	    // 파일 이름
	    String originalFileName = uploadFile.getOriginalFilename();
	    String uploadFileName = null;

	    // 파일이 선택된 경우에만 파일 저장 및 파일 이름 설정
	    if (originalFileName != null && !originalFileName.isEmpty()) {
	        // 중복 파일명 처리
	        File saveFile = new File(uploadPath, originalFileName);
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
	    }

	    BoardVO bd = new BoardVO();
	    bd.setId(board.getId());
	    bd.setBoard_no(board.getBoard_no());
	    bd.setWriter(board.getWriter());
	    bd.setImgurl(uploadFileName);
	    log.info(uploadFileName);
	    bd.setTitle(board.getTitle());
	    bd.setContent(board.getContent());
	    bd.setCategory(board.getCategory());

	    log.info("BoardVO: " + bd);

	    bservice.enroll(bd);

	    log.info("BoardVO: " + bd);

	    rttr.addFlashAttribute("result", "enrol success");

	    if ("Honey Tips".equals(board.getCategory())) {
	        return "redirect:/board/list";
	    } else if ("Reviews".equals(board.getCategory())) {
	        return "redirect:/board/list2";
	    }
	    return "redirect:/board/list"; // 기본적으로 /board/list로 리다이렉트
	}


	/* 게시판 조회 */
	@GetMapping("/get")
	public void boardGetPageGET(int board_no, Model model, Criteria cri) {
		// 게시물 상세 조회 시 조회수 증가
		bservice.updateViewCnt(board_no);

		// 댓글보임
		List<ReplyVO> replyList = rservice.readReply(board_no);
		model.addAttribute("replyList", replyList);
		// 대댓글보임
		List<RreplyVO> rreplyList = rservice.readRreply(board_no);
		model.addAttribute("rreplyList", rreplyList);

		lservice.like(board_no);
		model.addAttribute("like", lservice.like(board_no));

		// 대댓글 수 계산
		Map<Integer, Integer> rreplyExistMap = new HashMap<>();

		for (ReplyVO reply : replyList) {
			for (RreplyVO rreply : rreplyList) {
				if (reply.getRno() == rreply.getRno()) {
					rreplyExistMap.put(reply.getRno(), 1);
					break;
				}
			}
			if (!rreplyExistMap.containsKey(reply.getRno())) {
				rreplyExistMap.put(reply.getRno(), 0);
			}
		}

		model.addAttribute("pageInfo", bservice.getPage(board_no));

		model.addAttribute("cri", cri);

		model.addAttribute("rreplyExistMap", rreplyExistMap);

	}

	/* 수정 페이지 이동 */
	@GetMapping("/modify")
	public void boardModifyGET(int board_no, Model model, Criteria cri) {

		model.addAttribute("pageInfo", bservice.getPage(board_no));
		model.addAttribute("cri", cri);

	}

	@PostMapping("/modify")
	public String boardModifyPOST(BoardVO board, RedirectAttributes rttr, 
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

	    BoardVO bd = new BoardVO();
	    bd.setBoard_no(board.getBoard_no());
	    bd.setImgurl(uploadFileName);
	    bd.setTitle(board.getTitle());
	    bd.setContent(board.getContent());
	    bd.setCategory(board.getCategory());

	    log.info("수정");
	    log.info("BoardVO: " + bd);

	    bservice.modify(bd);

	    rttr.addFlashAttribute("result", "modify success");
	    

	    if ("Honey Tips".equals(board.getCategory())) {
	        return "redirect:/board/list";
	    } else if ("Reviews".equals(board.getCategory())) {
	        return "redirect:/board/list2";
	    }
	    
	    return "redirect:/board/list"; // 기본적으로 /board/list로 리다이렉트
	}

	/* 페이지 삭제 */
	@PostMapping("/delete")
	public String boardDeletePOST(int board_no,RedirectAttributes rttr, BoardVO board) {

		bservice.delete(board_no);

		rttr.addFlashAttribute("result", "delete success");
		
		if ("Honey Tips".equals(board.getCategory())) {
	        return "redirect:/board/list";
	    } else if ("Reviews".equals(board.getCategory())) {
	        return "redirect:/board/list2";
	    }

		return "redirect:/board/list";
	}

	// 댓글등록
	@PostMapping("/writeReply")
	public String replyWritePOST(ReplyVO reply, RedirectAttributes rttr) {

		log.info("ReplyVO : " + reply);

		rservice.writeReply(reply);

		rttr.addFlashAttribute("result", "writeReply success");
		rttr.addAttribute("board_no", reply.getBoard_no());
		return "redirect:/board/get";

	}

	// 대댓글등록
	@PostMapping("/writeRreply")
	public String rreplyWritePOST(RreplyVO rreply, RedirectAttributes rttr) {

		log.info("ReplyVO : " + rreply);

		rservice.writeRreply(rreply);

		rttr.addFlashAttribute("result", "writeReply success");
		rttr.addAttribute("board_no", rreply.getBoard_no());
		rttr.addAttribute("rno", rreply.getRno());
		return "redirect:/board/get";

	}

//댓글삭제
	@PostMapping("/deleteReply")
	public String replyDeletePOST(ReplyVO reply, int rno, Model model, RedirectAttributes rttr) {

		rservice.deleteReply(rno);

		rttr.addFlashAttribute("result", "deleteReply success");
		rttr.addAttribute("board_no", reply.getBoard_no());
		return "redirect:/board/get";
	}

	// 대댓글삭제
	@PostMapping("/deleteRreply")
	public String rreplyDeletePOST(RreplyVO reply, int rrno, RedirectAttributes rttr) {

		rservice.deleteRreply(rrno);

		rttr.addFlashAttribute("result", "deleteReply success");
		rttr.addAttribute("board_no", reply.getBoard_no());
		return "redirect:/board/get";
	}

	// 댓글, 대댓글수정
	@PostMapping("/updateReply")
	public String replyUpdatePOST(ReplyVO reply, RedirectAttributes rttr) {

		log.info("수정");

		rservice.updateReply(reply);

		rttr.addFlashAttribute("result", "updateReply success");
		rttr.addAttribute("board_no", reply.getBoard_no());

		return "redirect:/board/get";

	}

	// 대댓글수정
	@PostMapping("/updateRreply")
	public String rreplyUpdatePOST(RreplyVO rreply, RedirectAttributes rttr) {

		log.info("수정");

		rservice.updateRreply(rreply);

		rttr.addFlashAttribute("result", "updateRreply success");
		rttr.addAttribute("board_no", rreply.getBoard_no());
		rttr.addAttribute("rno", rreply.getRno());

		return "redirect:/board/get";

	}

	// 좋아요 등록
	@PostMapping("/likeCheck")
	public String likeCherckPOST(int board_no, LikeVO like, RedirectAttributes rttr) {
		
		
	 //좋아요 클릭시 좋아요 증가
	    bservice.updateLikeCnt(board_no);
		
		log.info("LikeVO : " + like);

		lservice.likeCheck(like);
		rttr.addAttribute("board_no", like.getBoard_no());
		

		return "redirect:/board/get";

	}
	
	//좋아요 삭제
	
		@PostMapping("/deleteLike")
		public String deleteLikePOST(int board_no, LikeVO like, Model model, RedirectAttributes rttr) {
			
			// 좋아요 수 감소 
			
			bservice.updateUnLikeCnt(board_no);

			log.info("DeleteLikeVO : " + like);
			lservice.deleteLike(like);

			rttr.addAttribute("id", like.getId());
			rttr.addAttribute("board_no", like.getBoard_no());
			return "redirect:/board/get";
		}
	

}
