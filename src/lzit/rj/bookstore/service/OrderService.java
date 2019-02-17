package lzit.rj.bookstore.service;

import java.sql.SQLException;
import java.util.List;

import lzit.rj.bookstore.dao.OrderDao;
import lzit.rj.bookstore.dao.OrderItemDao;
import lzit.rj.bookstore.dao.BookDao;
import lzit.rj.bookstore.domain.Order;
import lzit.rj.bookstore.domain.OrderItem;
import lzit.rj.bookstore.domain.User;
import lzit.rj.bookstore.utils.DataSourceUtils;
import lzit.rj.bookstore.utils.PageBean;

public class OrderService {

	// 添加订单方法
	public void addOrder(Order order) {
		OrderDao odao = new OrderDao();
		OrderItemDao oidao = new OrderItemDao();
		BookDao pdao = new BookDao();

		// 开启事务
		try {
			DataSourceUtils.startTransaction(DataSourceUtils
					.getConnectionByTransaction());
			// 1.调用OrderDao完成向orders表中添加数据
			odao.addOrder(order);
			// 2.调用OrderItemDao完成对orderItem表的添加操作
			oidao.addOrderItem(order.getItems());
			// 3.调用BookDao完成对books表中数量修改操作.
			pdao.updatePnum(order.getItems());
		} catch (SQLException e) {
			e.printStackTrace();
			// 事务回滚
			try {
				DataSourceUtils.rollback(DataSourceUtils
						.getConnectionByTransaction());
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			// 释放资源,并且事务提交以及从ThreadLocal中移除Connection。
			try {
				DataSourceUtils.closeConnection(DataSourceUtils
						.getConnectionByTransaction());
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}


	// 根据用户查询订单
	public List<Order> findOrder(User user,String condition) throws SQLException {
		return new OrderDao().findOrder(user,condition);
	}
	// 根据用户查询订单
	public PageBean<Order> findOrder(PageBean<Order> pb) throws SQLException {
		return new OrderDao().findOrder(pb);
	}
	// 删除订单
	public void delOrderById(String id) {
		OrderItemDao oidao = new OrderItemDao();
		OrderDao odao = new OrderDao();
		BookDao pdao = new BookDao();

		try {
			// 1.开启事务
			DataSourceUtils.startTransaction(DataSourceUtils
					.getConnectionByTransaction());
			// 2.操作
			// 2.1 根据orderid查询出所有订单项
			List<OrderItem> items = oidao.findOrderItemByOrderId(id);
			// 2.2根据orderid删除相关订单项
			oidao.delOrderItemByOrderId(id);
			// 2.3根据orderid删除订单
			odao.delOrderById(id);
			// 2.4.根据查询出的items，修改books表中的数据.
			pdao.changePnum(items);

		} catch (Exception e) {
			try {
				DataSourceUtils.rollback(DataSourceUtils
						.getConnectionByTransaction());
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			
		} finally {
			try {
				DataSourceUtils.closeConnection(DataSourceUtils
						.getConnectionByTransaction());
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

	}


}
