package cn.edu.hbpu.edu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.bean.Score;
import cn.edu.hbpu.edu.bean.Student;
import cn.edu.hbpu.edu.dao.ScoreDAO;
import cn.edu.hbpu.edu.factory.EduFactory;
import cn.edu.hbpu.edu.service.PaginationService;
import cn.edu.hbpu.edu.util.BaseServlet;

public class StudentCourseServlet extends BaseServlet {
	
	public String findStudentCourseByPage(HttpServletRequest request,HttpServletResponse response){
		
		 //从前端页面获取数据
	    String cp = request.getParameter("cp");
       String classid = request.getParameter("classid");
       String studentname = request.getParameter("studentname");
       List<String> list = new ArrayList<String>();
       list.add(classid);
       list.add(studentname);
       int currentPage = cp==null ? 1:Integer.parseInt(cp);
       PageBean<Student> page = new PageBean<Student>();
       
       page.setCurrentPage(currentPage);
       
       page.setPageSize(6);
       
       PaginationService<Student> service = 
       		new PaginationService<Student>(EduFactory.getStudentScourseDAOInstance());
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
	
	public String scoreDetail(HttpServletRequest request,HttpServletResponse response){
		String studentid = request.getParameter("studentid");
		String studentname = request.getParameter("studentname");
		String courseid = request.getParameter("courseid");
		String coursename = request.getParameter("coursename");
		Score score2 = new Score(studentid, studentname, courseid, coursename);
		request.setAttribute("score2", score2);
	     return "/score-detail.jsp";
		 
		 
	}
	
	public String scoreEdit(HttpServletRequest request,HttpServletResponse response){
		
		String studentid = request.getParameter("studentid");
		String studentname = request.getParameter("studentname");
		String courseid = request.getParameter("courseid");
		String coursename = request.getParameter("coursename");
		Score score2 = new Score(studentid, studentname, courseid, coursename);
		ScoreDAO dao = EduFactory.getScoreDAOInstance();
		score2 = dao.findByStudentIdAndCourseId(score2);
		request.setAttribute("score2", score2);
		return "/score-edit.jsp";
	}

}
