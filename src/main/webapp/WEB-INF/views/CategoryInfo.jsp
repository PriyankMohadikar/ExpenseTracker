<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<body>

 <!-- Navbar -->
    <jsp:include page="Navbar.jsp" />


	<div class="container mt-5">
		<h2 class="mb-4">Search Category Wise Expense</h2>
		<form action="categorywiseexpense" method="post">

			<div class="mb-3">
				<label for="category" class="form-label">Category</label> <input
					type="text" class="form-control" id="category" name="category"
					required>
			</div>


			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
		<br>
		

	</div>
	

</body>
</html>