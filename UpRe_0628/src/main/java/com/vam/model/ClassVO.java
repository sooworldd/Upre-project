package com.vam.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class ClassVO {
	//private MultipartFile thumbnailImgFile;
	//private MultipartFile detailedImageFile;
	private int class_id;
	private String class_img;
	
	private String class_name;
    private String class_content;
	private String class_peopleno;
	private Date reg_date;
	private Date update_date;
	
	/*조회수 */
    private int view_cnt;
}



