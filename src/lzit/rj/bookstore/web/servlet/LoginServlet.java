package lzit.rj.bookstore.web.servlet;

import java.io.IOException;
import java.net.URLEncoder;

import javax.security.auth.login.LoginException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lzit.rj.bookstore.domain.User;
import lzit.rj.bookstore.exception.ActiveCodeException;
import lzit.rj.bookstore.service.UserService;

public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.得到请求参数
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		System.out.println(role);
		String target=null;
		if("admin".equals(role)) {
			target="/admin/login.jsp";
		}else {
			target="/home.jsp";
		}
		// 2.校验
		if(username == null || password == null) {
			return ;
		}
		// 3.调用service中登录的方法
		UserService service = new UserService();
		try {
			User user = service.login(username, password,role);
			// 登录成功
			if("admin".equals(role)) {
				target="/admin/main.jsp";
			}else {
				// 判断是否勾选了记住用户名.
				String remember = request.getParameter("remember");
				if ("on".equals(remember)) {
					// 勾选了--考虑中文问题
					Cookie cookie = new Cookie("remember", URLEncoder.encode(
							user.getUsername(), "utf-8"));
					cookie.setMaxAge(10 * 24 * 60 * 60);
					cookie.setPath("/");
					response.addCookie(cookie);
				} else {
					// 如果用户没有勾选记住用户名，将cookie删除。删除cookie，只需要设置maxage=0或-1,注意：要与cookie的path一致.
					Cookie cookie = new Cookie("remember", URLEncoder.encode(
							user.getUsername(), "utf-8"));
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
				}
	
				// 自动登录
				
				String autologin=request.getParameter("autologin");
				if("on".equals(autologin)){
					Cookie cookie = new Cookie("autologin", URLEncoder.encode(
							user.getUsername(), "utf-8")+"::"+password+"::"+role);
					cookie.setMaxAge(10 * 24 * 60 * 60);
					cookie.setPath("/");
					response.addCookie(cookie);
				}else{
					Cookie cookie = new Cookie("autologin", URLEncoder.encode(
							user.getUsername(), "utf-8")+"::"+password+"::"+role);
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
				}
				target = "/home.jsp";
			}
			//request.getSession().invalidate();//先销毁session。
			request.getSession().setAttribute("user", user);// 登录成功，将user存储到session中.
			response.sendRedirect("http://www.bookstore.com"+target); // 重定向可以跳转到任意路径,请求转发只能在本站内跳转.
			return;

		} catch (LoginException e) {
			
			e.printStackTrace();
			request.setAttribute("login.message", e.getMessage());
			request.getRequestDispatcher(target)
					.forward(request, response);
			return;
		} catch (ActiveCodeException e) {
			e.printStackTrace();
			request.setAttribute("login.message", e.getMessage());
			request.getRequestDispatcher(target)
					.forward(request, response);
			return;
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
