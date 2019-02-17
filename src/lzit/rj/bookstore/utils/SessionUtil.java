package lzit.rj.bookstore.utils;

import javax.servlet.http.HttpServletRequest;

import lzit.rj.bookstore.domain.User;

/**  
* Description:  
* @author Chenzhiwen  
* @date 2019年1月1日 上午10:21:55 
*/
public class SessionUtil {
	
	public static User findUserFromSession(HttpServletRequest req) {
		return  (User) req.getSession().getAttribute("user");
	}

}
