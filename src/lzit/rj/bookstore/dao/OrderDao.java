package lzit.rj.bookstore.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import lzit.rj.bookstore.domain.Order;
import lzit.rj.bookstore.domain.User;
import lzit.rj.bookstore.utils.DataSourceUtils;
import lzit.rj.bookstore.utils.PageBean;

public class OrderDao {
	// 添加订单
	public void addOrder(Order order) throws SQLException {
		String sql = "insert into orders values(?,?,?,?,null,?)";

		QueryRunner runner = new QueryRunner(); // 手动事务

		runner.update(DataSourceUtils.getConnectionByTransaction(), sql,
				order.getId(), order.getMoney(), order.getReceiverinfo(),
				order.getPaystate(), order.getUser_id());
	}

	// 根据用户的角色来查询订单
	public List<Order> findOrder(User user,String condition) throws SQLException {

		String sql = "select users.username,users.nickname,orders.* from orders,users where users.id=orders.user_id ";

		if ("user".equals(user.getRole())) {

			sql += " and user_id=" + user.getId();
		}
		if(condition != null) {
			sql += " and username like '%" + condition+"%' ";
		}
	
		sql += " order by user_id,ordertime";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanListHandler<Order>(Order.class));
	}
	// 根据用户的角色来查询订单
	public PageBean<Order> findOrder(PageBean<Order> pb) throws SQLException {
		
		String sql = "select users.username,users.nickname,orders.* from orders,users where users.id=orders.user_id ";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String condition = pb.getCondition().getUsername();
		if(condition != null && !"".equals(condition)) {
			sql += " and username like '%" + condition+"%' ";
		}
		
		sql += " order by user_id,ordertime ";
		
		 // 查询总记录数
        int totalCount = this.queryCount(pb.getCondition());
        if(totalCount > 0) {
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
	        //计算查询的起始行
	        int index = (currentPage - 1) * pb.getRecordNumPerPage();
	        //返回的行s数
	        int count = pb.getRecordNumPerPage();
	        sql = sql+" limit "+index+","+count;
			pb.setList(runner.query(sql, new BeanListHandler<Order>(Order.class)));
        }
        System.out.println(sql);
		return pb;
	}
	public int queryCount(Order o) throws SQLException {
		String sql = "select count(*) from orders,users where users.id=orders.user_id ";
		
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String name = o.getUsername();
		if (name != null && !"".equals(name)) {
			sql = sql+"  and users.username like '%"+name+"%'";
		}
		System.out.println("count : "+sql);
		return  ((Long) runner.query(sql, new ScalarHandler())).intValue();
	}
	// 根据id删除订单
	public void delOrderById(String id) throws SQLException {
		String sql = "delete  from orders where id=?";
		QueryRunner runner = new QueryRunner();
		runner.update(DataSourceUtils.getConnectionByTransaction(), sql, id);
	}

}
