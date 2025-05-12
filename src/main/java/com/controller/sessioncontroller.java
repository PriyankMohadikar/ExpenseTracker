package com.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.entity.UserEntity;
import com.password4j.Hash;
import com.password4j.Password;
import com.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

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
		System.out.println(user.getPassword());
		Hash hash = Password.hash(user.getPassword()).addRandomSalt(5).withArgon2();
		System.out.println(hash.getResult());
		user.setPassword(hash.getResult());
		userRepository.saveUser(user);
		return "Login";
	}

	// during login
	@PostMapping("authenticate")
	public String loginLogic(String email, String password, HttpSession session, Model model) {

		UserEntity user = userRepository.findUserByMail(email);

		if (user != null && Password.check(password, user.getPassword()).withArgon2()) {
			session.setAttribute("user", user);
			return "redirect:/dashboard";
		} else {
			return "redirect:/login";
		}

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

	@GetMapping("login")
	public String loginpage() {
		return "Login";
	}

}
