package cn.edu.hbpu.edu.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;

import cn.edu.hbpu.edu.bean.ClassInfo;
import cn.edu.hbpu.edu.bean.Course;
import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.bean.Student;
import cn.edu.hbpu.edu.bean.Subject;
import cn.edu.hbpu.edu.dao.ClassInfoDAO;
import cn.edu.hbpu.edu.dao.CourseDAO;
import cn.edu.hbpu.edu.dao.StudentMemberDAO;
import cn.edu.hbpu.edu.dao.SubjectDAO;
import cn.edu.hbpu.edu.factory.EduFactory;
import cn.edu.hbpu.edu.service.PaginationService;
import cn.edu.hbpu.edu.util.BaseServlet;
import cn.edu.hbpu.edu.util.MyDateConverter;

import com.alibaba.fastjson.JSON;

public class StudentMemberServlet extends BaseServlet {
	
	public String findStudentMemberByPage(HttpServletRequest request,HttpServletResponse response){
		
		 //从前端页面获取数据
		    String cp = request.getParameter("cp");
        String studentname = request.getParameter("studentname");
        String teachplace = request.getParameter("teachplace");
        String grade = request.getParameter("grade");
        String start = request.getParameter("start");
        List<String> list = new ArrayList<String>();
        list.add(studentname); list.add(teachplace);  list.add(grade); list.add(start);
        int currentPage = cp==null ? 1:Integer.parseInt(cp);
        PageBean<Student> page = new PageBean<Student>();
        
        page.setCurrentPage(currentPage);
        
        page.setPageSize(6);
        
        PaginationService<Student> service = 
        		new PaginationService<Student>(EduFactory.getStudentMemberDAOInstance());
        page = service.paging(page,list);
        //将pageBean对象转化为json数据
        String json = JSON.toJSONString(page);
       
        
        try {
			PrintWriter out = response.getWriter();
			out.print(json);
		
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
   
	return "";
	}
	
	public String addInfo(HttpServletRequest request,HttpServletResponse response){
		
         SubjectDAO dao = EduFactory.getSubjectDAOInstance();
         ClassInfoDAO classInfoDAO  = EduFactory.getClassInfoDAOInstance();
         CourseDAO cDao = EduFactory.getCourseDAOInstance();
		 List<Subject> subjectlist = dao.getSubjects();
		 List<ClassInfo> classlist = classInfoDAO.getListByStatus();
		 List<Course> cousrselist = cDao.getCourseList();
		 request.setAttribute("subjectlist",subjectlist);
		 request.setAttribute("classlist", classlist);
		 request.setAttribute("cousrselist", cousrselist);
		return "/stu-add.jsp";
	}
	
	public String addStudentMember(HttpServletRequest request,HttpServletResponse response){
		  // 将form参数 自动封装 Person对象
        Student student = new Student();

        // 将String类型 转换 java.util.Date类型 --- 自定义转换器
        // 在封装数据之前 ，注册转换器
        ConvertUtils.register(new MyDateConverter(), Date.class);
	  
        try {
			BeanUtils.populate(student, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}  
	 StudentMemberDAO  dao = EduFactory.getStudentMemberDAOInstance();
	
	 int result = dao.addStudentMember(student);
	
	 try {
		PrintWriter out = response.getWriter();
		if (result !=0) {
			out.print(1);
		}
		else {
			out.print(-1);
		}
	} catch (IOException e) {
		e.printStackTrace();
	}
		return "";
	}
}
