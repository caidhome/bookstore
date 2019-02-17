package lzit.rj.bookstore.web.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lzit.rj.bookstore.domain.Book;
import lzit.rj.bookstore.service.BookService;

public class FindBookByIdServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.得到商品id
		String id = request.getParameter("pid");

		// 2.调用service,dao完成查询商品操作
		BookService service = new BookService();
		try {
			Book p = service.findById(id);
			// 将p存储到request域，请求转发到bookInfo.jsp页面，展示 商品信息.

			request.setAttribute("p", p);

			request.getRequestDispatcher("/bookInfo.jsp").forward(request,
					response);
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
