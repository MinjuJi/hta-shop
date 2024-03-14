package com.sample.web.controller;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.service.UserService;
import com.sample.vo.User;
import com.sample.web.dto.UserDto;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasRole('ROLE_ADMIN')")
@RequiredArgsConstructor
public class AdminController {
	
	private final UserService userService;
	
	@GetMapping("/home")
	public String home() {
		return "admin/home";
	}
	
	// 상품관리에서 상품 목록화면 요청을 처리하는 요청핸들러 메소드
	@GetMapping("/product/list")
	public String products() {
		return "admin/product/list";
	}
	
	// 상품관리에서 상품 등록화면 요청을 처리하는 요청핸들러 메소드
	@GetMapping("/product/create")
	public String productform() {
		return "admin/product/form";
	}
	
	// 상품관리에서 상품 등록 요청을 처리하는 요청핸들러 메소드
	@PostMapping("/product/create")
	public String createProduct() {
		return "redirect:/admin/product/list";
	}
	
	@GetMapping("/user/list")
	public String users(Model model) {
		List<User> users = userService.getAllUsers();
		model.addAttribute("users", users);
		
		return "admin/user/list";
	}
	
	@GetMapping("/users/{userId}")
	@ResponseBody
	public UserDto user(@PathVariable("userId") String userId) {
		User user = userService.getUser(userId);
		UserDto dto = new UserDto();
		
		BeanUtils.copyProperties(user, dto);
		return dto;
	}
}
