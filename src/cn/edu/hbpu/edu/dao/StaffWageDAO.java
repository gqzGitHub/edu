package cn.edu.hbpu.edu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import cn.edu.hbpu.edu.bean.AllStaff;
import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.bean.Staffwage;
import cn.edu.hbpu.edu.db.DBCPUtils;
import cn.edu.hbpu.edu.util.StringUtil;

/**
 * 
 * @ClassName: TeacherwageDAO
 * @Description: 员工操作
 * @author ganquanzhong
 * @date 2018年4月25日 下午4:28:54
 */
public class StaffWageDAO implements BaseDAO<AllStaff> {
	// 获取数据库连接资源
	QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());

	// 查询所有列表
	public List<AllStaff> getList() {
		List<AllStaff> list = new ArrayList<AllStaff>();

		String sql = "select * from staffwageinfo,staffinfo where staffwageinfo.staffid=staffinfo.staffid  order by staffwageid asc";
		// 因为返回结果是List集合，所以使用BeanListHandler，而不是用BeanHandler（代表返回结果为单个对象）
		BeanListHandler<AllStaff> bh = new BeanListHandler<AllStaff>(
				AllStaff.class);

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
		StringBuilder sb = new StringBuilder(
				"select COUNT(*) from staffwageinfo,staffinfo where staffwageinfo.staffid=staffinfo.staffid   ");

		// 查询条件添加
		if (StringUtil.isNotEmpty(str.get(0))) {
			sb.append(" and staffinfo.username like '%" + str.get(0) + "%'");
		}
		if (StringUtil.isNotEmpty(str.get(1)) && !"岗位类型".equals(str.get(1))) {
			sb.append(" and staffinfo.posttype like '%" + str.get(1) + "%'");
		}
		// // 注意去除提示字符【岗位类型】
		// if (StringUtil.isNotEmpty(str.get(2)) && !"岗位类型".equals(str.get(2)))
		// {
		// sb.append(" and posttype ='" + str.get(2) + "'");
		// }

		// ScalarHandler 将结果集中某一条记录的其中某一列的数据存成Object。
		ScalarHandler<Staffwage> sh = new ScalarHandler<Staffwage>();
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
	public List<AllStaff> findByTerm(PageBean<AllStaff> page, List<String> str) {
		List<AllStaff> list = new ArrayList<AllStaff>();
		StringBuilder sb = new StringBuilder("select * from staffwageinfo,staffinfo where staffwageinfo.staffid=staffinfo.staffid  ");

		// 查询条件添加
		if (StringUtil.isNotEmpty(str.get(0))) {
			sb.append(" and staffinfo.username like '%" + str.get(0) + "%'");
		}
		if (StringUtil.isNotEmpty(str.get(1)) && !"岗位类型".equals(str.get(1))) {
			sb.append(" and staffinfo.posttype like '%" + str.get(1) + "%'");
		}

		// // 注意去除提示字符【岗位类型】
		// if (StringUtil.isNotEmpty(str.get(2)) && !"岗位类型".equals(str.get(2)))
		// {
		// sb.append(" and posttype ='" + str.get(2) + "'");
		// }

		sb.append(" order by staffwageid asc limit ?,? ");

		// 将结果集中的每一行数据都封装到一个对应的JavaBean实例中，存放到List里。
		BeanListHandler<AllStaff> bh = new BeanListHandler<AllStaff>(AllStaff.class);

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
	public AllStaff findById(long id) {
		AllStaff allStaff = null;
		String sql = "select * from staffwageinfo,staffinfo where staffwageinfo.staffid=staffinfo.staffid and staffwageinfo.staffid=? ";
		BeanHandler<AllStaff> bh = new BeanHandler<AllStaff>(AllStaff.class);
		try {
			allStaff = runner.query(sql, bh, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return allStaff;
	}

	// 根据Id查询teacherwage
	public Staffwage findStaffwageById(long id) {
		Staffwage staffwage = null;
		String sql = "select * from staffwageinfo where staffid=?";
		BeanHandler<Staffwage> bh = new BeanHandler<Staffwage>(	Staffwage.class);
		try {
			staffwage = runner.query(sql, bh, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return staffwage;
	}

	/**
	 * 
	 * @Title: insert
	 * @Description: //teacherwageinfo
	 * @author ganquanzhong
	 * @date 2018年4月28日 下午7:29:41
	 * @param teacherwage
	 * @return
	 */
	public int insert(Staffwage staffwage) {
		int i = 0;
		String sql = "insert into staffwageinfo(staffid,deductwage,fine,totalwage,month) "
				+ "values(?,?,?,?,now()) ";
		try {
			i = runner.update(sql, staffwage.getStaffid(),
					staffwage.getDeductwage(), staffwage.getFine(),
					staffwage.getTotalwage());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	public int update(Staffwage staffwage) {
		int i = 0;
		String sql = "update staffwageinfo set deductwage=?,fine=?,totalwage=?,month=? "
				+ " where staffid=? ";
		try {
			i = runner.update(sql, staffwage.getDeductwage(),
					staffwage.getFine(), staffwage.getTotalwage(),
					staffwage.getMonth(), staffwage.getStaffid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	@Test
	public void test() {

		StaffWageDAO staffWageDAO = new StaffWageDAO();

		Staffwage staffwage = new Staffwage();

//		staffwage.setStaffid(100004);
//		staffwage.setDeductwage((double)200);
//		staffwage.setFine((double)200);

		System.out.println(staffWageDAO.findById(100004));

	}

}
