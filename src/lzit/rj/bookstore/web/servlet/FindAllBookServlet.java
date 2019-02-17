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

public class FindAllBookServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookService service = new BookService();
		List<Book> ps = null;
		Book p = new Book();
		try {
			BeanUtils.populate(p, request.getParameterMap());
		} catch (IllegalAccessException e1) {
			e1.printStackTrace();
		} catch (InvocationTargetException e1) {
			e1.printStackTrace();
		}
		String strcategory = request.getParameter("category"); 
		int ca = 0;
		if(strcategory != null && !"".equals(strcategory))
			ca = Integer.parseInt(strcategory);
		if(ca == 1) {
			p.setCategory("文学综合馆");
		}else if(ca == 2) {
			p.setCategory("童年馆");
		}else if(ca == 3) {
			p.setCategory("教育馆");
		}
		try {
			ps = service.findAllBookByCondition(p);
			//2.将所有商品存储到request域。
			request.setAttribute("ps", ps);
			request.getRequestDispatcher("/home.jsp")
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
