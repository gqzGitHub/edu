package cn.edu.hbpu.edu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.edu.hbpu.edu.bean.Course;
import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.db.DBCPUtils;
import cn.edu.hbpu.edu.util.StringUtil;


/**
 * 
* @ClassName: CourseDAO
* @Description: TODO(这里用一句话描述这个类的作用)
* @author ganquanzhong
* @date 2018年5月2日 下午8:44:03
 */
public class CourseDAO implements BaseDAO<Course>{
	
	 QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
	 
	public List<Course> getCourseList(){
		List<Course> list = new ArrayList<Course>();
		String sql = "select * from courseinfo where status='正常状态'";
		BeanListHandler<Course> bh = new BeanListHandler<Course>(Course.class);
		try {
			list = runner.query(sql, bh);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
				
	}
	
	@Override
	public int getCount(List<String> str) {
		Long num= null;
		StringBuilder sb = new StringBuilder("select count(*) from courseinfo where isDel=0");
		if(StringUtil.isNotEmpty(str.get(0))){
			sb.append(" and coursename like '%"+str.get(0)+"%'");
		}
		
		
		ScalarHandler<Course> sh = new ScalarHandler<Course>();
		Object object;
		try {
			  object =runner.query(sb.toString(), sh);
			  num=(Long) object;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num.intValue();
	}

	@Override
	public List<Course> findByTerm(PageBean<Course> page, List<String> str) {
		
		List<Course> list = new ArrayList<Course>();
		
		StringBuilder sb = new StringBuilder("select * from courseinfo where isDel=0");
		if(StringUtil.isNotEmpty(str.get(0))){
			sb.append(" and coursename like '%"+str.get(0)+"%'");
		}
		
		sb.append(" order by courseid desc limit ?,?");
		
		BeanListHandler<Course> bh = new BeanListHandler<Course>(Course.class);
		int start = 0;
		if(page.getCurrentPage()>=1){
			start = (page.getCurrentPage()-1)*page.getPageSize();
		}
		try {
			list = runner.query(sb.toString(), bh,start,page.getPageSize());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Course findById(long id) {
		// TODO Auto-generated method stub
		return null;
	}


	/**
	 * 
	* @Title: addCourse
	* @Description: 添加 courseinfo
	* @author ganquanzhong
	* @date  2018年5月2日 下午8:24:45
	* @param course
	* @return
	 */
	public int add(Course course){
		 int result = 0;
		 String sql = "insert into courseinfo(coursename,subjectid,schedule,status,isDel) values(?,?,?,'正常状态',0)";
		 try {
			result = runner.update(sql,course.getCoursename(),course.getSubjectid(),course.getSchedule());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return result;
	}
	
	public int delete(long id) {
		int i = 0;
		String sql = "update courseinfo set isDel=1 where courseid=?";
		try {
			i = runner.update(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	
	/**
	 * 
	* @Title: updateStatus
	* @Description: 停用启用
	* @author ganquanzhong
	* @date  2018年5月2日 下午8:42:58
	* @param flag
	* @param classid
	* @return
	 */
	public int updateStatus(String flag,String courseid){
		int result = 0;
		String sql="";
		if("1".equals(flag)){
			sql = "update courseinfo set status='已停用' where courseid=?";
		}else if ("2".equals(flag)) {
			sql = "update courseinfo set status='正常状态' where courseid=?";
		}
		try {
			result = runner.update(sql, courseid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result ;
	}
	
	
}
