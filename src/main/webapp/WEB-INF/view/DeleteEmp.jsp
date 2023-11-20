<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
<style type="text/css">
h1 {
	text-align: center;
	margin-bottom: 20px;
	font-size: 2.5rem;
	color: #007bff;
}

.warning {
	color: red;
	position: fixed;
	top: 5px;
}

button {
	margin-top: 30px ;
	padding: 13px 20px;
	margin-left:10px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: fit-content;
}
button[type="button"] {
    background-color: #ccc;
}
button[type="button"]:hover{
background-color: #007bff;
}

.searchsection {
	display: flex;
}
.buttons{
display:flex;
}

#contact-serch {
	width: 60%;
	padding: 13px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin: 30px 10px 10px 10px;
}

.data {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	margin-top: 10px;
}

.data>div {
	width: 49%;
	margin: 1px;
	padding: 5px;
	border-radius: 10px;
	background-color: #eeeeee;
}

span {
	display: block;
}

.search-button a {
	width: fit-content;
	align-items: start;
	text-decoration: none;
}
#del-btn {
	background-color: red;
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
				<button type="submit" class="search-button" id="search-button"
					name="submit">search</button>
			</form>
		</div>
	</div>
	<div class="data">

		<%
		if (request.getAttribute("fname") != null) {
		%>
		<div>
			<span><%=request.getAttribute("id")%></span> <span><%=request.getAttribute("fname")%></span>
			<span><%=request.getAttribute("lname")%></span> <span><%=request.getAttribute("phnum")%></span>
			<span><%=request.getAttribute("email")%></span> <span><%=request.getAttribute("jbtitl")%></span>
			<span><%=request.getAttribute("packg")%></span> <span><%=request.getAttribute("shift")%></span>
			<span><%=request.getAttribute("jdte")%></span> <span><%=request.getAttribute("adrs")%></span>
			<span><%=request.getAttribute("cmpID")%></span> <span><%=request.getAttribute("psw")%></span>
		</div>
		<%
		}
		%>

	</div>
	<div class="buttons">
	<form method="post" action="DeleteEmp">
		<button type="submit" value="<%= request.getAttribute("id")%>"
			class="search-button" id="del-btn" name="del">Delete</button>
	</form>
	<button type="button" onclick="cancelForm()">Cancel</button>
	</div>
	<script>
		function cancelForm() {
			if (confirm("Are you sure?")) {
				window.location.href = "index.jsp";
			}
		}
	</script>
</body>
</html>