package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.ExpenseEntity;
import com.entity.UserEntity;
import com.repository.ExpenseRepository;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestBody;



@Controller
public class ExpenseController {

	@Autowired
	ExpenseRepository expenseRepository;
	
	@GetMapping("addexpense")
	public String getMethodName() {
		return "AddExpenses";
	}
	
	//user can save the expenses - Add
	@PostMapping("saveexpense")
	public String postMethodName(ExpenseEntity expense,HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		expense.setUserId(user.getUserId());
		expenseRepository.saveExpenses(expense);
		return "AddExpenses";
	}
	
	
	// User can view can there own expenses list - View
	@GetMapping("manage-expense")
	public String manageExpenses(HttpSession session,Model model) {
		UserEntity user = (UserEntity)session.getAttribute("user");
		Integer userId = user.getUserId();
		List<ExpenseEntity> expenses = expenseRepository.listExpenses(userId);
		model.addAttribute("expenses", expenses);
		return "ListExpenses";
	}
	
	// User can delete there expenses - Delete
	@GetMapping("deleteexpense")
	public String deleteExpense(Integer expenseId) {
		expenseRepository.deleteExpense(expenseId);
		return "redirect:/manage-expense";
	}
	
	// Open the form For Update - Edit
	@GetMapping("editexpense")
	public String editExpenseForm(Model model,Integer expenseId) {
		ExpenseEntity expense = expenseRepository.getExpenseInfo(expenseId);
		model.addAttribute("expense", expense);
		return "EditForm";
	}
	
	@PostMapping("updateexpense")
	public String updateExpense(ExpenseEntity expense) {
		expenseRepository.editExpense(expense);
		return "redirect:/manage-expense";
	}
	
	// Category Wise Summary - GroupBy
	@GetMapping("expensesummary")
	public String categoryExpenseSummary(HttpSession session,Model model) {
		UserEntity user = (UserEntity)session.getAttribute("user");
		Integer userId = user.getUserId();
		List<ExpenseEntity> expenses = expenseRepository.expenseSummary(userId);
		model.addAttribute("expenses", expenses);
		return "ExpenseSummary";
	}
	
	//Search By Category For Particular user
	@GetMapping("searchbycategory")
	public String searchByCategory() {
		return "CategoryInfo";
	}
	
	@PostMapping("categorywiseexpense")
	public String categoryWiseSearch(HttpSession session,String category,Model model) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		Integer userId1 = user.getUserId();
		List<ExpenseEntity> expenses = expenseRepository.categorywiseexpense(userId1,category);
		model.addAttribute("expenses", expenses);
		return "ListExpenses";
	}
	
		
	
	
}
