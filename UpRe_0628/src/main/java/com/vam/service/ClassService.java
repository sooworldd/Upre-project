package com.vam.service;

import java.util.List;

import com.vam.model.BoardVO;
import com.vam.model.ClassVO;
import com.vam.model.Criteria;

public interface ClassService {
	/* CLASS 등록 insert */
	public void insert(ClassVO classs);

	/* class 목록 main */
	public List<ClassVO> getMain();

	/* class 목록(페이징 적용) */
	public List<ClassVO> getClassPaging(Criteria cri);

	/* class 총 갯수 */
	public int getTotal(Criteria cri);
	
	
	/* class get */
	 public ClassVO getPage(int class_id);
//    
//    /* class 수정 update */
    public int update(ClassVO classs);
//    
//    /* class 삭제 delete */
    public int delete(int class_id);
//    

    /* 조회수 증가 */
    public void updateViewCnt(int class_id);

}
