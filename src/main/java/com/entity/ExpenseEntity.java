package com.entity;

import java.util.Date;

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
	String expenseDate;
	Integer userId;
	
	
}
