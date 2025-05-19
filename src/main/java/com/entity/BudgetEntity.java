package com.entity;

import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BudgetEntity {

	Integer budgetId;
	String category;
	Float amount;
	String month; // Format: YYYY-MM (e.g., "2025-05")
	Integer userId;

}
