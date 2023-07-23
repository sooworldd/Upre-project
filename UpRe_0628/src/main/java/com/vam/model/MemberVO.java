package com.vam.model;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private String id, pw, name, nickname, gender, birth, phone, mail, addr1, addr2, addr3, lev ;
	private Date joindate;
}
