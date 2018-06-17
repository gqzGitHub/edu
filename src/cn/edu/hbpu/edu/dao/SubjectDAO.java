package cn.edu.hbpu.edu.dao;

 

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.edu.hbpu.edu.bean.Subject;
import cn.edu.hbpu.edu.db.DBCPUtils;


public class SubjectDAO {
	
	QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
	
	//获取所有学科
	public  List<Subject> getSubjects(){
		
		List<Subject> list = new ArrayList<Subject>();
		String sql = "select * from subjectinfo where status='正常'";
		BeanListHandler<Subject> bh = new BeanListHandler<Subject>(Subject.class);
		try {
			list = runner.query(sql, bh);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
   public static void main(String[] args) {
	   SubjectDAO dao = new SubjectDAO();
	  System.out.println( dao.getSubjects().get(0).getSubjectname());
}
}
