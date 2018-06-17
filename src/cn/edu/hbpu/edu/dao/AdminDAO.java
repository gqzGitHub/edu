package cn.edu.hbpu.edu.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.edu.hbpu.edu.bean.Admin;
import cn.edu.hbpu.edu.db.DBCPUtils;

public class AdminDAO {
	
	
	QueryRunner runner = new QueryRunner(DBCPUtils.getDataSource());
	
	//管理员登录
	public  Admin login(Admin ad){
		
		Admin admin =null;
		String sql = "select * from admininfo where username=? and password=?";
		BeanHandler<Admin> bh = new BeanHandler<Admin>(Admin.class);
		
		try {
			admin = runner.query(sql, bh,ad.getUsername(),ad.getPassword());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admin;
	}
	
	
	//更新
	public int update(Admin admin) {
		int i = 0;
		String sql = "update admininfo set password=?,phone=?,email=?  where adminid=? ";
		try {
			i = runner.update(sql, admin.getPassword(),admin.getPhone(),admin.getEmail(),admin.getAdminid()  );
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public Admin checkPass(String id,String password){
		Admin admin =null;
		String sql = "select * from  admininfo where  adminid=? and  password=?";
		BeanHandler<Admin> bh = new BeanHandler<Admin>(Admin.class);
		try {
			admin = runner.query(sql,bh, id,password );
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admin;
	}

}
