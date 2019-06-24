package cn.edu.hbpu.edu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.bean.Score;
import cn.edu.hbpu.edu.db.DBCPUtils;

public class ScoreDAO implements BaseDAO<Score> {
	
QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
	
  public int addScore(Score score){
	  
	  int result = 0;
	  String sql = "insert into scoreinfo(studentid,courseid,score) values(?,?,?)";
	  
	  try {
		result = runner.update(sql, score.getStudentid(),score.getCourseid(),score.getScore());
	} catch (SQLException e) {
		e.printStackTrace();
	}
	  return result;
	  
  }

	@Override
	public int getCount(List<String> str) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Score> findByTerm(PageBean<Score> page, List<String> str) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Score findById(long id) {
		// TODO Auto-generated method stub
		return null;
	}


	public int updateScore(Score score){
		
		int result = 0;
		String sql = "update scoreinfo set score=? where studentid=? and courseid=?";
		try {
			result = runner.update(sql, score.getScore(),score.getStudentid(),score.getCourseid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Score findByStudentIdAndCourseId(Score score){
		String sql = "select sc.*,stu.studentname,cou.coursename from scoreinfo sc,studentinfo stu,courseinfo cou where sc.studentid=? and sc.courseid=? " +
				"and sc.studentid=stu.studentid and stu.courseid=cou.courseid";
		BeanHandler<Score> bh = new BeanHandler<Score>(Score.class);
		try {
			score = runner.query(sql, bh,score.getStudentid(),score.getCourseid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return score;
	}
	
	public List<Score> findAll(String classid){
		List<Score> list = new ArrayList<Score>();
		String sql = "select sc.*,stu.studentname,cou.coursename from scoreinfo sc,studentinfo stu,courseinfo cou where sc.studentid=stu.studentid and " +
				"stu.courseid=cou.courseid and stu.classid=?";
		BeanListHandler<Score> bh = new BeanListHandler<Score>(Score.class);
		try {
			list = runner.query(sql, bh,classid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int delScore(String scoreid){
		int result = 0;
		String sql = "delete from scoreinfo where scoreid=?";
		try {
			result = runner.update(sql, scoreid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
