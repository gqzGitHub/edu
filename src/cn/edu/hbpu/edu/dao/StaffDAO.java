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
import cn.edu.hbpu.edu.bean.Staff;
import cn.edu.hbpu.edu.db.DBCPUtils;
import cn.edu.hbpu.edu.util.StringUtil;

/**
 * 
 * @ClassName: StaffDAO
 * @Description: 员工操作
 * @author ganquanzhong
 * @date 2018年4月25日 下午4:28:54
 */
public class StaffDAO implements BaseDAO<Staff> {
	// 获取数据库连接资源
	QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());

	// 查询所有列表
	public List<Staff> getList() {
		List<Staff> list = new ArrayList<Staff>();

		String sql = "select * from staffinfo where isDel=0 order by staffId asc";
		// 因为返回结果是List集合，所以使用BeanListHandler，而不是用BeanHandler（代表返回结果为单个对象）
		BeanListHandler<Staff> bh = new BeanListHandler<Staff>(Staff.class);

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
				"select count(*) from staffinfo where isDel='0' ");

		// 查询条件添加
		if (StringUtil.isNotEmpty(str.get(0))) {
			sb.append(" and username like '%" + str.get(0) + "%'");
		}
		if (StringUtil.isNotEmpty(str.get(1))) {
			sb.append(" and collegename like '%" + str.get(1) + "%'");
		}
		// 注意去除提示字符【岗位类型】
		if (StringUtil.isNotEmpty(str.get(2)) && !"岗位类型".equals(str.get(2))) {
			sb.append(" and posttype ='" + str.get(2) + "'");
		}

		// ScalarHandler 将结果集中某一条记录的其中某一列的数据存成Object。
		ScalarHandler<Staff> sh = new ScalarHandler<Staff>();
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
	public List<Staff> findByTerm(PageBean<Staff> page, List<String> str) {
		List<Staff> list = new ArrayList<Staff>();
		// select count(*) from staffinfo s,staffwageinfo sw where s.isDel='0'
		// and s.staffid=sw.staffid
		StringBuilder sb = new StringBuilder(
				"select * from staffinfo  where isDel='0' ");

		// 查询条件添加
		if (StringUtil.isNotEmpty(str.get(0))) {
			sb.append(" and username like '%" + str.get(0) + "%'");
		}

		if (StringUtil.isNotEmpty(str.get(1))) {
			sb.append(" and collegename like '%" + str.get(1) + "%'");
		}

		// 注意去除提示字符【岗位类型】
		if (StringUtil.isNotEmpty(str.get(2)) && !"岗位类型".equals(str.get(2))) {
			sb.append(" and posttype ='" + str.get(2) + "'");
		}

		sb.append(" order by staffid desc limit ?,? ");

		// 将结果集中的每一行数据都封装到一个对应的JavaBean实例中，存放到List里。
		BeanListHandler<Staff> bh = new BeanListHandler<Staff>(Staff.class);

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
	public Staff findById(long id) {
		Staff staff = null;
		String sql = "select * from staffinfo where staffid=?";
		BeanHandler<Staff> bh = new BeanHandler<Staff>(Staff.class);
		try {
			staff = runner.query(sql, bh, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return staff;
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
	public int add(Staff staff) {
		int result = 0;
		String sql = "insert into staffinfo(username,sex,age,idcard,phone,collegename,"
				+ "posttype,jointime,arrangewage,senioritywage,prepay,regaddress,liveaddress,"
				+ "birthday,contractendtime,enterdate,remark,isDel,Status)"
				+ "values(?,?,?,?,?,?,  ?,?,?,?,?,?,?  ,?,?,now(),?,0,'正常')";
		try {
			result = runner.update(sql,staff.getUsername(),staff.getSex(),staff.getAge(),staff.getIdcard(),staff.getPhone(),
					staff.getCollegename(),staff.getPosttype(),staff.getJointime(),staff.getArrangewage(),
					staff.getSenioritywage(),staff.getPrepay(),staff.getRegaddress(),staff.getLiveaddress(),
					staff.getBirthday(),staff.getContractendtime(),staff.getRemark()
					);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;
	}

	// 更新id的staff信息
	public int update(Staff staff) {
		int i = 0;
		String sql = "update staffinfo set username=?,sex=?,age=?,idcard=?,phone=?,collegename=?, "
				+ " posttype=? ,jointime=?,arrangewage=?,senioritywage=?,prepay=?,regaddress=?,liveaddress=?, "
				+ " birthday=? ,contractendtime=? ,enterdate=? ,remark=? ,Status=?"
				+ " where staffid=?";
		try {
			i = runner.update(sql, staff.getUsername(),staff.getSex(),staff.getAge(),staff.getIdcard(),staff.getPhone(),
					staff.getCollegename(),staff.getPosttype(),staff.getJointime(),staff.getArrangewage(),
					staff.getSenioritywage(),staff.getPrepay(),staff.getRegaddress(),staff.getLiveaddress(),
					staff.getBirthday(),staff.getContractendtime(),staff.getEnterdate(),staff.getRemark(),staff.getStatus(),
					staff.getStaffid()
				);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	// 根据Id查询Staff
	public int delete(long id) {
		int i = 0;
		String sql = "update staffinfo set isDel=1 where staffid=?";
		try {
			i = runner.update(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	
	
	@Test
	public void test() {
		// System.out.println(new StaffDAO().delete(100001));

		Staff staff=new Staff();
		staff.setStaffid(100012);
		staff.setUsername("林梅12");
		staff.setSex("女");
		staff.setPhone("13597174271");
		staff.setLiveaddress("湖北黄冈");
		
		System.out.println(new StaffDAO().update(staff));
		
//		List<Staff> list = new StaffDAO().getList();
//		System.out.println(list.size());
//		for (Staff staff1 : list) {
//			System.out.println(staff1);
//		}

	}

}
