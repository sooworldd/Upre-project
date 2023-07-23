package com.vam.mapper;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vam.model.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTest {

    @Autowired
    private AdminMapper adminMapper;
/*//회원목록 보기
    @Test
    public void memberListTest() {
        MemberVO member = new MemberVO();
        List<MemberVO> memberList = adminMapper.memberList(member);
        assertNotNull(memberList);  // This line will fail if memberList is null
        for (MemberVO m : memberList) {
            System.out.println(m);  // This line will print the details of each member
        }
    }
    */
    /*//회원상세 보기
    @Test
	public void memberDetailTest() {
		String id = "wngh0225"; // 테스트하려는 id를 입력하세요
		MemberVO member = adminMapper.memberDetail(id);
		System.out.println(member);
	}
	*/
    
    
    @Test
    public void memberDeleteTest() {
        String id ="wngh0225";

        // 먼저 id에 해당하는 회원 정보가 있는지 확인
        MemberVO member = adminMapper.memberDetail(id);
        

        // 회원 정보 삭제
        adminMapper.memberDelete(id);

       System.out.println(member);
       
        
    }

    
}