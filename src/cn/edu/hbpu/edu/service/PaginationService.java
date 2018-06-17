package cn.edu.hbpu.edu.service;


import java.util.List;

import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.dao.BaseDAO;

public class PaginationService<T> {
	
	private BaseDAO<T>  dao;
	public PaginationService(BaseDAO<T> dao) {
		super();
		this.dao = dao;
	}
	public  PageBean<T> paging(PageBean<T> page,List<String> list){
		 //获取中记录数
		int totalNum= dao.getCount(list);
		//计算总页数
		int totalPage=0;
		if(totalNum==0){
			 totalPage=1;
		}else {
			if(totalNum%page.getPageSize()==0){
				totalPage =  totalNum/page.getPageSize() ;
			}
			else {
				totalPage =  totalNum/page.getPageSize()+1 ;
			}
		}
		//防止无限上一页
		if(page.getCurrentPage()<=1){
			page.setCurrentPage(1);
		}
		//防止无限下一页
		if(page.getCurrentPage()>=totalPage){
			page.setCurrentPage(totalPage);
		}
		//设置总记录数
		page.setTotalNum(totalNum);
		//设置总页数
		page.setTotalPage(totalPage);
		//设置上一页,下一页
		
		page.setPre(page.getCurrentPage()-1);
		
		page.setNext(page.getCurrentPage()+1);
		//设置尾页
		page.setLast(totalPage);
		//将数据存入分页的javabean中
		page.setList(dao.findByTerm(page, list));
		return page;
		
	}

}
