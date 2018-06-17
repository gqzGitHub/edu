package cn.edu.hbpu.edu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
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
import cn.edu.hbpu.edu.dao.ClassInfoDAO;
import cn.edu.hbpu.edu.dao.ContractinDAO;
import cn.edu.hbpu.edu.dao.CourseDAO;
import cn.edu.hbpu.edu.dao.StudentDAO;
import cn.edu.hbpu.edu.factory.EduFactory;
import cn.edu.hbpu.edu.service.PaginationService;
import cn.edu.hbpu.edu.util.BaseServlet;
import cn.edu.hbpu.edu.util.MyDateConverter;

import com.alibaba.fastjson.JSON;

public class StudentServlet extends BaseServlet {
	
	//添加潜在学生
	public String addpotStudent(HttpServletRequest request,HttpServletResponse response){
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
		 StudentDAO dao = EduFactory.getStudentDAOInstance();
		
		 int result = dao.addpotStudent(student);
		
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
	
	//查询所有潜在学生
 	public String findPotStudentByPage(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
	        //从前端页面获取数据
 		    String cp = request.getParameter("cp");
	        String studentname = request.getParameter("studentname");
	        String school = request.getParameter("school");
	        String infosource =request.getParameter("infosource");
	        String relation = request.getParameter("relation");
	        String grade = request.getParameter("grade");
	        String start = request.getParameter("start");
	        String end = request.getParameter("end");
	        List<String> list = new ArrayList<String>();
	        list.add(studentname); list.add(school); list.add(infosource); list.add(relation); list.add(grade); list.add(start);
	        list.add(end);
	        int currentPage = cp==null ? 1:Integer.parseInt(cp);
	        PageBean<Student> page = new PageBean<Student>();
	        
	        page.setCurrentPage(currentPage);
	        
	        page.setPageSize(6);
	        
	        PaginationService<Student> service = 
	        		new PaginationService<Student>(EduFactory.getStudentDAOInstance());
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
 	
 	public String findStudentById(HttpServletRequest request,HttpServletResponse response){
 		String id = request.getParameter("id");
 		StudentDAO dao = EduFactory.getStudentDAOInstance();
 		CourseDAO cDao = EduFactory.getCourseDAOInstance();
 		ClassInfoDAO classInfoDAO  = EduFactory.getClassInfoDAOInstance();
 		ContractinDAO contractinDAO = EduFactory.getContractinDAOInstance();
 		List<Course> list = cDao.getCourseList();
 	    List<ClassInfo> list2 = classInfoDAO.getListByStatus();
 		Student student = dao.findById(Long.parseLong(id));
 		int count = contractinDAO.getCountByStudentid(student.getStudentid());
 		count = count+1;
 		String contractnumber="";
 		if(count<10){
 			contractnumber = "MMWWW"+student.getStudentid()+"0"+count;
 		}else {
 			contractnumber = "MMWWW"+student.getStudentid()+count;
		}
 		request.setAttribute("student", student);
 		request.setAttribute("contractnumber", contractnumber);
 		request.setAttribute("list", list);
 		request.setAttribute("classlist", list2);
 		return "/order-add.jsp";
 	}
 	
 	public String updtateStudnetCourse(HttpServletRequest request,HttpServletResponse response){
 		
 		String studentid = request.getParameter("studentid");
 		
 		String courseid = request.getParameter("courseid");
 		
 		System.out.println(studentid);
 		System.out.println(courseid);
 		Student student = new Student();
 		
 		student.setStudentid(studentid);
 		student.setCourseid(Integer.parseInt(courseid));
 		
 		StudentDAO dao = EduFactory.getStudentDAOInstance();

 		int result = dao.updateStudentCourse(student);
 		
 		try {
			PrintWriter out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
 		return "";
 	}
}
 	

 
