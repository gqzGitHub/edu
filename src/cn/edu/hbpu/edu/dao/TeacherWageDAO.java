package cn.edu.hbpu.edu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import cn.edu.hbpu.edu.bean.AllTeacher;
import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.bean.Teacherwage;
import cn.edu.hbpu.edu.db.DBCPUtils;
import cn.edu.hbpu.edu.util.StringUtil;

/**
 * 
 * @ClassName: TeacherwageDAO
 * @Description: 员工操作
 * @author ganquanzhong
 * @date 2018年4月25日 下午4:28:54
 */
public class TeacherWageDAO implements BaseDAO<AllTeacher> {
	// 获取数据库连接资源
	QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());

	// 查询所有列表
	public List<AllTeacher> getList() {
		List<AllTeacher> list = new ArrayList<AllTeacher>();

		String sql = "select * from teacherwageinfo,teacherinfo where teacherwageinfo.teacherid=teacherinfo.teacherid  order by teacherwageid asc";
		// 因为返回结果是List集合，所以使用BeanListHandler，而不是用BeanHandler（代表返回结果为单个对象）
		BeanListHandler<AllTeacher> bh = new BeanListHandler<AllTeacher>(AllTeacher.class);

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
		StringBuilder sb = new StringBuilder("select COUNT(*) from teacherwageinfo,teacherinfo where teacherwageinfo.teacherid=teacherinfo.teacherid  ");

		// 查询条件添加
		if (StringUtil.isNotEmpty(str.get(0))) {
			sb.append(" and teacherinfo.teachername like '%" + str.get(0) + "%'");
		}
		if (StringUtil.isNotEmpty(str.get(1)) && !"课程".equals(str.get(1)) ) {
			sb.append(" and teacherinfo.tsubjectname like '%" + str.get(1) + "%'");
		}
//		// 注意去除提示字符【岗位类型】
//		if (StringUtil.isNotEmpty(str.get(2)) && !"岗位类型".equals(str.get(2))) {
//			sb.append(" and posttype ='" + str.get(2) + "'");
//		}

		// ScalarHandler 将结果集中某一条记录的其中某一列的数据存成Object。
		ScalarHandler<Teacherwage> sh = new ScalarHandler<Teacherwage>();
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
	public List<AllTeacher> findByTerm(PageBean<AllTeacher> page, List<String> str) {
		List<AllTeacher> list = new ArrayList<AllTeacher>();
		StringBuilder sb = new StringBuilder("select * from teacherwageinfo,teacherinfo where teacherwageinfo.teacherid=teacherinfo.teacherid ");

		// 查询条件添加
		if (StringUtil.isNotEmpty(str.get(0))) {
			sb.append(" and teacherinfo.teachername like '%" + str.get(0) + "%'");
		}

		if (StringUtil.isNotEmpty(str.get(1)) && !"课程".equals(str.get(1))  ) {
			sb.append(" and teacherinfo.tsubjectname like '%" + str.get(1) + "%'");
		}

//		// 注意去除提示字符【岗位类型】
//		if (StringUtil.isNotEmpty(str.get(2)) && !"岗位类型".equals(str.get(2))) {
//			sb.append(" and posttype ='" + str.get(2) + "'");
//		}

		sb.append(" order by teacherwageid asc limit ?,? ");

		// 将结果集中的每一行数据都封装到一个对应的JavaBean实例中，存放到List里。
		BeanListHandler<AllTeacher> bh = new BeanListHandler<AllTeacher>(AllTeacher.class);

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

	// 根据Id查询allteacher
	public AllTeacher findById(long id) {
		AllTeacher allTeacher = null;
		String sql = "select * from teacherwageinfo,teacherinfo where teacherwageinfo.teacherid=teacherinfo.teacherid and teacherwageinfo.teacherid=?  order by teacherwageid asc ";
		BeanHandler<AllTeacher> bh = new BeanHandler<AllTeacher>(AllTeacher.class);
		try {
			allTeacher = runner.query(sql, bh, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return allTeacher;
	}

	
	
	// 根据Id查询teacherwage
	public Teacherwage findTeacherWageById(long id) {
		Teacherwage teacherwage = null;
		String sql = "select * from teacherwageinfo where teacherid=?";
		BeanHandler<Teacherwage> bh = new BeanHandler<Teacherwage>(Teacherwage.class);
		try {
			teacherwage = runner.query(sql, bh, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return teacherwage;
	}
	
	
	/**
	 * 
	* @Title: insert
	* @Description: //teacherwageinfo
	* @author ganquanzhong
	* @date  2018年4月28日 下午7:29:41
	* @param teacherwage
	* @return
	 */
	public int insert(Teacherwage teacherwage) {
		int i = 0;
		String sql = "insert into teacherwageinfo(teacherid,period,fine,totalwage,month) "
				+ "values(?,?,?,?,now()) ";
		try {
			i = runner.update(sql,teacherwage.getTeacherid(),teacherwage.getPeriod(),
					teacherwage.getFine(),teacherwage.getTotalwage()				
					 );
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int update(Teacherwage teacherwage) {
		int i = 0;
		String sql = "update teacherwageinfo set period=?,fine=?,totalwage=?,month=? "
				+ " where teacherid=? ";
		try {
			i = runner.update(sql,teacherwage.getPeriod(),teacherwage.getFine(),teacherwage.getTotalwage(),teacherwage.getMonth(),
					teacherwage.getTeacherid()
					  );
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	
	
	@Test
	public void test() {

		TeacherWageDAO teacherWageDAO=new TeacherWageDAO();
		
		Teacherwage teacherwage=new Teacherwage();
		
		teacherwage.setTeacherid(Long.parseLong("1001008"));
		teacherwage.setPeriod(20);
		
		
		System.out.println(teacherWageDAO.insert(teacherwage));
		
		

	}

}
