<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<!-- Bootstrap CSS (use CDN or local path) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold text-info" href="#">
            <img src="https://cdn-icons-png.flaticon.com/512/2164/2164353.png" width="30" height="30" class="d-inline-block align-text-top me-2" alt="Logo">
            ExpenseTracker
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
            aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarContent">
            <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link text-info" href="addexpense">Add Expense</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-info" href="manage-expense">Manage Expense</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-info" href="expensesummary">Expense Summary</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-info" href="searchbycategory">CategoryExpense</a>
                </li>

                <!-- Budget Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-info" href="#" id="budgetDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Budget
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="budgetDropdown">
                        <li><a class="dropdown-item" href="addbudget">Add Budget</a></li>
                        <li><a class="dropdown-item" href="filterbybudget">Filter by Budget</a></li>
                        <li><a class="dropdown-item" href="listbudget">List Budget</a></li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-info" href="${pageContext.request.contextPath}/logout">Logout</a>
                </li>
                <li class="nav-item d-flex align-items-center ms-2">
                    <span class="text-light"><c:out value="${sessionScope.user.firstName} ${sessionScope.user.lastName}"/></span>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Bootstrap JS (includes Popper.js) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
