package com.entity;

import java.util.Date;

import lombok.Data;

@Data
public class UserEntity {

	
		private int userId;
	    private String firstName;
	    private String lastName;
	    private String email;
	    private String password;
	    private String gender;
	    private String role;
	    private Date createdAt;
}
