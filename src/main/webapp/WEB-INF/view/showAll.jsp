<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.Employee.Employee"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
<style type="text/css">
.warning {
	color: red;
	position: fixed;
	top: 5px;
}

button {
	margin-top: 10px;
	padding: 13px 20px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: fit-content;
}

.search-button a {
	width: fit-content;
	align-items: start;
	text-decoration: none;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
	font-size: 2.5rem;
	color: #007bff;
}

span {
	display: block;
}

.data {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	margin-top: 10px;
}

.forms, form {
	display: flex;
	justify-content: space-around;
}

.data>div {
	width: 49%;
	margin: 1px;
	padding: 5px;
	border-radius: 10px;
	background-color: #eeeeee;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
	font-size: 2.5rem;
	color: #007bff;
}

button[type="button"] {
	background-color: #ccc;
}

#del-btn, #edit-btn {
	background-color: #57c1cc;
}

button[type="button"]:hover {
	background-color: #007bff;
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
	<form method="post" action="SearchAll">
		<button type="submit" class="search-button department"
			name="department" value="HR">HR</button>
		<button type="submit" class="search-button department"
			name="department" value="IT">IT</button>
		<button type="submit" class="search-button department"
			name="department" value="Manager">Manager</button>
		<button type="submit" class="search-button department"
			name="department" value="Engineer">Engineer</button>
		<button type="submit" class="search-button department"
			name="department" value="Sales">Sales</button>
		<button type="submit" class="search-button department"
			name="department" value="All">All</button>
	</form>

	<div class="data">
		<%
		ArrayList<Employee> employees = (ArrayList<Employee>) request.getAttribute("emp");
		if (employees != null) {
			for (Employee employee : employees) {
		%>
		<div>
			<span><%=employee.getId()%></span> <span><%=employee.getFirstName()%></span>
			<span><%=employee.getLastName()%></span> <span><%=employee.getPhoneNumber()%></span>
			<span><%=employee.getEmail()%></span> <span><%=employee.getAddress()%></span>
			<span><%=employee.getJobTitle()%></span> <span><%=employee.getSalary()%></span>
			<span><%=employee.getShift()%></span> <span><%=employee.getJoiningDate()%></span>
			<span><%=employee.getCompanyMailID()%></span>
			<div class="forms">
				<form method="post" action="DeleteEmp"
					id="delform_<%=employee.getId()%>">
					<input type="hidden" name="del" value="<%=employee.getId()%>">
					<button type="button" class="search-button" id="del-btn"
						onclick="confirmDelete(<%=employee.getId()%>)">Delete</button>
				</form>

				<form method="post" action="Edit"
					id="editform_<%=employee.getId()%>">
					<input type="hidden" name="search" value="<%=employee.getId()%>">
					<button type="button" class="search-button" id="edit-btn"
						onclick="confirmEdit(<%=employee.getId()%>)">Edit</button>
				</form>
			</div>
		</div>
		<%
		}
		}
		%>
	</div>
	<button name="button" type="button" onclick="cancelForm()">Go
		back</button>
	<script>
		function cancelForm() {
			if (confirm("Are you sure?")) {
				window.location.href = "index.jsp";
			}
		}
		function confirmDelete(employeeId) {
	        var confirmed = window.confirm("Are you sure you want to delete Employee " + employeeId + "?");
	        if (confirmed) {
	            document.getElementById('delform_' + employeeId).submit();
	        }
	    }
		function confirmEdit(employeeId) {
			var confirmed = window
					.confirm("Are you sure you want to Edit Employee " + employeeId + "?");
			if (confirmed) {
				document.getElementById('editform_' + employeeId).submit();
			}
		}
	</script>
</body>
</html>