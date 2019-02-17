package lzit.rj.bookstore.web.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lzit.rj.bookstore.exception.ActiveCodeException;
import lzit.rj.bookstore.service.UserService;

public class ActiveUserServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.得到激活码
		String activeCode = request.getParameter("activeCode");

		// 2.调用service中激活操作
		UserService service = new UserService();

		try {
			service.activeUser(activeCode);

			response.getWriter().write(
					"激活成功，请回<a href='http://www.bookstore.com'>首页</a>");
			return;

		} catch (Exception e) {
			// e.printStackTrace();
			// response.sendRedirect(request.getContextPath()
			// + "/error/activeuser_error.jsp");
			// return;
			throw new ActiveCodeException();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
