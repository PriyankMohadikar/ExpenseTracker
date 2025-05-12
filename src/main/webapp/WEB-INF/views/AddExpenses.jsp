<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>
<body>


    <!-- Navbar -->
    <jsp:include page="Navbar.jsp" />

<form action="saveexpense" method="post" class="p-4 bg-light rounded shadow-sm">
  <h4 class="mb-4">Add New Expense</h4>
  
  <div class="mb-3">
    <label for="title" class="form-label">Title</label>
    <input type="text" class="form-control" id="title" name="title" required>
  </div>

  <div class="mb-3">
    <label for="vendor" class="form-label">Vendor</label>
    <input type="text" class="form-control" id="vendor" name="vendor" required>
  </div>

  <div class="mb-3">
    <label for="category" class="form-label">Category</label>
    <input type="text" class="form-control" id="category" name="category" required>
  </div>

  <div class="mb-3">
    <label for="amount" class="form-label">Amount</label>
    <input type="number" step="0.01" class="form-control" id="amount" name="amount" required>
  </div>

  <div class="mb-3">
    <label for="paymentMode" class="form-label">Payment Mode</label>
    <select class="form-select" id="paymentMode" name="paymentMode" required>
      <option selected disabled>Choose...</option>
      <option value="Cash">Cash</option>
      <option value="Card">Card</option>
      <option value="UPI">UPI</option>
      <option value="Online">Online</option>
    </select>
  </div>

  <div class="mb-3">
    <label for="expenseDate" class="form-label">Expense Date</label>
    <input type="date" class="form-control" id="expenseDate" name="expenseDate" required>
  </div>

  <button type="submit" class="btn btn-primary">Add Expense</button>
</form>


    <!-- Navbar -->
    <jsp:include page="Footer.jsp" />

</body>
</html>