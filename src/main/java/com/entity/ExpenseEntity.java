package com.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ExpenseEntity {

	Integer expenseId;
	String title;
	String vendor;
	String category;
	Float amount;
	String paymentMode;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date expenseDate;
	Integer userId;
	
	
}
