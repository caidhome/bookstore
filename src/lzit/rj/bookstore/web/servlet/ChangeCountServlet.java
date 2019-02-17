package lzit.rj.bookstore.web.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lzit.rj.bookstore.domain.Book;

public class ChangeCountServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.得到请求参数
		String id = request.getParameter("id");
		int count = Integer.parseInt(request.getParameter("count"));

		// 2.修改购物车中指定商品的数量.
		// 2.1得到购物车
		Map<Book, Integer> cart = (Map<Book, Integer>) request
				.getSession().getAttribute("cart");

		// 2.2.修改购物车中商品数量
		Book p = new Book();
		p.setId(id);

		if (count == 0) {
			// 删除商品
			cart.remove(p);
		} else {
			cart.put(p, count);
		}
		response.sendRedirect(request.getContextPath() + "/showCart.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
