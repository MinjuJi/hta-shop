package com.sample.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.Order;
import com.sample.web.dto.OrderListDto;

@Mapper
public interface OrderMapper {
	
	void insetOrder(Order oredr);
	List<OrderListDto> getOrdersByUserNo(int userNo);
	Order getOrderByNo(int orderNo);
}
