package com.vam.model;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	private int order_no;
	private Date orderdate;
	private String id,customer, contact, phone,
				   addr1, addr2, addr3, memo, select_box, 
				   product_name, quantity, price, shipping_price;
	
}
