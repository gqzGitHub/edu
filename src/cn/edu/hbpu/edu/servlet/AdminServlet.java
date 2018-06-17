package cn.edu.hbpu.edu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.channels.SeekableByteChannel;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;

import cn.edu.hbpu.edu.bean.Admin;
import cn.edu.hbpu.edu.bean.Teacher;
import cn.edu.hbpu.edu.dao.AdminDAO;
import cn.edu.hbpu.edu.dao.TeacherDAO;
import cn.edu.hbpu.edu.factory.EduFactory;
import cn.edu.hbpu.edu.util.BaseServlet;
import cn.edu.hbpu.edu.util.MyDateConverter;
public class AdminServlet extends BaseServlet {
	
	public String login(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		//设置Session会话有效时间,0代表永不失效
		session.setMaxInactiveInterval(720*60);
		String  type = request.getParameter("type");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		int result = 0;
		if(type != null){
			if("系统管理员".equals(type)){
				Admin ad = new Admin();
				ad.setUsername(username);
				ad.setPassword(password);
				AdminDAO dao = EduFactory.getAdminDAOInstance();
				Admin admin = dao.login(ad);
				if (admin==null) {
					result=-1;
				}else {
					session.setAttribute("login", admin);
					result=1;
				}
			}else if("教师".equals(type)){
				Teacher teac = new Teacher();
				teac.setLoginname(username);
				teac.setPassword(password);
				TeacherDAO dao = EduFactory.getTeacherDAOInstance();
				Teacher teacher = dao.login(teac);
				if(teacher==null){
					result=-1;
				}else {
					session.setAttribute("login", teacher);
					result=2;
				}
			}
		}
		try {
			PrintWriter out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		 
		return "";
	}
	
	//退出
	public String exit(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		HttpSession session = request.getSession();
		
		Object sessionObj = session.getAttribute("login");
		
		if(sessionObj != null){
			session.removeAttribute("login");
		}//页面重定向到登录页面
		response.sendRedirect("login.jsp");
		return "";
	}
	
	
	//修改信息
	public String update(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		Admin admin = new Admin();
		ConvertUtils.register(new MyDateConverter(), Date.class);

		try {
			BeanUtils.populate(admin, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		AdminDAO adminDAO = EduFactory.getAdminDAOInstance();
		
//		System.out.println("修改信息"+admin);
		int result = adminDAO.update(admin);
		
		PrintWriter out = response.getWriter();
		if (result != 0) {
			out.print(1);
		} else {
			out.print(-1);
		}
		return "";
	}
	
	//
	public String checkPass(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Admin admin = null;
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		
		AdminDAO adminDAO = EduFactory.getAdminDAOInstance();
		
		admin = adminDAO.checkPass(id, password);
		PrintWriter out = response.getWriter();
		if (admin!=null) {
			out.print(1);
		}else {
			out.print(-1);
		}
		return "";
	}

}
