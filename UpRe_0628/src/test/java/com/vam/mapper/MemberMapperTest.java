package com.vam.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vam.model.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTest {

	@Autowired
	private MemberMapper memberMapper;
/*
	@Test
	public void memberJoin() throws Exception {

		MemberVO member = new MemberVO();

		member.setId("test1");
		member.setPw("1111");
		member.setName("test");
		member.setNickname("test");
		member.setGender("test");
		member.setPhone("test");
		member.setBirth("test");
		member.setAddr1("test");
		member.setAddr2("test");
		member.setAddr3("test");
		
		

		memberMapper.MemberJoin(member);
	}
	*/
	/*
	@Test
	public void idCheck() throws Exception{
		String id = "gd";
		memberMapper.idCheck(id);
		
		
	}
	*/
	/* 로그인 쿼리 mapper 메서드 테스트 */
   /*
    @Test
    public void idSearch() throws Exception{
        
        MemberVO member = new MemberVO();    // MemberVO 변수 선언 및 초기화
        
        /* 올바른 아이디 비번 입력경우 
        member.setName("정주호");
        member.setMail("tatittato@naver.com");
        
        /* 올바른 않은 아이디 비번 입력경우 
        //member.setId("test1123");
       // member.setPw("test1321321");
        
        memberMapper.idSearch(member);
        System.out.println("결과 값 : " + memberMapper.idSearch(member));
        
    }
*/
	
	@Test
	public void pwReplaceTest() {
	    MemberVO member = new MemberVO();

	    // 변경하려는 회원의 아이디를 설정합니다.
	    member.setId("wngh0225");

	    // 새로운 비밀번호를 설정합니다.
	    member.setPw("@qaz5356");

	    // 비밀번호를 변경합니다.
	    memberMapper.pwReplace(member);

	    // 변경된 비밀번호를 확인하기 위해 다시 회원 정보를 불러옵니다.
	    MemberVO updatedMember = memberMapper.pwSearch(member);

	    // 변경된 비밀번호를 출력합니다.
	    System.out.println("Changed password: " + updatedMember.getPw());
	}
}