<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Expense Tracker</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        body {
            display: flex;
            flex-direction: column;
        }
        .content {
            flex: 1;
        }
        .feature-card {
            transition: transform 0.3s;
        }
        .feature-card:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <jsp:include page="Navbar.jsp" />

    <!-- Main Content -->
    <div class="content">
        <div class="container mt-5">
            <h2 class="text-center mb-4 text-info">Welcome to ExpenseTracker Dashboard</h2>
            <div class="row row-cols-1 row-cols-md-3 g-4">
               <!-- Feature 1: Add Expense -->
        <div class="col">
            <div class="card feature-card shadow-sm border-info">
                <div class="card-body">
                    <h5 class="card-title text-primary">Add Expenses</h5>
                    <p class="card-text">Quickly add your daily expenses with category, amount, and description to stay on track.</p>
                </div>
            </div>
        </div>

        <!-- Feature 2: Manage Expense -->
        <div class="col">
            <div class="card feature-card shadow-sm border-success">
                <div class="card-body">
                    <h5 class="card-title text-success">Manage Expenses</h5>
                    <p class="card-text">View, update, or delete your past expenses. Keep your records clean and accurate.</p>
                </div>
            </div>
        </div>

        <!-- Feature 3: Expense Summary -->
        <div class="col">
            <div class="card feature-card shadow-sm border-warning">
                <div class="card-body">
                    <h5 class="card-title text-warning">Expense Summary</h5>
                    <p class="card-text">Analyze your monthly and category-wise spending with a neat, summarized report.</p>
                </div>
            </div>
        </div>

        <!-- Feature 4: Budget Planning -->
        <div class="col">
            <div class="card feature-card shadow-sm border-danger">
                <div class="card-body">
                    <h5 class="card-title text-danger">Budget Planning</h5>
                    <p class="card-text">Set spending limits and track how well you're managing your monthly budget goals.</p>
                </div>
            </div>
        </div>

        <!-- Feature 5: Secure Access -->
        <div class="col">
            <div class="card feature-card shadow-sm border-secondary">
                <div class="card-body">
                    <h5 class="card-title text-secondary">Secure Access</h5>
                    <p class="card-text">Your data is safe with login-based access and session tracking for enhanced security.</p>
                </div>
            </div>
        </div>

        <!-- Feature 6: Visual Insights -->
        <div class="col">
            <div class="card feature-card shadow-sm border-info">
                <div class="card-body">
                    <h5 class="card-title text-info">Visual Insights</h5>
                    <p class="card-text">Gain visual insights with charts and graphs to understand your spending patterns.</p>
                </div>
            </div>
        </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="Footer.jsp" />

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
