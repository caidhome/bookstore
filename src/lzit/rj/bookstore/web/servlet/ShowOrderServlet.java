package lzit.rj.bookstore.web.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lzit.rj.bookstore.domain.Order;
import lzit.rj.bookstore.domain.User;
import lzit.rj.bookstore.service.OrderService;
import lzit.rj.bookstore.utils.SessionUtil;

public class ShowOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Order> orders = null;
		User user = SessionUtil.findUserFromSession(request);
		OrderService service = new OrderService();
		// 0.条件查询
		String condition = request.getParameter("condition");
		// 2.调用OrderService完成查询订单操作
		try {
			orders = service.findOrder(user,condition);

			request.setAttribute("orders", orders);

			request.getRequestDispatcher("/showOrder.jsp").forward(request,
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
