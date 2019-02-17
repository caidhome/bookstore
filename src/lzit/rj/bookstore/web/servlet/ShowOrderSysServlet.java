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
import lzit.rj.bookstore.utils.PageBean;
import lzit.rj.bookstore.utils.SessionUtil;

public class ShowOrderSysServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cp = request.getParameter("currentPage");
		
		OrderService service = new OrderService();
		// 0.条件查询
		String condition = request.getParameter("condition");
		Order order = new Order();
		order.setUsername(condition);
		PageBean<Order> pb = new PageBean<Order>();
		pb.setCondition(order);
		// 2.调用OrderService完成查询订单操作
		try {
			if(cp != null && !"".equals(cp)) {
				pb.setCurrentPage(Integer.parseInt(cp));
			}
			pb = service.findOrder(pb);
			request.setAttribute("pb", pb);

			request.getRequestDispatcher("/admin/showorder.jsp")
			.forward(request, response);
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
