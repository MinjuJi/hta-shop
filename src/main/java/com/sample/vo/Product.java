package com.sample.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Product {

	private int no;
	private String name;
	private String description;
	private int stock;
	private String status;
	private int price;
	private String filename;
	private Date updatedDate;
	@JsonFormat(pattern = "yyyy년 M월 d일")
	private Date createdDate;
	private Company company;
	private ProductCategory category;
}
