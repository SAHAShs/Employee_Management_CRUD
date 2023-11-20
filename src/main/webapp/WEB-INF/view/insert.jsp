<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<style>
body {
	font-family: Arial, sans-serif;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}

.form {
	margin-top: 50px;
}

.form-grid {
	/* max-width: 600px; */
	margin-left: 200px;
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
}

.form-grid1 {
	display: flex;
	width: fit-content;
	margin-left: 200px;
	gap: 20px;
	width: auto;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="tel"], input[type="email"], input[type="url"],
	textarea {
	width: 60%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.header {
	display: flex;
	justify-content: space-between;
	padding-bottom: 20px;
}

#contact-serch {
	width: 60%;
	padding: 13px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.search-button {
	width: fit-content;
	align-items: start;
}

button {
	margin-top: 10px;
	padding: 13px 20px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 25%;
}

#subbtn {
	margin-top: 10px;
	padding: 13px 20px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 25%;
}

#create {
	display: flex;
	justify-content: center;
}

#create {
	background: linear-gradient(345deg, rgb(12 64 197), #34c0c2);
}

.shift {
	display: inline-block;
}

button[type="button"] {
	background-color: #ccc;
}

.lastname-rule {
	color: silver;
	font-size: 0.7rem
}

.star {
	color: red;
}

.warning {
	color: red;
	position: fixed;
	top: 5px;
}

button[type="submit"]:hover, button[type="button"]:hover {
	background-color: #0056b3;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
	font-size: 2.5rem;
	color: #007bff;
}

@media only screen and (orientation: portrait) {
	h1 {
		color: red;
		font-size: 7rem;
	}
	form {
		
	}
	.form-grid {
		margin-left: 100px;
		display: block;
		grid-template-columns: none;
	}
	.form-grid1 {
		margin-left: 100px;
		display: flex;
		width: 100%;
		gap: 20px;
	}
	label {
		margin-top: 40px;
		font-size: 1.8rem;
	}
	input[type="text"], input[type="tel"], input[type="email"], input[type="url"]
		{
		width: 90%;
		padding: 28px;
		border: 2px solid #ccc;
		border-radius: 5px;
		font-size: 3rem;
	}
	input[type="date"] {
		width: 90%;
		padding: 18px;
		border: 2px solid #ccc;
		border-radius: 5px;
	}
	.lastname-rule {
		color: silver;
		font-size: 2rem
	}
	button {
		margin-top: 50px;
		padding: 20px 30px;
		background-color: #007bff;
		color: white;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		width: auto;
		font-size: 4rem;
	}
	.shift {
		font-size: 4rem;
		margin-right: 50px;
	}
	input[type="radio"] {
		transform:scale(2);
		margin:0px 40px 0px 0px;
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
	<form class="form" id="form1" action="Register" method="POST">
		<div class="form-grid">
			<div>
				<label for="firstName">First Name<span class="star">*</span></label>
				<input type="text" id="firstName" name="firstName" required
					placeholder="firstname" pattern="[a-zA-Z\s]{3,9}">
			</div>
			<div>
				<label for="lastName">Last Name<span class="star">*</span></label><input
					type="text" id="lastName" name="lastName" required
					placeholder="lastname" pattern="[a-zA-Z\s]{1,9}"><br>
				<span class="lastname-rule">no space inbetween allowed</span>
			</div>

			<div>
				<label for="phoneNumber">Phone Number<span class="star">*</span></label>
				<input type="tel" id="phoneNumber" name="phoneNumber"
					placeholder="6666699999" pattern="[0-9]{10,10}">
			</div>

			<div>
				<label for="email">Email<span class="star">*</span></label> <input
					type="email" id="email" name="email" required
					placeholder="email@gmail.com">
			</div>
			<div>
				<label for="jobTitle">Job Title<span class="star">*</span></label> <input
					type="text" id="jobTitle" name="jobTitle" placeholder="Engineer"
					pattern="[a-zA-Z\s]{1,}"><br> <span
					class="lastname-rule">Only Capital Letters</span>
			</div>
			<div>
				<label for="Salary">Package<span class="star">*</span></label> <input
					type="text" id="Salary" name="salary" placeholder="LPA">
			</div>
			<div>
				<label>Shift<span class="star">*</span></label> <label class="shift"
					for="day"><input type="radio" name="Shift" value="day"
					id="day" checked required>Day</label> <label for="mid"
					class="shift"><input type="radio" name="Shift" id="mid"
					value="mid">Mid</label> <label for="night" class="shift"><input
					type="radio" name="Shift" id="night" value="night">Night</label>
			</div>
			<div>
				<label for="joiningDate">Joining Date<span class="star">*</span></label>
				<input type="date" id="joiningDate" name="joiningDate">
			</div>

			<div>
				<label for="address">Address<span class="star">*</span></label> <input
					id="address" name="address" type="text"
					placeholder="Complete adress">
			</div>
		</div>
		<div class="form-grid1">
			<button type="submit" value="save" name="register">Create
				Employee</button>
			<button type="button" onclick="cancelForm()">Cancel</button>
		</div>
	</form>

</body>
<script>
	function cancelForm() {
		if (confirm("Are you sure?")) {
			window.location.href = "index.jsp";
		}
	}
</script>

</html>