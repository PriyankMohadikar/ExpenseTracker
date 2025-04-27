package com.repository;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.UserEntity;

@Repository
public class UserRepository {

	@Autowired
	JdbcTemplate stmt;
	
// during sign up save user data 
	public void saveUser(UserEntity user) {
		String query = "INSERT INTO users (firstname, lastname, email, password, gender, role, createdat) VALUES (?, ?, ?, ?, ?, ?, ?)";
		stmt.update(query, user.getFirstName(), user.getLastName(), user.getEmail(), user.getPassword(),
				user.getGender(), user.getRole(), user.getCreatedAt());
	}
	
	//Login Authenticate logic
	public UserEntity loginAuth(String email,String password) {
		String query = "select * from users where email = ? and password = ?";
		UserEntity user = stmt.queryForObject(query,new BeanPropertyRowMapper<>(UserEntity.class),email,password);
		return user;
	}
	
}
