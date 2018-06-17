package cn.edu.hbpu.edu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.bean.Teacher;
import cn.edu.hbpu.edu.db.DBCPUtils;
import cn.edu.hbpu.edu.util.StringUtil;

/**
 * 
 * @ClassName: StaffDAO
 * @Description: 教师操作
 * @author ganquanzhong
 * @date 2018年4月25日 下午4:28:54
 */
public class TeacherDAO implements BaseDAO<Teacher> {
	// 获取数据库连接资源
	QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());

	//登录
	public Teacher login(Teacher teac){
		Teacher teacher = new Teacher();
		
		String sql = "select * from teacherinfo where loginname=? and password=?";
		
		BeanHandler<Teacher> bh = new BeanHandler<Teacher>(Teacher.class);
		
		try {
			teacher = runner.query(sql, bh,teac.getLoginname(),teac.getPassword());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return teacher;
	}
	
	
	/**
	 * 
	* @Title: getList
	* @Description: // 查询所有列表
	* @author ganquanzhong
	* @date  2018年4月26日 下午12:23:54
	* @return
	 */
	public List<Teacher> getList() {
		List<Teacher> list = new ArrayList<Teacher>();

		String sql = "select * from teacherinfo where isDel=0 order by teacherid asc";
		// 因为返回结果是List集合，所以使用BeanListHandler，而不是用BeanHandler（代表返回结果为单个对象）
		BeanListHandler<Teacher> bh = new BeanListHandler<Teacher>(Teacher.class);

		try {
			list = runner.query(sql, bh);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	
	
	// 添加
/*	public void insert(String username, String password) {

		Staff staff = null;// 声明一个teacherinfo对象
		String sql = "insert into staffinfo value()";
		BeanHandler<Staff> bh = new BeanHandler<Staff>(Staff.class);
		try {
			staff = runner.query(sql, bh);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/

	@Override
	public int getCount(List<String> str) {
		Long num = null;
		StringBuilder sb = new StringBuilder("select count(*) from teacherinfo where isDel='0' ");

		// 查询条件添加
		if (StringUtil.isNotEmpty(str.get(0))) {
			sb.append(" and teachername like '%" + str.get(0) + "%'");
		}
		// 注意去除提示字符【教授课程】
		if (StringUtil.isNotEmpty(str.get(1)) && !"课程".equals(str.get(1))) {
			sb.append(" and tsubjectname ='" + str.get(1) + "'");
		}

		// ScalarHandler 将结果集中某一条记录的其中某一列的数据存成Object。
		ScalarHandler<Teacher> sh = new ScalarHandler<Teacher>();
		
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
	public List<Teacher> findByTerm(PageBean<Teacher> page, List<String> str) {
		List<Teacher> list = new ArrayList<Teacher>();
		
		StringBuilder sb = new StringBuilder("select * from teacherinfo  where isDel='0' ");

		
		// 查询条件添加
		if (StringUtil.isNotEmpty(str.get(0))) {
			sb.append(" and teachername like '%" + str.get(0) + "%'");
		}
		// 注意去除提示字符【教授课程】
		if (StringUtil.isNotEmpty(str.get(1)) && !"课程".equals(str.get(1))) {
			sb.append(" and tsubjectname ='" + str.get(1) + "'");
		}

		sb.append(" order by teacherid desc limit ?,? ");

		// 将结果集中的每一行数据都封装到一个对应的JavaBean实例中，存放到List里。
		BeanListHandler<Teacher> bh = new BeanListHandler<Teacher>(Teacher.class);

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
	public Teacher findById(long id) {
		Teacher teacher = null;
		String sql = "select * from teacherinfo where teacherid=?";
		BeanHandler<Teacher> bh = new BeanHandler<Teacher>(Teacher.class);
		try {
			teacher = runner.query(sql, bh, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return teacher;
	}

	/**
	 * 
	* @Title: addStaff
	* @Description: 添加员工
	* @author ganquanzhong
	* @date  2018年4月25日 下午10:49:16
	* @param student
	* @return
	 */
	public int add(Teacher teacher) {
		int result = 0;
		String sql = "insert into teacherinfo(teachername,sex,age,idcard, "
				+ "tsubjectname,rank,tgrade,address,salaryacount,phone,jointime,egcontact,egphone,"
				+ "thour,wage,isDel,Status)"
				+ "values(?,?,?,?, ?,?,?,?,?,?,?,?,?  ,?,?,0,'正常')";
		try {
			result = runner.update(sql,teacher.getTeachername(),teacher.getSex(),teacher.getAge(),teacher.getIdcard(),
					teacher.getTsubjectname(),teacher.getRank(),teacher.getTgrade(),
					teacher.getAddress(),teacher.getSalaryacount(),teacher.getPhone(),teacher.getJointime(),
					teacher.getEgcontact(),teacher.getEgphone(),teacher.getThour(),teacher.getWage()
					);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;
	}

	// 更新id的teacher信息
	public int update(Teacher teacher) {
		int i = 0;
		String sql = "update teacherinfo set teachername=?,sex=?,age=?,idcard=?,"
				+ " tsubjectname=?,rank=?,tgrade=?,address=?,salaryacount=?,phone=?,jointime=?,egcontact=?,egphone=?,"
				+ " thour=?,wage=?,Status=?  where teacherid=? ";
		try {
			i = runner.update(sql, teacher.getTeachername(),teacher.getSex(),teacher.getAge(),teacher.getIdcard(),
					teacher.getTsubjectname(),teacher.getRank(),teacher.getTgrade(),
					teacher.getAddress(),teacher.getSalaryacount(),teacher.getPhone(),teacher.getJointime(),teacher.getEgcontact(),teacher.getEgphone(),
					teacher.getThour(),teacher.getWage(),teacher.getStatus(),teacher.getTeacherid()
					  );
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	// delete
	public int delete(long id) {
		int i = 0;
		String sql = "update teacherinfo set isDel=1 where teacherid=?";
		try {
			i = runner.update(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
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
		
		System.out.println(new TeacherDAO().findById(1001001));
		
		List<Teacher> list = new TeacherDAO().getList();
		System.out.println(list.size());
		for (Teacher teacher1 : list) {
			System.out.println(teacher1);
		}

	}

}
