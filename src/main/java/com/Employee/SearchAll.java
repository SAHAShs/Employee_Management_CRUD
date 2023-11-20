package com.Employee;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchAll
 */
public class SearchAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String msg = "";
	RequestDispatcher ed;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String depName = request.getParameter("department");
		EmployeeBO ebo = new EmployeeBO();
		ArrayList<Employee> emp = ebo.allEmpSearch(depName);
		if (emp.size() != 0) {
			request.setAttribute("emp", emp);
			ed = request.getRequestDispatcher("WEB-INF/view/showAll.jsp");
			ed.include(request, response);
		} else {
			msg = "No Employess Present! Please Hire.";
			request.setAttribute("msg", msg);
			ed = request.getRequestDispatcher("WEB-INF/view/showAll.jsp");
			ed.include(request, response);

		}
	}

}
