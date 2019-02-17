package lzit.rj.bookstore.utils;

import java.util.List;


public class PageBean<T> {
	
	private int totalRecord=0;
	private int totalPage = 1;
	private int recordNumPerPage = 6;
	private int currentPage = 1;
	private List<T> list;
	private T condition;
	
	
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public T getCondition() {
		return condition;
	}
	public void setCondition(T condition) {
		this.condition = condition;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		totalPage = totalRecord % recordNumPerPage == 0 ? totalRecord / recordNumPerPage : totalRecord / recordNumPerPage+1;
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getRecordNumPerPage() {
		return recordNumPerPage;
	}
	public void setRecordNumPerPage(int recordNumPerPage) {
		this.recordNumPerPage = recordNumPerPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	
}
