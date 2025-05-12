package com.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.ExpenseEntity;
import com.entity.UserEntity;

@Repository
public class ExpenseRepository {

	@Autowired
	JdbcTemplate stmt;

	// Save User Expenses Data
	public void saveExpenses(ExpenseEntity expense) {
		String query = "INSERT INTO expenses (title,vendor,category,amount,paymentMode,expenseDate,userId) VALUES (?, ?, ?, ?, ?, ?, ?)";
		stmt.update(query, expense.getTitle(), expense.getVendor(), expense.getCategory(), expense.getAmount(),
				expense.getPaymentMode(), expense.getExpenseDate(), expense.getUserId());
	}

	// User can view his own data
	public List<ExpenseEntity> listExpenses(Integer userId) {
		String query = "select * from expenses where userId = ?";
		List<ExpenseEntity> expenses = stmt.query(query, new BeanPropertyRowMapper<>(ExpenseEntity.class), userId);
		return expenses;
	}

	// Delete Expense
	public void deleteExpense(Integer expenseId) {
		String query = "delete from expenses where expenseId = ?";
		stmt.update(query, expenseId);
	}

	// get info about the expense
	public ExpenseEntity getExpenseInfo(Integer expenseId) {
		String query = "select * from expenses WHERE expenseId = ?";
		ExpenseEntity expense = (ExpenseEntity) stmt.queryForObject(query, new BeanPropertyRowMapper<>(ExpenseEntity.class),
				expenseId);
		return expense;
	}

	// Update/Edit The Expense
	public void editExpense(ExpenseEntity expense) {
		String query = "UPDATE expenses SET title = ?, category = ?, vendor = ? ,amount = ? , paymentMode = ? , expenseDate = ?, userId = ? WHERE expenseId = ?";
		stmt.update(query, expense.getTitle(), expense.getCategory(), expense.getVendor() ,expense.getAmount(), expense.getPaymentMode(),
				expense.getExpenseDate(), expense.getUserId(), expense.getExpenseId());
	}
	
	public List<ExpenseEntity> expenseSummary(Integer userId) {
		String query = "select category,sum(amount) as amount from expenses where userid = ? group by category;";
		List<ExpenseEntity> expenses = stmt.query(query, new BeanPropertyRowMapper<>(ExpenseEntity.class), userId);
		return expenses;
	}

}
