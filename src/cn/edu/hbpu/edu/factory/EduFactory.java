package cn.edu.hbpu.edu.factory;


import cn.edu.hbpu.edu.dao.AdminDAO;
import cn.edu.hbpu.edu.dao.ClassInfoDAO;
import cn.edu.hbpu.edu.dao.ContractinDAO;
import cn.edu.hbpu.edu.dao.CourseDAO;
import cn.edu.hbpu.edu.dao.CurriculumDAO;
import cn.edu.hbpu.edu.dao.ScoreDAO;
import cn.edu.hbpu.edu.dao.StaffDAO;
import cn.edu.hbpu.edu.dao.StaffWageDAO;
import cn.edu.hbpu.edu.dao.StudentDAO;
import cn.edu.hbpu.edu.dao.StudentMemberDAO;
import cn.edu.hbpu.edu.dao.StudentScoreDAO;
import cn.edu.hbpu.edu.dao.SubjectDAO;
import cn.edu.hbpu.edu.dao.TeacClassInfoDAO;
import cn.edu.hbpu.edu.dao.TeacherDAO;
import cn.edu.hbpu.edu.dao.TeacherWageDAO;

public class EduFactory {
	public static AdminDAO getAdminDAOInstance() {

		return new AdminDAO();
	}
	public static StudentDAO getStudentDAOInstance(){
		return new StudentDAO();
	}
	public static SubjectDAO getSubjectDAOInstance(){
		
		return new SubjectDAO();
	}
	public static CourseDAO getCourseDAOInstance(){
		return new CourseDAO();
	}
    public static ContractinDAO getContractinDAOInstance(){
    	return new ContractinDAO();
    }
    public static ClassInfoDAO getClassInfoDAOInstance(){
    	
    	return new ClassInfoDAO();
    }
    
    public static StudentMemberDAO getStudentMemberDAOInstance(){
    	return new  StudentMemberDAO();
    }
    public static TeacherDAO getTeacherDAOInstance(){
    	return new TeacherDAO();
    }
    
    public static TeacClassInfoDAO getTeacClassInfoDAOInstance(){
    	return new TeacClassInfoDAO();
    }
    
    public static StudentScoreDAO getStudentScourseDAOInstance(){
    	
    	return  new  StudentScoreDAO();
    }
    
    public static ScoreDAO getScoreDAOInstance(){
    	
    	return new ScoreDAO();
    }
    
    
    public static StaffDAO getStaffDAOInstance(){
    	return new StaffDAO();
    }
    
    public static TeacherWageDAO getTeacherwageDAOInstance(){
    	return new TeacherWageDAO();
    }
    
    public static StaffWageDAO getStaffWageDAOInstance(){
    	return new StaffWageDAO();
    }
    
    public static CurriculumDAO getCurriculumDAOInstance(){
    	return new CurriculumDAO();
    }
}
