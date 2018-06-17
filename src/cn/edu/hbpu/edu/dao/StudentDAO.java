package cn.edu.hbpu.edu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.bean.Student;
import cn.edu.hbpu.edu.db.DBCPUtils;
import cn.edu.hbpu.edu.util.StringUtil;
 

public class StudentDAO implements BaseDAO<Student>{
	
	QueryRunner  runner = new QueryRunner(DBCPUtils.getDataSource());
	
	//添加潜在客户
	public int addpotStudent(Student student){	
		int  result=0;
		String sql = "insert into studentinfo(studentname,sex,birthday,phone," +
				"address,infosource,guardian,gdphone,relation,regtime,subjectid," +
				"grade,school,remark,status)" +
				"values(?,?,?,?,?,?,?,?,?,now(),?,?,?,?,'未报名')";
		
		try {
			result = runner.update(sql, student.getStudentname(),
					student.getSex(),student.getBirthday(),
					student.getPhone(),student.getAddress(),student.getInfosource(),
					student.getGuardian(),student.getGdphone(),student.getRelation(),
					student.getSubjectid(),student.getGrade(),
					student.getSchool(),student.getRemark()
					);
		} catch (SQLException e) {
			 
			e.printStackTrace();
		}
		
		return result;
	}
	//查询所有潜在学生人数
	@Override
	public int getCount(List<String> str) {
		Long num= null;
		StringBuilder sb = new StringBuilder("select count(*) from studentinfo stu,subjectinfo sub  where stu.status='未报名' and stu.subjectid=sub.subjectid");
		if(StringUtil.isNotEmpty(str.get(0))){
			sb.append(" and stu.studentname like '%"+str.get(0)+"%'");
		}
		if(StringUtil.isNotEmpty(str.get(1))){
			sb.append(" and stu.school like '%"+str.get(1)+"%'");
		}
		if(StringUtil.isNotEmpty(str.get(2))&& !"信息来源".equals(str.get(2))){
			sb.append(" and stu.infosource ='"+str.get(2)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(3))&& !"监护人关系".equals(str.get(3))){
			sb.append(" and stu.relation ='"+str.get(3)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(4))&& !"年级".equals(str.get(4)) ){
			sb.append(" and stu.grade ='"+str.get(4)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(5))){
			sb.append(" and stu.regtime >='"+str.get(5)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(6))){
			sb.append(" and stu.regtime <='"+str.get(6)+"'");
		}
		ScalarHandler<Student> sh = new ScalarHandler<Student>();
		Object object;
		try {
			  object =runner.query(sb.toString(), sh);
			  num=(Long) object;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num.intValue();
	}
	//根据查询条件来查询
	@Override
	public List<Student> findByTerm(PageBean<Student> page,List<String> str) {
		List<Student> list = new ArrayList<Student>();
		StringBuilder sb = new StringBuilder("select stu.*,sub.subjectname from studentinfo stu,subjectinfo sub  where stu.status='未报名' and stu.subjectid=sub.subjectid");
		if(StringUtil.isNotEmpty(str.get(0))){
			sb.append(" and stu.studentname like '%"+str.get(0)+"%'");
		}
		if(StringUtil.isNotEmpty(str.get(1))){
			sb.append(" and stu.school like '%"+str.get(1)+"%'");
		}
		if(StringUtil.isNotEmpty(str.get(2))&& !"信息来源".equals(str.get(2))){
			sb.append(" and stu.infosource ='"+str.get(2)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(3))&& !"监护人关系".equals(str.get(3))){
			sb.append(" and stu.relation ='"+str.get(3)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(4))&& !"年级".equals(str.get(4)) ){
			sb.append(" and stu.grade ='"+str.get(4)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(5))){
			sb.append(" and stu.regtime >='"+str.get(5)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(6))){
			sb.append(" and stu.regtime <='"+str.get(6)+"'");
		}
		sb.append(" order by regtime desc limit ?,?");
		BeanListHandler<Student> bh = new BeanListHandler<Student>(Student.class);
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
	
	//根据Id查询Student
	@Override
	public Student findById(long id) {
		Student student = null;
		String sql = "select * from studentinfo where studentid=?";
		BeanHandler<Student> bh = new BeanHandler<Student>(Student.class);
		try {
			student = runner.query(sql, bh,id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return student;
	}
	
	public int updateStudentStatus(String studentid){
		
		int result = 0;
		String sql = "update studentinfo set status = '正常' where studentid=?";
		try {
			result = runner.update(sql, studentid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//添加学生的课程
	public int updateStudentCourse(Student student){
		int result = 0;
		String sql = "update studentinfo set courseid = ?,classid=? where studentid=?";
		try {
			result = runner.update(sql, student.getCourseid(),student.getClassid(),student.getStudentid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int getCountByInfosource(String infosource){
		
		Long num= null;
		StringBuilder sb = new StringBuilder("select count(*) from studentinfo where infosource=?");
		 
		ScalarHandler<Student> sh = new ScalarHandler<Student>();
		Object object;
		try {
			  object =runner.query(sb.toString(), sh,infosource);
			  num=(Long) object;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num.intValue();
		
	}
	
	public List<Student> getList(){
		
		List<Student> list = new ArrayList<Student>();
		
		String sql = "select * from where studentinfo";
		
		BeanListHandler<Student> bh = new BeanListHandler<Student>(Student.class);
		
		try {
			list = runner.query(sql, bh);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
