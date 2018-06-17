package cn.edu.hbpu.edu.servlet;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.hbpu.edu.util.BaseServlet;

public class PageTransServlet extends BaseServlet {
	
	public String pageTrans(HttpServletRequest request,HttpServletResponse response){
		
		String classid = request.getParameter("classid");
		
		request.setAttribute("classid", classid);
		
		return "/score-list.jsp";
	}
	
public String pageTrans2(HttpServletRequest request,HttpServletResponse response){
		
		String classid = request.getParameter("classid");
		
		request.setAttribute("classid", classid);
		
		return "/teac_score-list.jsp";
	}

}
