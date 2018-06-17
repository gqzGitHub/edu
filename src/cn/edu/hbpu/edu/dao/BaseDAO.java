package cn.edu.hbpu.edu.dao;

import java.util.List;

import cn.edu.hbpu.edu.bean.PageBean;
/**
 *   DAO接口
 * @author Mr.Jiang
 *
 *  
 */
public interface BaseDAO<T> {
	
	//查询总记录数
	public int getCount(List<String> str);
	
	//根据查询条件来查询
	
	public List<T> findByTerm(PageBean<T> page,List<String> str);
	
	public T findById(long id);

}
