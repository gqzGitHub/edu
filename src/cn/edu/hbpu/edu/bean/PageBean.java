package cn.edu.hbpu.edu.bean;

import java.util.ArrayList;
import java.util.List;

public class PageBean<T> {
	private int currentPage; //当前页码
	private int pageSize;   //每页记录条数
	private int totalNum; //总数据条数
	private int totalPage; //总页码数
	private int first = 1; //首页
	private int pre;//上一页
	private int next; //下一页
	private int last;//尾页
	
	

	private List<T> list = new ArrayList<T>(); //数据集

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getPre() {
		return pre;
	}

	public void setPre(int pre) {
		this.pre = pre;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public PageBean() {
	}

	public PageBean(int currentPage, int pageSize, int totalNum, int totalPage, int first, int pre, int next, int last,
			List<T> list) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalNum = totalNum;
		this.totalPage = totalPage;
		this.first = first;
		this.pre = pre;
		this.next = next;
		this.last = last;
		this.list = list;
	}

}
