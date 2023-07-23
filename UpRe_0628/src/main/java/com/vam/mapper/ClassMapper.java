package com.vam.mapper;

import java.util.List;

import com.vam.model.ClassVO;
import com.vam.model.Criteria;

public interface ClassMapper {

	/* CLASS 등록 insert */
	public void insert(ClassVO classs);

	/* class 목록 main */
	public List<ClassVO> getMain();

	/* class 목록(페이징 적용) */

	public List<ClassVO> getClassPaging(Criteria cri);

	/* class 총 갯수 */
	public int getTotal(Criteria cri);

//    /*  조회 */
    public ClassVO getPage(ClassVO classVO);
//    
//    /* 게시판 수정 */
    public int update(ClassVO classs);
//    
//    /* 게시판 삭제 */
    public int delete(int class_id);
//    
    /* 조회수 증가 */
    public void updateViewCnt(int class_id);


}
