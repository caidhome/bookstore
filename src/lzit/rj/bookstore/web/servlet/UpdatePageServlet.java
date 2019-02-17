package lzit.rj.bookstore.web.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lzit.rj.bookstore.dao.BookDao;
import lzit.rj.bookstore.domain.Book;
import lzit.rj.bookstore.service.BookService;

public class UpdatePageServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		BookService service = new BookService();
		try {
			Book p = service.findById(id);
			request.setAttribute("p", p);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/admin/updatebook.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
