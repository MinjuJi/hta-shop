package com.sample.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.Order;

@Mapper
public interface OrderMapper {
	
	void insetOrder(Order oredr);
	List<Order> getOrdersByUserNo(int userNo);
	Order getOrderByNo(int orderNo);
}
