package lzit.rj.bookstore.web.servlet;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lzit.rj.bookstore.domain.User;

public class LogoutServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 注销功能就是销毁session
		User user = (User) request.getSession().getAttribute("user");
		String target="";
		if(user != null) {
			String role = user.getRole();
			if("admin".equals(role)) {
				target = "/admin/login.jsp";
			}else {
				target = "/home.jsp";
			}
		}
		request.getSession().invalidate();

		// 将自动登录的cookie删除。

		Cookie cookie = new Cookie("autologin", "");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		response.sendRedirect(request.getContextPath() + target);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
