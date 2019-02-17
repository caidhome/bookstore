package lzit.rj.bookstore.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import lzit.rj.bookstore.domain.User;
import lzit.rj.bookstore.service.UserService;

public class UpdateUserServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		UserService service = new UserService();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			// 调用service完成添加操作
			service.updateUser(user);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} 

		try {
			user = service.findUserById(user.getId()+"");
			request.getSession().setAttribute("user", user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 得定向到首页
		response.sendRedirect("/admin/showsysuser.jsp");
		return;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
