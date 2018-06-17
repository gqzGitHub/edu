package cn.edu.hbpu.edu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import cn.edu.hbpu.edu.bean.ClassInfo;
import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.bean.Student;
import cn.edu.hbpu.edu.db.DBCPUtils;
import cn.edu.hbpu.edu.util.StringUtil;

public class TeacClassInfoDAO implements BaseDAO<ClassInfo> {
	QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
	@Override
	public int getCount(List<String> str) {
		Long num= null;
		StringBuilder sb = new StringBuilder("select count(*) from classinfo where teacherid=? and isDel=0");
		if(StringUtil.isNotEmpty(str.get(1))){
			sb.append(" and classname like '%"+str.get(1)+"%'");
		}
		if(StringUtil.isNotEmpty(str.get(2))){
			sb.append(" and collegename like '%"+str.get(2)+"%'");
		}
		if(StringUtil.isNotEmpty(str.get(3))&& !"小班状态".equals(str.get(3))){
			sb.append(" and status ='"+str.get(3)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(4))){
			sb.append(" and createtime >='"+str.get(4)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(5))){
			sb.append(" and createtime <='"+str.get(5)+"'");
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
	public List<ClassInfo> findByTerm(PageBean<ClassInfo> page, List<String> str) {
		List<ClassInfo> list = new ArrayList<ClassInfo>();
		StringBuilder sb = new StringBuilder("select * from classinfo where teacherid=? and isDel=0");
		if(StringUtil.isNotEmpty(str.get(1))){
			sb.append(" and classname like '%"+str.get(1)+"%'");
		}
		if(StringUtil.isNotEmpty(str.get(2))){
			sb.append(" and collegename like '%"+str.get(2)+"%'");
		}
		if(StringUtil.isNotEmpty(str.get(3))&& !"小班状态".equals(str.get(3))){
			sb.append(" and status ='"+str.get(3)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(4))){
			sb.append(" and createtime >='"+str.get(4)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(5))){
			sb.append(" and createtime <='"+str.get(5)+"'");
		}
		sb.append(" order by createtime desc limit ?,?");
		BeanListHandler<ClassInfo> bh = new BeanListHandler<ClassInfo>(ClassInfo.class);
		int start = 0;
		if(page.getCurrentPage()>=1){
			start = (page.getCurrentPage()-1)*page.getPageSize();
		}
		try {
			list = runner.query(sb.toString(), bh,str.get(0),start,page.getPageSize());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public ClassInfo findById(long id) {
		// TODO Auto-generated method stub
		return null;
	}
}
