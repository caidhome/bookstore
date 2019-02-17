package lzit.rj.bookstore.web.filter;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lzit.rj.bookstore.domain.User;
import lzit.rj.bookstore.exception.PrivilegeException;

public class PrivilegeFilter implements Filter {

	private List<String> admins;
	private List<String> users;

	public void init(FilterConfig config) throws ServletException {
		// 得到WEB-INF下的admin.properties以及user.properties文件路径
		String path1 = config.getServletContext().getRealPath(
				"/WEB-INF/admin.properties");
		String path2 = config.getServletContext().getRealPath(
				"/WEB-INF/user.properties");

		admins = fillList(path1);
		users = fillList(path2);

	}

	private List<String> fillList(String path) {
		Properties props = new Properties(); // 创建了
												// 一个Properties对象，其实它就相当于是一个Map<String,String>;

		try {
			props.load(new FileInputStream(path));// load方法是将某个properties文件中内容直接装入到Properties对象中。
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Collection<Object> c = props.values(); // 得到["/addBook.jsp,/addBook"]
		Object obj = c.iterator().next(); // "/addBook.jsp,/addBook"

		List<String> list = Arrays.asList(obj.toString().split(",")); // 将一个数组直接转换成List集合

		return list;
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;

		// 1.得到请求资源路径
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String path = uri.substring(contextPath.length());

		// 2.判断是否需要权限
		//System.out.println("需要权限的路径："+path);
		if (admins.contains(path) || users.contains(path)) {
			// 这是需要权限的.
			// 3.得到当前用户
			User u = (User) request.getSession().getAttribute("user");
			if (u == null) {
				// 没有登录，权限不足
				req.setAttribute("privilegeinfo", "您还未登录，权限不足，请登录后再试");
				throw new PrivilegeException("您还未登录，权限不足，请登录后再试");
			}
			// 说明登录,得到用户的角色
			String role = u.getRole();
			if ("admin".equals(role)) {
				// admin角色
				if (!admins.contains(path)) {
					req.setAttribute("privilegeinfo", "您的权限不足");
					throw new PrivilegeException("您的权限不足");
				}
			} else {
				// user角色
				if (!users.contains(path)) {
					req.setAttribute("privilegeinfo", "您当前不是管理员，权限不足");
					throw new PrivilegeException("您当前不是管理员，权限不足");
				}
			}
		}

		chain.doFilter(request, response);

	}

	public void destroy() {

	}

}
