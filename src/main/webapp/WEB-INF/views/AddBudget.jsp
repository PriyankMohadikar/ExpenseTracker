<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Budget</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Add Budget</h2>
        <form action="savebudget" method="post">
            <!-- Hidden field for userId from session -->
            <input type="hidden" name="userId" value="${sessionScope.user.userId}">

            <div class="mb-3">
                <label for="category" class="form-label">Category</label>
                <input type="text" class="form-control" id="category" name="category" placeholder="e.g., Food" required>
            </div>
            <div class="mb-3">
                <label for="amount" class="form-label">Budget Amount</label>
                <input type="number" step="0.01" class="form-control" id="amount" name="amount" placeholder="e.g., 1500" required>
            </div>
            <div class="mb-3">
                <label for="month" class="form-label">Month (YYYY-MM)</label>
                <input type="text" class="form-control" id="month" name="month" placeholder="e.g., 2025-05" pattern="\d{4}-\d{2}" required>
            </div>
            <button type="submit" class="btn btn-primary">Save Budget</button>
            <a href="/dashboard" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>