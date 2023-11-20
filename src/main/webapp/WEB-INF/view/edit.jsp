<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit</title>
<style>
.searchform {
	display: flex;
	justify-content: center;
}

body {
	font-family: Arial, sans-serif;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}

.form {
	margin-top: 20px;
	margin-bottom: 30px;
}

.form-grid {
	/* max-width: 600px; */
	margin-left: 200px;
	margin-bottom: 20px;
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

input[type="text"], input[type="tel"], input[type="email"], textarea {
	width: 60%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

textarea {
	resize: vertical;
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
	margin: 30px 10px 10px 10px;
}

.search-button {
	width: fit-content;
	align-items: start;
	height: 43px;
}

button {
	margin-top: 29px;
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

button[type="button"] {
	background-color: #ccc;
}

button[type="submit"]:hover, button[type="button"]:hover {
	background-color: #0056b3;
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

@media only screen and (orientation: portrait) {
	h1 {
		color: red;
		font-size: 7rem;
	}
	.form-grid {
		margin-left: 30px;
		display: block;
		grid-template-columns: none;
	}
	.form-grid1 {
		margin-left: 20px;
	}
	label {
		margin-top: 40px;
		font-size: 4rem;
	}
	input[type="text"], input[type="tel"], input[type="email"], input[type="url"],
		input[type="date"], input[type="search"] {
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
		margin-top: 50px 0px;
		padding: 30px 30px;
		width: 100%;
		font-size: 3rem;
	}
	.shift {
		font-size: 4rem;
		margin-right: 50px;
	}
	input[type="radio"] {
		transform: scale(2);
		margin: 0px 40px 0px 0px;
	}
	.search-button {
		padding: 10px;
		height: auto;
	}
	.searchform {
		justify-content: left;
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
	<form method="post" action="Edit" class="searchform">
		<input type="search" name="search" id="contact-serch"
			placeholder="Emp ID" required>
		<button type="submit" class="search-button" id="search-button"
			name="submit">search</button>
	</form>
	<form class="form" id="form1" method="POST" action="UpdateAll">
		<input type="hidden" id="id" name="ID" placeholder=""
			value="<%=(request.getAttribute("id") != null) ? request.getAttribute("id") : ""%>">
		<div class="form-grid">
			<div>
				<label for="firstName">First Name<span class="star">*</span></label>
				<input type="text" id="firstName" name="firstName" required
					pattern="[a-zA-Z\s]{3,9}"
					value="<%=(request.getAttribute("fname") != null) ? request.getAttribute("fname") : ""%>">
			</div>
			<div>
				<label for="lastName">Last Name<span class="star">*</span></label> <input
					type="text" id="lastName" name="lastName" required
					pattern="[a-zA-Z\s]{1,9}"
					value="<%=(request.getAttribute("lname") != null) ? request.getAttribute("lname") : ""%>">
				<br> <span class="lastname-rule">no space in between
					allowed</span>
			</div>

			<div>
				<label for="phoneNumber">Phone Number<span class="star">*</span></label>
				<input type="tel" id="phoneNumber" name="phoneNumber"
					pattern="[0-9]{10,10}" required
					value="<%=(request.getAttribute("phnum") != null) ? request.getAttribute("phnum") : ""%>">
			</div>

			<div>
				<label for="email">Email<span class="star">*</span></label> <input
					type="email" id="email" name="email" required
					value="<%=(request.getAttribute("email") != null) ? request.getAttribute("email") : ""%>">
			</div>
			<div>
				<label for="jobTitle">Job Title<span class="star">*</span></label> <input
					type="text" id="jobTitle" name="jobTitle" pattern="[a-zA-Z\s]{1,}"
					required
					value="<%=(request.getAttribute("jbtitl") != null) ? request.getAttribute("jbtitl") : ""%>">
			</div>
			<div>
				<label for="Salary">Package<span class="star">*</span></label> <input
					type="text" id="Salary" name="salary" pattern="[a-zA-Z0-9.\s]{0,}"
					required
					value="<%=(request.getAttribute("packg") != null) ? request.getAttribute("packg") : ""%>">
			</div>
			<div>
				<label>Shift<span class="star">*</span></label>
				<%
				String shiftValue = (String) request.getAttribute("shift");
				%>
				<label class="shift" for="day"><input type="radio"
					name="Shift" value="day" id="day"
					<%=("day".equals(shiftValue)) ? "checked" : ""%> required>Day</label>
				<label for="mid" class="shift"><input type="radio"
					name="Shift" id="mid" value="mid"
					<%=("mid".equals(shiftValue)) ? "checked" : ""%>>Mid</label> <label
					for="night" class="shift"><input type="radio" name="Shift"
					id="night" value="night"
					<%=("night".equals(shiftValue)) ? "checked" : ""%>>Night</label>
			</div>
			<div>
				<label for="joiningDate">Joining Date<span class="star">*</span></label>
				<input type="date" id="joiningDate" name="joiningDate" required
					value="<%=(request.getAttribute("jdte") != null) ? request.getAttribute("jdte") : ""%>">
			</div>

			<div>
				<label for="address">Address<span class="star">*</span></label> <input
					id="address" name="address" type="text" required
					value="<%=(request.getAttribute("adrs") != null) ? request.getAttribute("adrs") : ""%>">
			</div>
			<div>
				<label for="password">Password<span class="star">*</span></label> <input
					id="password" name="password" type="text" required
					value="<%=(request.getAttribute("psw") != null) ? request.getAttribute("psw") : ""%>">
			</div>
			<div>
				<label for="companyMialId">CompanyMailID<span class="star">*</span></label>
				<input id="mailid" name="ComapnyMailID" type="text" required
					value="<%=(request.getAttribute("cmpID") != null) ? request.getAttribute("cmpID") : ""%>">
			</div>

			<!-- <div>
				<label for="photo">Photo</label> <input id="photo"
					name="photo" type="file">
			</div> -->
		</div>
		<div class="form-grid1">
			<!-- <input type="submit" value="save" name="register" id="subbtn" > -->
			<button type="submit" value="save" name="register1">update</button>
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