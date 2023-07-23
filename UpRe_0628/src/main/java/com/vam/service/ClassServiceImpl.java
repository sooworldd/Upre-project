package com.vam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.ClassMapper;
import com.vam.model.BoardVO;
import com.vam.model.ClassVO;
import com.vam.model.Criteria;
@Service
public class ClassServiceImpl implements ClassService{

	
	@Autowired
	private ClassMapper mapper;
	
    //class등록 insert
	@Override
	public void insert(ClassVO classs) {
		mapper.insert(classs);	
	}
	
	//class메인 main
	@Override
	public List<ClassVO> getMain() {
		return mapper.getMain();
	}
	
	
	//class메인 main
	@Override
	public List<ClassVO> getClassPaging(Criteria cri) {
		return mapper.getClassPaging(cri);
	}
	
	//class총갯수
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}	
	
	/* class 조회 */
	@Override
	public ClassVO getPage(int class_id) {

		ClassVO classVO = new ClassVO();
		classVO.setClass_id(class_id);
		
		return mapper.getPage(classVO);
	}
//class 수정
	@Override
	public int update(ClassVO classs) {
				return mapper.update(classs);
	}
//class 삭제
	@Override
	public int delete(int class_id) {
	
		return mapper.delete(class_id) ;
	}
//class 조회수
	@Override
	public void updateViewCnt(int class_id) {
		mapper.updateViewCnt(class_id);
		
	}
	



}