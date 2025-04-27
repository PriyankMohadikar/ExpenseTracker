<%-- sidebar.jsp --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="sidebar" class="sidebar">
    <ul class="list-group">
        <!-- Link to Add Expense Page -->
        <li class="list-group-item">
            <a href="${pageContext.request.contextPath}/add-expense" class="sidebar-link">Add Expense</a>
        </li>
        <!-- Link to Manage Expense Page -->
        <li class="list-group-item">
            <a href="${pageContext.request.contextPath}/manage-expense" class="sidebar-link">Manage Expense</a>
        </li>
        <!-- Link to Expense Summary Page -->
        <li class="list-group-item">
            <a href="${pageContext.request.contextPath}/expense-summary" class="sidebar-link">Expense Summary</a>
        </li>
        <li class="list-group-item">
        <a href="logout">LogOut</a>
	
	<h3>${sessionScope.user.firstName}</h3>
	<h3>${sessionScope.user.lastName}</h3>
        </li>
        
        
    </ul>
</div>

<style>
    #sidebar {
        width: 250px;
        height: 100%;
        background-color: #f4f4f4;
        padding-top: 20px;
        position: fixed;
    }
    .sidebar-link {
        display: block;
        padding: 10px;
        text-decoration: none;
        color: #333;
    }
    .sidebar-link:hover {
        background-color: #ddd;
    }
    .list-group-item {
        padding: 0;
    }
</style>
