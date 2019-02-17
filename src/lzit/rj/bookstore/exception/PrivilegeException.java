package lzit.rj.bookstore.exception;

public class PrivilegeException extends RuntimeException {

	public PrivilegeException() {
		super();
	}

	public PrivilegeException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public PrivilegeException(String message, Throwable cause) {
		super(message, cause);
	}

	public PrivilegeException(String message) {
		super(message);
	}

	public PrivilegeException(Throwable cause) {
		super(cause);
	}

}
