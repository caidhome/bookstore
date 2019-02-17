package lzit.rj.bookstore.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.sun.rowset.CachedRowSetImpl;

import lzit.rj.bookstore.domain.OrderItem;
import lzit.rj.bookstore.domain.Book;
import lzit.rj.bookstore.utils.DataSourceUtils;
import lzit.rj.bookstore.utils.PageBean;

public class BookDao {
	// 添加商品
	public void addBook(Book p) throws SQLException {
		String sql = "insert into books values(?,?,?,?,?,?,?)";

		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

		runner.update(sql, p.getId(), p.getName(), p.getPrice(),
				p.getCategory(), p.getPnum(), p.getImgurl(), p.getDescription());
	}

	// 查询所有商品
	public List<Book> findAll() throws SQLException {
		String sql = "select * from books";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

		return runner.query(sql, new BeanListHandler<Book>(Book.class));
	}

	public Book findById(String id) throws SQLException {
		String sql = "select * from books where id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

		return runner.query(sql, new BeanHandler<Book>(Book.class), id);
	}

	// 添加订单后，修改商品的数量.
	public void updatePnum(List<OrderItem> items) throws SQLException {
		String sql = "update books set pnum=pnum-? where id=?";

		QueryRunner runner = new QueryRunner();
		Object[][] params = new Object[items.size()][2];

		for (int i = 0; i < items.size(); i++) {
			OrderItem item = items.get(i);
			params[i][0] = item.getBuynum();
			params[i][1] = item.getBook_id();

		}

		runner.batch(DataSourceUtils.getConnectionByTransaction(), sql, params);
	}

	// 删除订单后，恢复商品的数量
	public void changePnum(List<OrderItem> items) throws SQLException {
		String sql = "update books set pnum=pnum+? where id=?";

		QueryRunner runner = new QueryRunner();
		Object[][] params = new Object[items.size()][2];

		for (int i = 0; i < items.size(); i++) {
			OrderItem item = items.get(i);
			params[i][0] = item.getBuynum();
			params[i][1] = item.getBook_id();

		}

		runner.batch(DataSourceUtils.getConnectionByTransaction(), sql, params);
	}

	// 下载榜单
	public List<Book> downloadSell() throws SQLException {
		String sql = "select books.name,sum(buynum) totalSaleNum			from					books,orderitem,orders 			where 				orderitem.book_id=books.id			and				orders.id=orderitem.order_id			and				orders.paystate=1			group by				books.name			order by				totalSaleNum desc";
		
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

		return runner.query(sql, new BeanListHandler<Book>(Book.class));
	}

	public List<Book> findAllBookByCondition(Book p) throws SQLException {
		String sql = "select * from books where 1=1";
		
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		List<Object> list = new ArrayList<Object>();
		String category = p.getCategory();
		if (category != null) {
			sql = sql+" and category like ?";
			list.add("%"+category+"%");
		}
		String name = p.getName();
		if (name != null) {
			sql = sql+" and name like ?";
			list.add("%"+name+"%");
		}
		return runner.query(sql, new BeanListHandler<Book>(Book.class),list.toArray());

	}
	
	public int queryCount() throws SQLException {
		String sql = "select count(*) from books";
		
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

		return  ((Long) runner.query(sql, new ScalarHandler())).intValue();
	}
	public int queryCount(Book p) throws SQLException {
		String sql = "select count(*) from books where 1=1 ";
		
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		List<Object> list = new ArrayList<Object>();
		String category = p.getCategory();
		if (category != null) {
			sql = sql+" and category like ?";
			list.add("%"+category+"%");
		}
		String name = p.getName();
		if (name != null) {
			sql = sql+" and name like ?";
			list.add("%"+name+"%");
		}
		return  ((Long) runner.query(sql, new ScalarHandler(),list.toArray())).intValue();
	}

	public void updateBook(Book p) throws SQLException {
		String sql = "update books set name=?,price=?,category=?,pnum=?,description=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		if (p.getImgurl() != null) {
			sql = sql + ",imgurl=? where id=?";
			runner.update(sql,  p.getName(), p.getPrice(),
					p.getCategory(), p.getPnum(), p.getDescription(), p.getImgurl(),p.getId());
			return ;
		}
		sql = sql + " where id=?";
		runner.update(sql,  p.getName(), p.getPrice(),
				p.getCategory(), p.getPnum(),  p.getDescription(),p.getId());
	}

	/**
	 * 根据ID删除图书
	 * @param id
	 * @throws SQLException 
	 */
	public void deleteBookById(String id) throws SQLException {
		String sql = "delete from books where id=?";
		
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

		runner.update(sql, id);
	}
	
	public PageBean<Book> findAllBookByCondition(PageBean<Book> pb) throws SQLException {
		String sql = "select * from books where 1=1";
		
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		List<Object> list = new ArrayList<Object>();
		Book p = pb.getCondition();
		String category = p.getCategory();
		if (category != null) {
			sql = sql+" and category like ?";
			list.add("%"+category+"%");
		}
		String name = p.getName();
		if (name != null) {
			sql = sql+" and name like ?";
			list.add("%"+name+"%");
		}
		
		
		 // 查询总记录数
        int totalCount = this.queryCount(p);
        //设置到pb对象中
        pb.setTotalRecord(totalCount);
        //判断
        if(pb.getCurrentPage()<=0){
            pb.setCurrentPage(1);
        }else if(pb.getCurrentPage()>pb.getTotalPage()){
            pb.setCurrentPage(pb.getTotalPage());
        }
		 
        // 获取当前页
        int currentPage = pb.getCurrentPage();
        if(currentPage > 0) {
	        //计算查询的起始行
	        int index = (currentPage - 1) * pb.getRecordNumPerPage();
	        //返回的行数
	        int count = pb.getRecordNumPerPage();
	        sql = sql+" limit ?,?";
			list.add(index);
			list.add(count);
			pb.setList(runner.query(sql, new BeanListHandler<Book>(Book.class),list.toArray()));
        }
		return pb;
	}

}
