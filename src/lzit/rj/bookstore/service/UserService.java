package lzit.rj.bookstore.service;

import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.security.auth.login.LoginException;

import lzit.rj.bookstore.dao.UserDao;
import lzit.rj.bookstore.domain.User;
import lzit.rj.bookstore.exception.ActiveCodeException;
import lzit.rj.bookstore.exception.RegistException;
import lzit.rj.bookstore.utils.MailUtils;

public class UserService {
	// 注册操作
	public void regist(User user) throws RegistException {

		UserDao dao = new UserDao();
		try {
			dao.addUser(user);
			// 向注册成功的用户发送一封激活邮件。

			String emailMsg = "注册成功，请<a href='http://www.bookstore.com/activeUser?activeCode="
					+ user.getActivecode()
					+ "'>激活</a>,激活码为:"
					+ user.getActivecode();
			MailUtils.sendMail(user.getEmail(), emailMsg);

		} catch (SQLException e) {
			throw new RegistException("注册失败");
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}

	// 激活用户操作
	public void activeUser(String activeCode) throws SQLException {
		UserDao dao = new UserDao();
		// 1.根据激活码查询用户，要判断激活码是否过期.

		User user = dao.findUserByActiveCode(activeCode);

		if (user != null) {
			// 2.进行激活操作

			long time = System.currentTimeMillis()
					- user.getUpdatetime().getTime();

			if (time <= 24 * 60 * 1000 * 60) {
				// 激活
				dao.activeUser(activeCode);

			} else {
				throw new ActiveCodeException("激活码过期");
			}
		} else {
			throw new ActiveCodeException("用户不存在");
		}
	}

	// 登录操作
	public User login(String username, String password,String role) throws LoginException {
		// 需要注意用户是否激活
		if(username == null || password == null) {
			throw new LoginException("用户名或密码为空！");
		}
		UserDao dao = new UserDao();
		
		try {
			User user = dao.findUserByLogin(username, password,role);
			if (user != null) {
				// 判断用户是否激活
				if (user.getState() == 1) {
					return user;
				} else {
					throw new ActiveCodeException("用户未激活");
				}
			} else {
				throw new LoginException("用户名或密码错误");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new LoginException("用户名或密码错误");
		}

	}

	public User findUserById(String id) throws SQLException {
		return new UserDao().findUserById(id);
	}

	public void updateUser(User user) throws SQLException {
		new UserDao().updateUser(user);
	}


}
