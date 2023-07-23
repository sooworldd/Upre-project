package com.vam.model;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsVO {

private	String name;

private int price;

private String img;

private Date regdate,updatedate;
	
}


