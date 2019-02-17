package lzit.rj.bookstore.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import lzit.rj.bookstore.domain.Book;
import lzit.rj.bookstore.domain.User;
import lzit.rj.bookstore.service.BookService;
import lzit.rj.bookstore.utils.PageBean;
import lzit.rj.bookstore.utils.SessionUtil;

public class FindAllBookSysServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//TODO 首页分类查询
		int currentPage  = 1;
		//0. 查询是否有分类
		PageBean<Book> pb = new PageBean<Book>();
		
		Book p = new Book();
		try {
			BeanUtils.populate(p, request.getParameterMap());
			pb.setCondition(p);
		} catch (IllegalAccessException e1) {
			e1.printStackTrace();
		} catch (InvocationTargetException e1) {
			e1.printStackTrace();
		}
		BookService service = new BookService();
		try {
			String cp = request.getParameter("currentPage");
			if(cp != null)
				currentPage= Integer.parseInt(cp);
			pb.setCurrentPage(currentPage);
			pb = service.findAllBookByCondition(pb);
			//2.将所有商品存储到request域。
			request.setAttribute("pb", pb);
			request.getRequestDispatcher("/admin/showbook.jsp")
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
