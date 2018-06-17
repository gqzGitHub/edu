package cn.edu.hbpu.edu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.edu.hbpu.edu.bean.Contractin;
import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.bean.Student;
import cn.edu.hbpu.edu.db.DBCPUtils;
import cn.edu.hbpu.edu.util.StringUtil;

public class ContractinDAO implements BaseDAO<Contractin> {
	
	QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
	
	public int addContractin(Contractin contraction){ 
		int result = 0;
		String sql = "insert into contractinfo(contractnumber,contracttype,createtime,studentid,orderhour,price," +
				"teachstart,teachend,courseid,teachplace,payment,deliverdate,totalamount) " +
				"values(?,?,now(),?,?,?,?,?,?,?,?,?,?)";
		try {
			result = runner.update(sql, 
					contraction.getContractnumber(),contraction.getContracttype(),
					contraction.getStudentid(),contraction.getOrderhour()
					,contraction.getPrice(),contraction.getTeachstart(),contraction.getTeachend()
					,contraction.getCourseid(),contraction.getTeachplace(),contraction.getPayment(),contraction.getDeliverdate()
					,contraction.getTotalamount());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int getCount(List<String> str) {
		Long num= null;
		StringBuilder sb = new StringBuilder("select count(*) from contractinfo con,studentinfo stu where con.studentid=stu.studentid ");
		if(StringUtil.isNotEmpty(str.get(0))){
			sb.append(" and con.teachplace like '%"+str.get(0)+"%'");
		}
		if(StringUtil.isNotEmpty(str.get(1)) && !"年级".equals(str.get(1))){
			sb.append(" and stu.grade='"+str.get(1)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(2))&& !"类型".equals(str.get(2))){
			sb.append(" and con.contracttype ='"+str.get(2)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(3))){
			sb.append(" and con.createtime >='"+str.get(3)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(4))){
			sb.append(" and con.createtime <='"+str.get(4)+"'");
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

	@Override
	public List<Contractin> findByTerm(PageBean<Contractin> page,
			List<String> str) {
		List<Contractin> list = new ArrayList<Contractin>();
		StringBuilder sb = new StringBuilder("select con.*,stu.studentname,stu.grade,stu.infosource,stu.guardian,stu.gdphone from contractinfo con,studentinfo stu where con.studentid=stu.studentid");
		if(StringUtil.isNotEmpty(str.get(0))){
			sb.append(" and con.teachplace like '%"+str.get(0)+"%'");
		}
		if(StringUtil.isNotEmpty(str.get(1)) && !"年级".equals(str.get(1))){
			sb.append(" and stu.grade='"+str.get(1)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(2))&& !"类型".equals(str.get(2))){
			sb.append(" and con.contracttype ='"+str.get(2)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(3))){
			sb.append(" and con.createtime >='"+str.get(3)+"'");
		}
		if(StringUtil.isNotEmpty(str.get(4))){
			sb.append(" and con.createtime <='"+str.get(4)+"'");
		}
		sb.append(" order by con.createtime desc limit ?,?");
		BeanListHandler<Contractin> bh = new BeanListHandler<Contractin>(Contractin.class);
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
	public Contractin findById(long id) {
		Contractin contractin = new Contractin();
		String sql = "select con.*,stu.studentname,stu.grade,stu.infosource,stu.guardian,stu.gdphone,cou.coursename from contractinfo con,studentinfo stu,courseinfo cou where con.studentid=stu.studentid and con.courseid=cou.courseid and con.contractid=?";
		BeanHandler<Contractin> bh = new BeanHandler<Contractin>(Contractin.class);
		try {
			contractin = runner.query(sql, bh,(int)id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return contractin;
	}
    
	public int getCountByStudentid(String studentid){
		Long count= null;
		StringBuilder sb = new StringBuilder("select count(*) from contractinfo where studentid=?");
		ScalarHandler<Student> sh = new ScalarHandler<Student>();
		Object object;
		try {
			  object =runner.query(sb.toString(), sh,studentid);
			  count=(Long) object;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count.intValue();
	}

}
