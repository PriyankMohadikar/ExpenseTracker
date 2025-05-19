package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.entity.BudgetEntity;
import com.entity.ExpenseEntity;
import com.entity.UserEntity;
import com.repository.BudgetRepository;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class BudgetController {

	@Autowired
	BudgetRepository budgetRepository;

	// to open a Add Budget Form
	@GetMapping("addbudget")
	public String openAddBudget() {
		return "AddBudget";
	}

	// to save budget of the user 
	@PostMapping("savebudget")
	public String saveBudget(BudgetEntity budgetEntity) {
		budgetRepository.saveBudget(budgetEntity);
		return "redirect:/addbudget";
	}
	
	// To List all User Made Budget
		@GetMapping("listbudget")
		public String listBudgets(HttpSession session,Model model) {
			UserEntity user = (UserEntity) session.getAttribute("user");
			Integer userId = user.getUserId();
			List<BudgetEntity> budgets = budgetRepository.findBudgetsByUser(userId);
			model.addAttribute("budgets", budgets);
			return "Budgetlist";
		}

	// TO open a Filter Form 
	@GetMapping("filterbybudget")
	public String openBudgetFilter(HttpSession session, Model model) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		Integer userId = user.getUserId();
//		List<BudgetEntity> budgets = budgetRepository.findBudgetsByUser(userId);
		List<String> category = budgetRepository.findDistinctCategoriesByUser(userId);
		List<String> month = budgetRepository.findDistinctMonthsByUser(userId);
		model.addAttribute("category", category);
		model.addAttribute("month", month);
		return "BudgetFilter";
	   }
	
	// For particular category budget and expense information
	@PostMapping("budgetwisefilter")
	public String budgetFilterOutput(String category,String month,HttpSession session,Model model) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		Integer userId = user.getUserId();
		//total amount spent in Expenses table
		ExpenseEntity expenseamount = budgetRepository.expensecategoryamount(userId,category,month);
		//Budget amount for that category
		BudgetEntity budget = budgetRepository.budgetinfo(category, month, userId);
		// List of expenses for the category and month
		List<ExpenseEntity> expenses = budgetRepository.budgetinfocategory(category,month,userId);
		model.addAttribute("expenses", expenses);
		model.addAttribute("budget", budget);
		model.addAttribute("expenseamount", expenseamount);
		return "ListExpenses";
	}
	
	
	// Edit Budget from list of Budgets
	@GetMapping("editbudget")
	public String editbudgetInfo(Integer budgetId,HttpSession session,Model model) {
		BudgetEntity budget = budgetRepository.getbudgetinfo(budgetId); 
		model.addAttribute("budget", budget);
		return "BudgetEditForm";
	}
	
	//Update the budget info
	@PostMapping("updatebudget")
	public String updateBudgetInfo(BudgetEntity budget) {
		budgetRepository.updatebudgetinfo(budget);
		return "redirect:/listbudget";
	}
	
	//delete Budget from Budget list
	@GetMapping("deletebudget")
	public String deleteBudget(Integer budgetId) {
		budgetRepository.deletebudget(budgetId);
		return "redirect:/listbudget";
	}
	

}
