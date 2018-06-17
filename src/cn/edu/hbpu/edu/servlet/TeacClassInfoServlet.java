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
import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.bean.Teacher;
import cn.edu.hbpu.edu.dao.ClassInfoDAO;
import cn.edu.hbpu.edu.dao.TeacherDAO;
import cn.edu.hbpu.edu.factory.EduFactory;
import cn.edu.hbpu.edu.service.PaginationService;
import cn.edu.hbpu.edu.util.BaseServlet;
import cn.edu.hbpu.edu.util.MyDateConverter;

import com.alibaba.fastjson.JSON;

public class TeacClassInfoServlet extends BaseServlet {
	
	public String addClassInfo(HttpServletRequest request,HttpServletResponse response){
		
	    // 将form参数 自动封装 ClassInfo对象
        ClassInfo classInfo = new ClassInfo();

        // 将String类型 转换 java.util.Date类型 --- 自定义转换器
        // 在封装数据之前 ，注册转换器
        ConvertUtils.register(new MyDateConverter(), Date.class);
	  
        try {
			BeanUtils.populate(classInfo, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}  
	 ClassInfoDAO dao = EduFactory.getClassInfoDAOInstance();
	
	 int result = dao.addClassInfo(classInfo);
	
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
    
	public String findClassInfoByPage(HttpServletRequest request,HttpServletResponse response){
		 //从前端页面获取数据
			String cp = request.getParameter("cp");
			String teacherid = request.getParameter("teacherid");
	        String classname = request.getParameter("classname");
	        String collegename = request.getParameter("collegename");
	        String status =request.getParameter("status");
	        String start = request.getParameter("start");
	        String end = request.getParameter("end");
	        List<String> list = new ArrayList<String>();
	        list.add(teacherid);
	        list.add(classname); list.add(collegename);list.add(status);list.add(start);
	        list.add(end);
	        int currentPage = cp==null ? 1:Integer.parseInt(cp);
	        PageBean<ClassInfo> page = new PageBean<ClassInfo>();
	        
	        page.setCurrentPage(currentPage);
	        
	        page.setPageSize(6);
	        
	        PaginationService<ClassInfo> service = 
	        		new PaginationService<ClassInfo>(EduFactory.getTeacClassInfoDAOInstance());
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
	
	public String delClassInfoById(HttpServletRequest request,HttpServletResponse response){
		
		String classid = request.getParameter("classid");
		ClassInfoDAO dao = EduFactory.getClassInfoDAOInstance();
		
		int result = dao.delClassInfoById(classid);
		
		try {
			PrintWriter out = response.getWriter();
			if(result!=0){
				out.print(1);
			}else {
				out.print(-1);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public String updateClassStatus(HttpServletRequest request,HttpServletResponse response){
		String flag = request.getParameter("flag");
		String classid = request.getParameter("classid");
		ClassInfoDAO dao = EduFactory.getClassInfoDAOInstance();
		int result = dao.updateStatus(flag, classid);
		try {
			PrintWriter out = response.getWriter();
			if(result !=0 ){
				out.print(1);
			}else {
				out.print(-1);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public String classView(HttpServletRequest request,HttpServletResponse response){
	    TeacherDAO dao = EduFactory.getTeacherDAOInstance();
	    List<Teacher> list = dao.getList();
	    request.setAttribute("teaclist", list);
		return "/class-add.jsp";
	}
}
