<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.warning {
	color: red;
	position: fixed;
	top: 5px;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
	font-size: 2.5rem;
	color: #007bff;
}

.header {
	display: flex;
	padding-bottom: 20px;
	justify-content: center;
}

button {
	margin-top: 10px;
	padding: 13px 20px;
	background: linear-gradient(345deg, rgb(12 64 197), #34c0c2);
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: fit-content;
}

@media only screen and (orientation: portrait) {
	h1 {
		color: red;
		font-size: 8rem;
		margin-top: 100px;
	}
	a {
		display: block;
	}
	.header {
		padding-bottom: 20px;
		justify-content: center;
	}
	button {
		width: 100%;
		padding: 13px 20px;
		padding: 30px 100px;
		font-size: 3rem;
		margin-top: 50px;
	}
}
</style>

</head>

<body>
	<%
	String errorMessage = (String) request.getAttribute("msg");
	if (errorMessage != null && !errorMessage.isEmpty()) {
	%>
	<span class="warning"><%=errorMessage%></span>
	<%
	}
	%>
	<h1 id="heading">Employee Management</h1>
	<div class="header">
		<div class="searchsection">
			<a href="InsertApp"><button type="button" id="create">Create Employee</button></a>
			<a href="SearchApp"><button type="button" id="create">Search Employee</button></a> 
			<a href="EditApp"><button type="button" id="create">Edit Eployee</button></a>
			<a href="ShowAllApp"><button type="button" id="create">Show All Employee</button></a> 
			<a href="DeleteEmpApp"><button type="button" id="create">Delete Employee</button></a>
		</div>
	</div>
</body>
</html>