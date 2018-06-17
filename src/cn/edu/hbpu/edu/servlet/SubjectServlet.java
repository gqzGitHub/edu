package cn.edu.hbpu.edu.servlet;



 
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 

import cn.edu.hbpu.edu.bean.Subject;
import cn.edu.hbpu.edu.dao.SubjectDAO;
import cn.edu.hbpu.edu.factory.EduFactory;
import cn.edu.hbpu.edu.util.BaseServlet;

public class SubjectServlet extends BaseServlet {
	
	 public String getSubjects(HttpServletRequest request,HttpServletResponse response){
		 
		 String flag = request.getParameter("flag");
		 SubjectDAO dao = EduFactory.getSubjectDAOInstance();
		 
		 List<Subject> list = dao.getSubjects();
		 request.setAttribute("list",list);
		 String req = "";
		 if("1".equals(flag)){
			 req="/member-add.jsp";
		 }
		 return req;
	 }
	 
 
}
