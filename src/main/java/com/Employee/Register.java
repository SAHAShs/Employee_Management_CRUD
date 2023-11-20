package com.Employee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fname = request.getParameter("firstName");
		String lname = request.getParameter("lastName");
		String email = request.getParameter("email");
		String number = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String role = request.getParameter("jobTitle");
		String packagee = request.getParameter("salary");
		String Shift = request.getParameter("Shift");
		String joiningDate = request.getParameter("joiningDate");
		String msg = "";
		RequestDispatcher ed;
		EmployeeBO ebo = new EmployeeBO();
		if (fname == "" || number == "" || email == "" || lname == "" || role == "" || packagee == "" || Shift == ""
				|| joiningDate == "") {
			String emsg = "Please provide all fields required";
			request.setAttribute("msg", emsg);
			ed = request.getRequestDispatcher("WEB-INF/view/insert.jsp");
			ed.include(request, response);
		} else if (ebo.validEmp(email)) {
			msg = email + " already present";
			request.setAttribute("msg", msg);
			ed = request.getRequestDispatcher("WEB-INF/view/insert.jsp");
			ed.include(request, response);
		} else {
			Employee e = new Employee(null, fname, lname, email, number, address, role, packagee, Shift, joiningDate,
					null, null);
			if (ebo.saveEmp(e)) {
				String idpass = ebo.getCmpID(email);
				msg = "employee is added with " + idpass;
				request.setAttribute("msg", msg);
				ed = request.getRequestDispatcher("index.jsp");
				ed.include(request, response);
			} else {
//				System.out.println("error");
				msg = email + " already present";
				request.setAttribute("msg", msg);
				ed = request.getRequestDispatcher("WEB-INF/view/insert.jsp");
				ed.include(request, response);
			}
		}
	}

}
