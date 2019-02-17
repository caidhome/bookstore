package lzit.rj.bookstore.utils;

import java.util.UUID;

public class ActiveCodeUtils {

	public static String getActiveCode() {

		return UUID.randomUUID().toString();
	}
}
