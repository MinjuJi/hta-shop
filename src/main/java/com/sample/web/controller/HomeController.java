package com.sample.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sample.exception.AlreadyUsedEmailException;
import com.sample.exception.AlreadyUsedIdException;
import com.sample.service.UserService;
import com.sample.vo.User;
import com.sample.web.form.UserRegisterForm;

import javax.validation.Valid;
import lombok.RequiredArgsConstructor;

@Controller
/*
 * @Log4j2
 * 		- 로그출력을 지원하는 어노테이션이다.
 * 		- 클래스에 아래의 코드를 추가한다.
 *   		private static final Logger log = LogManager.getLogger(HomdeController.class);
 * 		- 요청핸들러 메소드에서는 아래의 메소드를 이용해서 로그를 출력할 수 있다.
 *	 		log.debug(메시지);
 * 			log.info(메시지);
 * 			log.error(메시지);
 * 		- System.out.prinln() 대신 반드시 log를 사용하자.
 */
@RequiredArgsConstructor
public class HomeController {
	
	private final UserService userService;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/register")
	public String form(Model model) {
		model.addAttribute("userRegisterForm", new UserRegisterForm());
		return "form";
	}
	
	@PostMapping("/register")
	public String register(@Valid UserRegisterForm form, BindingResult errors, RedirectAttributes redirectAttributes) {
		
		// 폼 입력값 유효성 체크를 통과하지 못한 경우, 회원가입화면으로 내부이동시킨다.
		if(errors.hasErrors()) {
			return "form";
		}
		
		try {
			// 폼 입력값 유효성 체크를 통과한 경우
			User user = userService.registerUser(form);
			redirectAttributes.addFlashAttribute("user", user);
			
		} catch(AlreadyUsedIdException e) {
			// rejectValue(필드명, 에러코드, 에러메시지) 메소드는 BindginfResult 객체에 FieldError를 추가한다.
			errors.rejectValue("id", null, e.getMessage());
			return "form";
			
		} catch(AlreadyUsedEmailException e) {
			errors.rejectValue("email", null, e.getMessage());
			return "form";
		}
		
		return "redirect:/completed";
	}
	
	@GetMapping("/completed")
	public String completed() {
		return "completed";
	}
	
	/*
	 *  요청방식
	 *  		GET
	 *  요청URL
	 *  		localhost/login
	 *  요청내용
	 *  		로그인폼 화면을 요청한다.
	 *  처리내용
	 *  		뷰페이지(로그인 폼 화면, loginform.jsp)이름을 반환한다.
	 */
	@GetMapping("/login")
	public String loginform() {
		return "loginform";
	}
	
	
	@GetMapping("/accessdenied")
	public String accessDenied() {
		return "error/denied";
	}
}
