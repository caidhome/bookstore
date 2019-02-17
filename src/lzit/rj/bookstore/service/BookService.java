package lzit.rj.bookstore.service;

import java.sql.SQLException;
import java.util.List;

import lzit.rj.bookstore.dao.BookDao;
import lzit.rj.bookstore.domain.Book;
import lzit.rj.bookstore.utils.PageBean;

public class BookService {
	// 添加商品
	public void addBook(Book p) throws SQLException {
		new BookDao().addBook(p);
	}

	// 查询所有商品
	public List<Book> findAll() throws SQLException {
		return new BookDao().findAll();
	}

	// 根据id查询商品
	public Book findById(String id) throws SQLException {
		return new BookDao().findById(id);
	}

	// 下载榜单数据
	public List<Book> downloadSell() throws SQLException {
		return new BookDao().downloadSell();
	}

	public List<Book> findAllBookByCondition(Book p) throws SQLException {
		return new BookDao().findAllBookByCondition(p);
	}

	public PageBean getPageInfo(int currentpage) throws SQLException {
		PageBean pb = new PageBean();
		pb.setCurrentPage(currentpage);
		pb.setRecordNumPerPage(10);
		int totalRecord = new BookDao().queryCount();
		pb.setTotalRecord(totalRecord);
		return pb;
	}

	public void updateBook(Book p) throws SQLException {
		new BookDao().updateBook(p);
	}

	public void deleteBookById(String id) throws SQLException {
		new BookDao().deleteBookById(id);
	}
	
	public PageBean<Book> findAllBookByCondition(PageBean<Book> pb) throws SQLException {
		return new BookDao().findAllBookByCondition(pb);
	}

}
