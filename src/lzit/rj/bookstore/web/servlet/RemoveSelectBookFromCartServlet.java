package lzit.rj.bookstore.web.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lzit.rj.bookstore.domain.Book;

public class RemoveSelectBookFromCartServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] id = request.getParameterValues("id");

		Map<Book, Integer> cart = (Map<Book, Integer>) request
				.getSession().getAttribute("cart");

		for (int i = 0; i < id.length; i++) {
			Book p = new Book();
			p.setId(id[i]);
			cart.remove(p);
		}

		response.sendRedirect(request.getContextPath() + "/showCart.jsp");

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
