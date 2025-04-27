package com.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.entity.UserEntity;
import com.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;



@Controller
public class sessioncontroller {

	@Autowired
	UserRepository userRepository;
	
	@GetMapping("signup")
	public String signUp() {
		return "Signup";
	}
	
	@PostMapping("saveuser")
	public String saveUser(UserEntity user) {
		user.setRole("USER");
		user.setCreatedAt(new Date());
		userRepository.saveUser(user);
		return "Login";
	}
	
	// during login
	@PostMapping("authenticate")
	public String loginLogic(String email,String password,HttpSession session,Model model) {
		UserEntity user = userRepository.loginAuth(email, password);
//		model.addAttribute("user", user);
		session.setAttribute("user", user);
		return "redirect:/dashboard";
	}
	
	@GetMapping("dashboard")
	public String dashBoard() {
		return "Dashboard";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "Login";
	}
	
	
	
	
	
}
