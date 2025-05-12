<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <!-- Navbar -->
    <jsp:include page="Navbar.jsp" />
    <div class="container mt-5">
        <h2 class="text-center mb-4">Expense List</h2>
        <c:if test="${not empty expenses}">
            <table class="table table-striped table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Title</th>
                        <th>Vendor</th>
                        <th>Category</th>
                        <th>Amount</th>
                        <th>Payment Mode</th>
                        <th>Expense Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="expense" items="${expenses}">
                        <tr>
                            <td>${expense.title}</td>
                            <td>${expense.vendor}</td>
                            <td>${expense.category}</td>
                            <td>${expense.amount}</td>
                            <td>${expense.paymentMode}</td>
                            <td>
                                <fmt:formatDate value="${expense.expenseDate}" pattern="yyyy-MM-dd"/>
                            </td>
                            <td>
                            <a href="deleteexpense?expenseId=${expense.expenseId}" class="btn btn-primary">Delete</a> |
                            <a href="editexpense?expenseId=${expense.expenseId}" class="btn btn-success">Edit</a>
                             </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty expenses}">
            <div class="alert alert-info text-center" role="alert">
                No expenses found.
            </div>
        </c:if>
    </div>

    <!-- Bootstrap JS and Popper.js (for Bootstrap components that need JS) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>