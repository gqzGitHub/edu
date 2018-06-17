package cn.edu.hbpu.edu.service;

import java.sql.Connection;
import java.sql.SQLException;

import cn.edu.hbpu.edu.bean.Contractin;
import cn.edu.hbpu.edu.dao.ContractinDAO;
import cn.edu.hbpu.edu.dao.StudentDAO;
import cn.edu.hbpu.edu.db.DBCPUtils;
import cn.edu.hbpu.edu.factory.EduFactory;

public class ContractinService {
	
	
	
	public int contractinService(Contractin contractin){
		Connection conn = DBCPUtils.getConnection();
		int result = 0;
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ContractinDAO dao1 = EduFactory.getContractinDAOInstance();
		StudentDAO dao2 = EduFactory.getStudentDAOInstance();
		int result1= dao1.addContractin(contractin);
		int result2 = dao2.updateStudentStatus(String.valueOf(contractin.getStudentid()));
		if(result1 !=0 && result2 !=0){
			result=1;
		}
		if(result==1){
			try {
				conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else {
			try {
			  conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

}
