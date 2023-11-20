package com.Employee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Search
 */
public class Search extends HttpServlet {
	String msg = "";
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Search() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String search = request.getParameter("search");
//		String referrer = request.getHeader("Referer");
//		System.out.println(referrer);
		EmployeeBO ebo = new EmployeeBO();
		if (search == "") {
			String emsg = "Please provide all fields required";
			request.setAttribute("msg", emsg);
			RequestDispatcher ed = request.getRequestDispatcher("WEB-INF/view/search.jsp");
			ed.include(request, response);
		} else {
			Employee e = ebo.EmpSearch(search);
			if (e == null) {
				msg = "Employee with ID " + search + " not present";
				request.setAttribute("msg", msg);
				RequestDispatcher ed = request.getRequestDispatcher("WEB-INF/view/search.jsp");
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
				RequestDispatcher ed = request.getRequestDispatcher("WEB-INF/view/search.jsp");
				ed.include(request, response);
			}
		}
	}
}
