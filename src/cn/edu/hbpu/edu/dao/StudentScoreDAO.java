package cn.edu.hbpu.edu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.bean.Student;
import cn.edu.hbpu.edu.db.DBCPUtils;
import cn.edu.hbpu.edu.util.StringUtil;


public class StudentScoreDAO implements BaseDAO<Student> {
	
	QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());

	@Override
	public int getCount(List<String> str) {
		Long num= null;
		StringBuffer sb= new StringBuffer("select count(*) from studentinfo stu,courseinfo cou where stu.classid=? and stu.courseid=cou.courseid");
		if(StringUtil.isNotEmpty(str.get(1))){
			sb.append(" and stu.studentname like '%"+str.get(1)+"%'");
		}
		ScalarHandler<Student> sh = new ScalarHandler<Student>();
		Object object;
		 try {
			object =runner.query(sb.toString(), sh,str.get(0));
			 num=(Long) object;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return num.intValue();
	}

	@Override
	public List<Student> findByTerm(PageBean<Student> page, List<String> str) {
		List<Student> list = new ArrayList<Student>();
		StringBuffer sb = new StringBuffer("select stu.studentid, stu.studentname,cou.courseid,cou.coursename from studentinfo stu,courseinfo cou where stu.classid=? and stu.courseid=cou.courseid");
		if(StringUtil.isNotEmpty(str.get(1))){
			sb.append(" and stu.studentname like '%"+str.get(1)+"%'");
		}
		BeanListHandler<Student> bh = new BeanListHandler<Student>(Student.class);
		try {
			list = runner.query(sb.toString(), bh,str.get(0));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Student findById(long id) {
		return null;
	}

}
