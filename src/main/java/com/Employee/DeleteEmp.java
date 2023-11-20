package com.Employee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteEmp
 */
public class DeleteEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String msg = "";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String search = request.getParameter("search");
		String del = request.getParameter("del");
		EmployeeBO ebo = new EmployeeBO();
		RequestDispatcher ed;
		if (del != null) {
			boolean res = ebo.deleteEmp(del);
			if (res) {
				String emsg = "Employee with id " + del + " deleted!";
				request.setAttribute("msg", emsg);
				ed = request.getRequestDispatcher("index.jsp");
				ed.include(request, response);
			} else {
				String emsg = "some eeror occured";
				request.setAttribute("msg", emsg);
				ed = request.getRequestDispatcher("WEB-INF/view/DeleteEmp.jsp");
				ed.include(request, response);
			}
		} else {
			if (search == "") {
				String emsg = "Please provide all fields required";
				request.setAttribute("msg", emsg);
				ed = request.getRequestDispatcher("WEB-INF/view/DeleteEmp.jsp");
				ed.include(request, response);
			} else {
				Employee e = ebo.EmpSearch(search);
				if (e == null) {
					msg = "Employee with ID " + search + " not present";
					request.setAttribute("msg", msg);
					ed = request.getRequestDispatcher("WEB-INF/view/DeleteEmp.jsp");
					ed.include(request, response);
				} else {
					request.setAttribute("id", e.getId());
					request.setAttribute("fname", e.getFirstName());
					request.setAttribute("lname", e.getLastName());
					request.setAttribute("phnum", e.getPhoneNumber());
					request.setAttribute("email", e.getEmail());
					request.setAttribute("jbtitl", e.getJobTitle());
					request.setAttribute("packg", e.getSalary());
					request.setAttribute("shift", e.getShift());
					request.setAttribute("jdte", e.getJoiningDate());
					request.setAttribute("adrs", e.getAddress());
					request.setAttribute("cmpID", e.getCompanyMailID());
					request.setAttribute("psw", e.getPassword());
					ed = request.getRequestDispatcher("WEB-INF/view/DeleteEmp.jsp");
					ed.include(request, response);
				}
			}
		}
	}

}
