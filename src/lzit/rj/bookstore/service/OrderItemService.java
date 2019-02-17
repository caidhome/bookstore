package lzit.rj.bookstore.service;

import java.sql.SQLException;
import java.util.List;

import lzit.rj.bookstore.dao.OrderItemDao;
import lzit.rj.bookstore.domain.Book;

public class OrderItemService {

	//根据订单号查询出订单中商品信息
	public List<Book> findBookByOrderId(String orderid) throws SQLException {
		return new OrderItemDao().findBookByOrderId(orderid);
	}


	
}
