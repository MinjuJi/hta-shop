package com.sample.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.sample.exception.AlreadyUsedEmailException;
import com.sample.exception.AlreadyUsedIdException;
import com.sample.mapper.UserMapper;
import com.sample.vo.User;
import com.sample.web.form.UserRegisterForm;

import lombok.RequiredArgsConstructor;

/*
 * @RequiredArgsConstructor
 * - 초기화가 필요한 멤버변수를 매개변수로 가지는 생성자 메소드를 자동으로 추가한다.
 * - 스프링에서 의존성 주입이 필요한 멤버변수에 final 키워드를 지정하고 @RequiredArgsConstructor를 클래스에 추가하면 스프링 컨테이너가 자동으로 의존성을 주입한다.
 */
@Service
@RequiredArgsConstructor
public class UserService {
	// 회원가입 시 비밀번호 암호화를 위해서 PasswordEncoder 구현 객체를 주입받는다.
	private final PasswordEncoder passwordEncoder;
	private final UserMapper userMapper;
	/* 위와 동일한 코드
	 
		@Service
		public class User Service{
			@Autowired
			private UserMapper userMapper;
		}
		
	*/
	
	public User getUser(String id) {
		return userMapper.getUserById(id);
	}

	public void registerUser(UserRegisterForm form) {
		User foundUser = userMapper.getUserById(form.getId());
		
		if(foundUser != null) {
			throw new AlreadyUsedIdException("[" + form.getId() + "] 이미 사용중인 아이디입니다.");
		}
		
		foundUser = userMapper.getUserByEmail(form.getEmail());
			if(foundUser != null) {
			throw new AlreadyUsedEmailException("[" + form.getEmail() + "] 이미 사용중인 이메일입니다.");
		}
			
			User user = form.toUser();
			// 비밀번호 암호화
			String secretPassword = passwordEncoder.encode(user.getPassword());
			user.setPassword(secretPassword);
			
			userMapper.insertUser(user);
	}
}