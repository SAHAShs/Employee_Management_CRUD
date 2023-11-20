package com.Employee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateAll
 */
public class UpdateAll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("ID");
		String fname = request.getParameter("firstName");
		String lname = request.getParameter("lastName");
		String email = request.getParameter("email");
		String number = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String role = request.getParameter("jobTitle");
		String packagee = request.getParameter("salary");
		String Shift = request.getParameter("Shift");
		String joiningDate = request.getParameter("joiningDate");
		String comapnymailID = request.getParameter("ComapnyMailID");
		String password = request.getParameter("password");

		EmployeeBO ebo = new EmployeeBO();
		if (fname == "" || number == "" || comapnymailID == "" || password == "" || email == "" || lname == ""
				|| role == "" || packagee == "" || Shift == "" || joiningDate == "") {
			String emsg = "Please provide all fields required";
			request.setAttribute("msg", emsg);
			RequestDispatcher ed = request.getRequestDispatcher("WEB-INF/view/edit.jsp");
			ed.include(request, response);
		} else {
			Employee e = new Employee(null, fname, lname, email, number, address, role, packagee, Shift, joiningDate,
					password, comapnymailID);
			if (ebo.UpdateEmp(e, id)) {
				System.out.println("updated");
				String emsg = "updated successfully";
				request.setAttribute("msg", emsg);
				RequestDispatcher ed = request.getRequestDispatcher("index.jsp");
				ed.include(request, response);
			} else {
				System.out.println("error");
			}
		}
	}

}
