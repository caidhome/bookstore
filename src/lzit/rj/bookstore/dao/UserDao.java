package lzit.rj.bookstore.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import lzit.rj.bookstore.domain.User;
import lzit.rj.bookstore.utils.DataSourceUtils;
import lzit.rj.bookstore.utils.Md5Utils;

public class UserDao {
	// 注册操作
	public void addUser(User user) throws SQLException {

		String sql = "insert into users values(null,?,?,?,?,?,?,?,null)";

		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

		runner.update(sql, user.getUsername(),
				Md5Utils.md5(user.getPassword()), user.getNickname(),
				user.getEmail(), "user", 0, user.getActivecode());
	}

	// 查找用户，根据激活码
	public User findUserByActiveCode(String activeCode) throws SQLException {

		String sql = "select * from users where activecode=?";

		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

		return runner.query(sql, new BeanHandler<User>(User.class), activeCode);
	}

	// 激活用户
	public void activeUser(String activeCode) throws SQLException {

		String sql = "update users set state=1 where activecode=?";

		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

		runner.update(sql, activeCode);
	}

	// 登录操作
	public User findUserByLogin(String username, String password,String role) throws SQLException {
		String sql = "select * from users where username=? and password=? and role=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanHandler<User>(User.class), username,
				Md5Utils.md5(password),role);
	}

	public User findUserById(String id) throws SQLException {
		String sql = "select * from users where id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanHandler<User>(User.class), id);
	}

	public void updateUser(User user) throws SQLException {
		/*long time = System.currentTimeMillis()
				- user.getUpdatetime().getTime();*/
		String sql = "update users set password=? ";
		if(user.getUsername() != null) {
			sql = sql + " , username='"+user.getUsername()+"' ";
		}
		if(user.getNickname() != null) {
			sql = sql + " , nickname='"+user.getNickname()+"' ";
		}
		if(user.getEmail() != null) {
			sql = sql + " , email='"+user.getEmail()+"' ";
		}
		sql = sql + " where id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
//		System.out.println(sql);
		runner.update(sql,Md5Utils.md5(user.getPassword()), user.getId());
	}


}
