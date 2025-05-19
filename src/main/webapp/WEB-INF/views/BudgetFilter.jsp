<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Filter by Budget</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Filter Expenses by Budget</h2>
        <form action="budgetwisefilter" method="post">
            
            <!-- Category Dropdown -->
            <div class="mb-3">
                <label for="category" class="form-label">Category</label>
                <select class="form-control" id="category" name="category" required>
                    <option value="" disabled selected>Select a category</option>
                    <c:forEach var="cat" items="${category}">
                        <option value="${cat}">${cat}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Month Dropdown -->
            <div class="mb-3">
                <label for="month" class="form-label">Month (YYYY-MM)</label>
                <select class="form-control" id="month" name="month" required>
                    <option value="" disabled selected>Select a month</option>
                    <c:forEach var="m" items="${month}">
                        <option value="${m}">${m}</option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Filter</button>
            <a href="/dashboard" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
