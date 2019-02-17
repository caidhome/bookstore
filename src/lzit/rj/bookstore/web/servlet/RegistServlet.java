package lzit.rj.bookstore.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import lzit.rj.bookstore.domain.User;
import lzit.rj.bookstore.exception.RegistException;
import lzit.rj.bookstore.service.UserService;
import lzit.rj.bookstore.utils.ActiveCodeUtils;

public class RegistServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 进行验证码判断
		String checkCode = request.getParameter("checkcode");

		String _checkCode = (String) request.getSession().getAttribute(
				"checkcode_session");
		request.getSession().removeAttribute("checkcode_session");//从session中删除。

		if (!checkCode.equals(_checkCode)) {
			request.setAttribute("regist.message", "验证码不正确");
			request.getRequestDispatcher("/regist.jsp").forward(request,
					response);
			return;
		}

		// 1.得到所有请求参数，封装到User对象中.
		User user = new User();

		try {
			BeanUtils.populate(user, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}

		// 调用校验方法
		Map<String, String> map = user.validation();

		if (map.size() != 0) {
			request.setAttribute("map", map);
			request.getRequestDispatcher("/regist.jsp").forward(request,
					response);
			return;
		}

		// 手动封装激活码
		user.setActivecode(ActiveCodeUtils.getActiveCode());

		// 2.调用service完成注册操作.
		UserService service = new UserService();

		try {
			service.regist(user);

			// 3.注册成功
			// response.setHeader("refresh", "3;url=http://www.bookstore.com");
			response.sendRedirect(request.getContextPath()
					+ "/regist_success.jsp");
			return;
		} catch (RegistException e) {
			e.printStackTrace();
			request.setAttribute("regist.message", e.getMessage());
			request.getRequestDispatcher("/regist.jsp").forward(request,
					response);
			return;
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
