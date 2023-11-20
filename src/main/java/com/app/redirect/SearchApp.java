package com.app.redirect;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchApp
 */
public class SearchApp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// You can do any necessary processing here if needed

		// Forward the request to the JSP in the WEB-INF directory
		request.getRequestDispatcher("/WEB-INF/view/search.jsp").forward(request, response);
	}

}
