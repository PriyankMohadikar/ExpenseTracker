<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Budget</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>
<body>

<!-- Navbar -->
<jsp:include page="Navbar.jsp" />

<form action="updatebudget" method="post" class="p-4 bg-light rounded shadow-sm">
  <h4 class="mb-4">Update Budget</h4>

  <!-- Hidden Fields -->
  <input type="hidden" name="budgetId" value="${budget.budgetId}" />
  <input type="hidden" name="userId" value="${budget.userId}" />

  <!-- Category -->
  <div class="mb-3">
    <label for="category" class="form-label">Category</label>
    <input type="text" class="form-control" id="category" name="category" value="${budget.category}" required>
  </div>

  <!-- Amount -->
  <div class="mb-3">
    <label for="amount" class="form-label">Amount</label>
    <input type="number" step="0.01" class="form-control" id="amount" name="amount" value="${budget.amount}" required>
  </div>

  <!-- Month (YYYY-MM) -->
  <div class="mb-3">
    <label for="month" class="form-label">Month</label>
    <input type="month" class="form-control" id="month" name="month" value="${budget.month}" required>
  </div>

  <button type="submit" class="btn btn-dark">Update Budget</button>
</form>

<!-- Footer -->
<jsp:include page="Footer.jsp" />

</body>
</html>
