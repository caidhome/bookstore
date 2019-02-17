package lzit.rj.bookstore.web.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lzit.rj.bookstore.domain.Book;
import lzit.rj.bookstore.service.BookService;

public class AddBookToCartServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.得到商品id
		String id = request.getParameter("id");

		// 2.根据id查询商品
		BookService service = new BookService();
		try {
			Book p = service.findById(id);

			// 3.将商品添加到购物车
			HttpSession session = request.getSession();
			// 从session中获取购物车
			Map<Book, Integer> cart = (Map<Book, Integer>) session
					.getAttribute("cart");
			// 如果cart为null,说明，没有购物车，是第一次购物
			if (cart == null) {
				// 创建出购物车
				cart = new HashMap<Book, Integer>();
			}
			// 判断购物车中是滞有当前要买的商品
			Integer count = cart.get(p);
			if (count == null) {
				// 如果为null,说明购物车中没有这个商品，这时商品的数量就为1
				count = 1;
			} else {
				// 如果不为null,说明购物车中有这个商品，这时，就将商品的数量+1
				count += 1;
			}
			// 将商品存储到购物车中
			cart.put(p, count);
			// 将购物车存储到session中.
			session.setAttribute("cart", cart);
			request.getRequestDispatcher("/addcartsuccess.jsp").forward(request, response);
			return;

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
