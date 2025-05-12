<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4">
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
                <a class="nav-link text-info" href="add-expense">Add Expense</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-info" href="manage-expense">Manage Expense</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-info" href="expensesummary">Expense Summary</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-info" href="logout">Logout</a>
            </li>
            <li class="nav-item d-flex align-items-center ms-2">
                <span class="text-light">${sessionScope.user.firstName} ${sessionScope.user.lastName}</span>
            </li>
        </ul>
    </div>
</nav>

<!-- Bootstrap JS (required for navbar toggle) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
