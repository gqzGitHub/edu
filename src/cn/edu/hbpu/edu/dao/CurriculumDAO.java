package cn.edu.hbpu.edu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import cn.edu.hbpu.edu.bean.Curriculum;
import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.db.DBCPUtils;
import cn.edu.hbpu.edu.util.StringUtil;

/**
 * 
 * @ClassName: CurriculumDAO
 * @Description: 课程表
 * @author ganquanzhong
 * @date 2018年4月25日 下午4:28:54
 */
public class CurriculumDAO implements BaseDAO<Curriculum> {
	// 获取数据库连接资源
	QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());

	
	
	/**
	 * 
	* @Title: getList
	* @Description: // 查询三个表的数据
	* @author ganquanzhong
	* @date  2018年4月26日 下午12:23:54
	* @return
	 */
	public List<Curriculum> getList() {
		List<Curriculum> list = new ArrayList<Curriculum>();

		String sql = "select curriculuminfo.* ,  classinfo.classname,  classinfo.collegename ,courseinfo.coursename ,"
				+ "courseinfo.schedule from  curriculuminfo INNER JOIN classinfo on curriculuminfo.classid=classinfo.classid "
				+ "INNER JOIN courseinfo on curriculuminfo.courseinfoid=courseinfo.courseid;";
		
		// 因为返回结果是List集合，所以使用BeanListHandler，而不是用BeanHandler（代表返回结果为单个对象）
		BeanListHandler<Curriculum> bh = new BeanListHandler<Curriculum>(Curriculum.class);

		try {
			list = runner.query(sql, bh);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public int getCount(List<String> str) {
		Long num = null;
		StringBuilder sb = new StringBuilder("select count(*) , curriculuminfo.* ,  classinfo.classname,  classinfo.collegename "
				+ ",courseinfo.coursename ,courseinfo.schedule,courseinfo.status   "
				+ "from  curriculuminfo INNER JOIN classinfo on curriculuminfo.classid=classinfo.classid "
				+ "INNER JOIN courseinfo on curriculuminfo.courseinfoid=courseinfo.courseid "
				
				);

		// 查询条件添加  班级名
		if (StringUtil.isNotEmpty(str.get(0))) {
			sb.append(" and classinfo.classname like '%" + str.get(0) + "%'");
		}
//		// 注意去除提示字符【教授课程】
		if (StringUtil.isNotEmpty(str.get(1))) {
			sb.append(" and classinfo.collegename like '%" + str.get(1) + "%'");
		}

		// ScalarHandler 将结果集中某一条记录的其中某一列的数据存成Object。
		ScalarHandler<Curriculum> sh = new ScalarHandler<Curriculum>();
		
		Object object;
		try {
			object = runner.query(sb.toString(), sh);
			num = (Long) object;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num.intValue();
	}

	
	// 根据条件查询，并且根据分业对象将集合list每页
	public List<Curriculum> findByTerm(PageBean<Curriculum> page, List<String> str) {
		List<Curriculum> list = new ArrayList<Curriculum>();
		
		StringBuilder sb = new StringBuilder("select  curriculuminfo.* ,  classinfo.classname,  classinfo.collegename "
				+ ",courseinfo.coursename,courseinfo.schedule,courseinfo.status  "
				+ "from  curriculuminfo INNER JOIN classinfo on curriculuminfo.classid=classinfo.classid "
				+ "INNER JOIN courseinfo on curriculuminfo.courseinfoid=courseinfo.courseid "
				
				);
		
		// 查询条件添加
		if (StringUtil.isNotEmpty(str.get(0))) {
			sb.append(" and classinfo.classname like '%" + str.get(0) + "%'");
		}
		// 注意去除提示字符【教授课程】
		if (StringUtil.isNotEmpty(str.get(1))) {
			sb.append(" and classinfo.collegename like '%" + str.get(1) + "%'");
		}

		sb.append(" order by curriculumid desc limit ?,? ");

		// 将结果集中的每一行数据都封装到一个对应的JavaBean实例中，存放到List里。
		BeanListHandler<Curriculum> bh = new BeanListHandler<Curriculum>(Curriculum.class);

		// 计算limit中的start

		int start = 0;
		if (page.getCurrentPage() >= 1) {
			start = (page.getCurrentPage() - 1) * page.getPageSize();
		}

		try {
			list = runner.query(sb.toString(), bh, start, page.getPageSize());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 根据Id查询Staff
	public Curriculum findById(long id) {
		Curriculum curriculum = null;
		String sql = "select * from curriculuminfo where curriculumid=?";
		BeanHandler<Curriculum> bh = new BeanHandler<Curriculum>(Curriculum.class);
		try {
			curriculum = runner.query(sql, bh, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return curriculum;
	}

	public int add(Curriculum curriculum) {
		int result = 0;
		String sql = "insert into  curriculuminfo(classid,courseinfoid,weekday,"
				+ " classtime,curriculumstart,curriculumend,isDel) "
				+ "values(?,?,?,?,?,?,0)";
		try {
			result=runner.update(sql, curriculum.getClassid(),curriculum.getCourseinfoid(),curriculum.getWeekday(),
					curriculum.getClasstime(),curriculum.getCurriculumstart(),curriculum.getCurriculumend());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	
	
	@Test
	public void test() {
//		System.out.println(new TeacherDAO().delete(1001001));

//		Teacher teacher=new Teacher();
//		teacher.setTeachername("林梅");
//		teacher.setSex("女");
//		teacher.setPhone("13597174271");
//		teacher.setTeacherid((long) 1001001);
//		System.out.println(new TeacherDAO().update(teacher));
		
		System.out.println(new CurriculumDAO().findById(2018001));
		
		List<Curriculum> list = new CurriculumDAO().getList();
		System.out.println(list.size());
		for (Curriculum teacher1 : list) {
			System.out.println(teacher1);
		}

	}




}
