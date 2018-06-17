package cn.edu.hbpu.edu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import cn.edu.hbpu.edu.bean.ClassInfo;
import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.db.DBCPUtils;
import cn.edu.hbpu.edu.util.StringUtil;

public class ClassInfoDAO implements BaseDAO<ClassInfo> {
	QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
	
	public int addClassInfo(ClassInfo classInfo){
		 int result = 0;
		 String sql = "insert into classinfo(classname,teacherid,collegename,total,createtime,status) values(?,?,?,?,now(),?)";
		 try {
			result = runner.update(sql,classInfo.getClassname(),classInfo.getTeacherid(),
					 classInfo.getCollegename(),classInfo.getTotal(),classInfo.getStatus());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return result;
	}

	@Override
	public int getCount(List<String> str) {
		Long num= null;
		StringBuilder sb = new StringBuilder("select count(*) from classinfo where isDel=0");
		if(StringUtil.isNotEmpty(str.get(0))){
			sb.append(" and classname like '%"+str.get(0)+"%'");
		}
		if(StringUtil.isNotEmpty(str.get(1))){
			sb.append(" and collegename like '%"+str.get(1)+"%'");
		}
		if(StringUtil.isNotEmpty(str.get(2))&& !"小班状态".equals(str.get(2))){
			sb.append(" and status ='"+str.get(2)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(3))){
			sb.append(" and createtime >='"+str.get(3)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(4))){
			sb.append(" and createtime <='"+str.get(4)+"'");
		}
		ScalarHandler<ClassInfo> sh = new ScalarHandler<ClassInfo>();
		Object object;
		try {
			  object =runner.query(sb.toString(), sh);
			  num=(Long) object;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num.intValue();
	}

	@Override
	public List<ClassInfo> findByTerm(PageBean<ClassInfo> page, List<String> str) {
		List<ClassInfo> list = new ArrayList<ClassInfo>();
		StringBuilder sb = new StringBuilder("select * from classinfo where isDel=0");
		if(StringUtil.isNotEmpty(str.get(0))){
			sb.append(" and classname like '%"+str.get(0)+"%'");
		}
		if(StringUtil.isNotEmpty(str.get(1))){
			sb.append(" and collegename like '%"+str.get(1)+"%'");
		}
		if(StringUtil.isNotEmpty(str.get(2))&& !"小班状态".equals(str.get(2))){
			sb.append(" and status ='"+str.get(2)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(3))){
			sb.append(" and createtime >='"+str.get(3)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(4))){
			sb.append(" and createtime <='"+str.get(4)+"'");
		}
		sb.append(" order by createtime desc limit ?,?");
		BeanListHandler<ClassInfo> bh = new BeanListHandler<ClassInfo>(ClassInfo.class);
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

	@Override
	public ClassInfo findById(long id) {
		// TODO Auto-generated method stub
		return null;
	}
	//根据Id删除课程
	public int delClassInfoById(String classid){
		int result = 0;
		String sql = "update classinfo set isDel=1 where classid=?";
		try {
			result = runner.update(sql, classid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	public int updateStatus(String flag,String classid){
		int result = 0;
		String sql="";
		if("1".equals(flag)){
			sql = "update classinfo set status='已停用' where classid=?";
		}else if ("2".equals(flag)) {
			sql = "update classinfo set status='正常状态' where classid=?";
		}
		try {
			result = runner.update(sql, classid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result ;
	}
    
	public List<ClassInfo> getListByStatus(){
		
		List<ClassInfo> list = new ArrayList<ClassInfo>();
		
		String sql = "select * from classinfo where status='正常状态' and isDel=0";
		BeanListHandler<ClassInfo> bh = new BeanListHandler<ClassInfo>(ClassInfo.class);
		
		try {
			list = runner.query(sql, bh);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
