<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<style>
button {
	margin-top: 30px;
	padding: 13px 20px;
	margin-left: 20px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: fit-content;
}

#del-btn {
	background-color: red;
}

button[type="button"] {
	background-color: #ccc;
}

button[type="button"]:hover {
	background-color: #007bff;
}

.searchsection {
	display: flex;
}

#contact-serch {
	width: 60%;
	padding: 13px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin: 30px 10px 10px 10px;
}

.star {
	color: red;
}

.warning {
	color: red;
	position: fixed;
	top: 5px;
}

.attribute-box {
	border: 1px solid #ccc;
	margin: 10px 10px 10px 10px;
	padding: 10px;
	background-color: #f9f9f9;
}

.attribute-box .value {
	color: red;
}

.attribute-box label {
	font-weight: bold;
	margin-bottom: 5px;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
	font-size: 2.5rem;
	color: #007bff;
}

.buttons {
	display: flex;
}

@media only screen and (orientation: portrait) {
	h1 {
		font-size: 7rem;
	}
	#contact-serch {
		width: 100%;
		padding: 20px;
		border: 2px solid #ccc;
		border-radius: 5px;
		margin: 30px 10px 10px 10px;
		font-size: 3rem;
		margin: 30px 10px 10px 10px;
	}
	form {
		display: flex;
	}
	.srch {
		margin: 30px 30px 10px 20px;;
		padding: 20px;
		width: 50%;
		font-size: 2rem;
	}
	button {
		width: auto;
		padding: 30px;
		font-size: 2rem;
	}
	.attribute-box {
		border: 4px solid #ccc;
		margin: 20px 10px 10px 10px;
		padding: 10px;
		font-size:1.2rem;
		background-color: #f9f9f9;
		
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
	<div class="searchsection">
		<div>
			<form method="post" action="Search">
				<input type="search" name="search" id="contact-serch"
					placeholder="Emp ID">
				<button type="submit" class="search-button srch" id="search-button"
					name="submit">search</button>
			</form>
		</div>
		<div>
			<button type="button" name="button" onclick="cancelForm()">Cancel</button>
		</div>
	</div>
	<div class="attribute-box">
		<label>ID:</label>
		<div class="value"><%=request.getAttribute("id") != null ? request.getAttribute("id") : ""%></div>
	</div>
	<div class="attribute-box">
		<label>First Name:</label>
		<div class="value"><%=request.getAttribute("fname") != null ? request.getAttribute("fname") : ""%></div>
	</div>

	<div class="attribute-box">
		<label>Last Name:</label>
		<div class="value"><%=request.getAttribute("lname") != null ? request.getAttribute("lname") : ""%></div>
	</div>

	<div class="attribute-box">
		<label>Phone Number:</label>
		<div class="value"><%=request.getAttribute("phnum") != null ? request.getAttribute("phnum") : ""%></div>
	</div>

	<div class="attribute-box">
		<label>Email:</label>
		<div class="value"><%=request.getAttribute("email") != null ? request.getAttribute("email") : ""%></div>
	</div>

	<div class="attribute-box">
		<label>Job Title:</label>
		<div class="value"><%=request.getAttribute("jbtitl") != null ? request.getAttribute("jbtitl") : ""%></div>
	</div>

	<div class="attribute-box">
		<label>Package:</label>
		<div class="value"><%=request.getAttribute("packg") != null ? request.getAttribute("packg") : ""%></div>
	</div>

	<div class="attribute-box">
		<label>Shift:</label>
		<div class="value"><%=request.getAttribute("shift") != null ? request.getAttribute("shift") : ""%></div>
	</div>

	<div class="attribute-box">
		<label>Joining Date:</label>
		<div class="value"><%=request.getAttribute("jdte") != null ? request.getAttribute("jdte") : ""%></div>
	</div>

	<div class="attribute-box">
		<label>Address:</label>
		<div class="value"><%=request.getAttribute("adrs") != null ? request.getAttribute("adrs") : ""%></div>
	</div>

	<div class="attribute-box">
		<label>Company ID:</label>
		<div class="value"><%=request.getAttribute("cmpID") != null ? request.getAttribute("cmpID") : ""%></div>
	</div>

	<div class="attribute-box">
		<label>Password:</label>
		<div class="value"><%=request.getAttribute("psw") != null ? request.getAttribute("psw") : ""%></div>
	</div>
	<div class="buttons">
		<form method="post" action="DeleteEmp" id="myForm">
			<input type="hidden" value="<%=request.getAttribute("id")%>"
				name="del">
			<button type="button" class="search-button" id="del-btn"
				onclick="confirmDelete()">Delete</button>
		</form>
		<button type="button" onclick="cancelForm()">Cancel</button>
	</div>

	<script>
		function cancelForm() {
			if (confirm("Are you sure?")) {
				window.location.href = "index.jsp";
			}
		}
		function confirmDelete() {
			var confirmed = window
					.confirm("Are you sure you want to delete Employee?");
			if (confirmed) {
				document.getElementById('myForm').submit();
			}
		}
	</script>
</body>

</html>