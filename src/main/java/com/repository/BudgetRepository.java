package com.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.BudgetEntity;
import com.entity.ExpenseEntity;

@Repository
public class BudgetRepository {

	@Autowired
	JdbcTemplate stmt;
	
	public void saveBudget(BudgetEntity budget) {
		String query = "Insert into budget (category, amount, month, userId) VALUES (?,?,?,?)";
		stmt.update(query,budget.getCategory(),budget.getAmount(),budget.getMonth(),budget.getUserId());
	}

	public List<BudgetEntity> findBudgetsByUser(Integer userId) {
		String query = "SELECT * FROM budget WHERE userId = ?";
        return stmt.query(query, new BeanPropertyRowMapper<>(BudgetEntity.class), userId);
	}
	
	public List<String> findDistinctCategoriesByUser(Integer userId) {
	    String query = "SELECT DISTINCT category FROM budget WHERE userId = ?";
	    return stmt.queryForList(query, String.class, userId);
	}

	public List<String> findDistinctMonthsByUser(Integer userId) {
	    String query = "SELECT DISTINCT month FROM budget WHERE userId = ?";
	    return stmt.queryForList(query, String.class, userId);
	}


	// to return the list of Expense and amount spent in that category like food From expenses table
	public List<ExpenseEntity> budgetinfocategory(String category, String month, Integer userId) {
	    String query = "SELECT * FROM expenses WHERE userId = ? AND category = ? AND TO_CHAR(expensedate, 'YYYY-MM') = ?";
	    return stmt.query(query, new BeanPropertyRowMapper<>(ExpenseEntity.class), userId, category, month);
	}

	// To return the budget for that category and month from Budget table
	public BudgetEntity budgetinfo(String category, String month, Integer userId) {
		 String query = "SELECT * FROM budget WHERE userId = ? AND category = ? and month = ?";
		return stmt.queryForObject(query,new BeanPropertyRowMapper<>(BudgetEntity.class), userId, category, month);
	}

	public BudgetEntity budgetamount(Integer userId, String category,String month) {
		 String query = "select category,amount from budget where category = ? and userid = ? and month = ?";
		 return stmt.queryForObject(query,new BeanPropertyRowMapper<>(BudgetEntity.class),category,userId,month);
		
	}

	public ExpenseEntity expensecategoryamount(Integer userId, String category,String month) {
		String query = "select category,sum(amount) as amount from expenses where userid = ? and category = ? and TO_CHAR(expensedate, 'YYYY-MM') = ?  group by category";
		return stmt.queryForObject(query,new BeanPropertyRowMapper<>(ExpenseEntity.class),userId,category,month);
	}

	public BudgetEntity getbudgetinfo(Integer budgetId) {
		String query = "select * from budget where budgetId = ?";
		return stmt.queryForObject(query,new BeanPropertyRowMapper<>(BudgetEntity.class),budgetId);
	}

	public void updatebudgetinfo(BudgetEntity budget) {
		String query = "UPDATE budget SET category = ?, amount = ?, month = ?, userId = ? WHERE budgetId = ?";
		stmt.update(query,budget.getCategory(),budget.getAmount(),budget.getMonth(),budget.getUserId(),budget.getBudgetId());
	}

	public void deletebudget(Integer budgetId) {
		String query = "delete from budget where budgetId = ? ";
		stmt.update(query,budgetId);
	}
	
	
}
