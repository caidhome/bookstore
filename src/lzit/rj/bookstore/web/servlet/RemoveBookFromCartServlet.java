package lzit.rj.bookstore.web.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lzit.rj.bookstore.domain.Book;

public class RemoveBookFromCartServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 得到要删除的商品的id
		String id = request.getParameter("id");
		// 得到购物车，从购物车中将商品删除,
		Map<Book, Integer> cart = (Map<Book, Integer>) request
				.getSession().getAttribute("cart");
		Book p = new Book();
		p.setId(id);
		cart.remove(p);

		//如果购物车中无商品，将购物车删除。
		if (cart.size() == 0) {
			request.getSession().removeAttribute("cart");
		}
		response.sendRedirect(request.getContextPath() + "/showCart.jsp");

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
