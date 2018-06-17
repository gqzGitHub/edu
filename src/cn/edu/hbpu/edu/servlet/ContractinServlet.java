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

import cn.edu.hbpu.edu.bean.Contractin;
import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.bean.Student;
import cn.edu.hbpu.edu.dao.ContractinDAO;
import cn.edu.hbpu.edu.dao.StudentDAO;
import cn.edu.hbpu.edu.factory.EduFactory;
import cn.edu.hbpu.edu.service.ContractinService;
import cn.edu.hbpu.edu.service.PaginationService;
import cn.edu.hbpu.edu.util.BaseServlet;
import cn.edu.hbpu.edu.util.MyDateConverter;

import com.alibaba.fastjson.JSON;

public class ContractinServlet extends BaseServlet {
	
	public String addContractin(HttpServletRequest request,HttpServletResponse response){
		Contractin contractin = new Contractin();
		
		 ConvertUtils.register(new MyDateConverter(), Date.class);
		 
		 try {
			BeanUtils.populate(contractin, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}  
		ContractinService service = new ContractinService();
		int result = service.contractinService(contractin);
		Student student = new Student();
		student.setCourseid(contractin.getCourseid());
		student.setStudentid(contractin.getStudentid());
		student.setClassid(contractin.getClassid());
		StudentDAO dao = EduFactory.getStudentDAOInstance();
          dao.updateStudentCourse(student);
		try {
			PrintWriter out = response.getWriter();
			if(result !=0){
				 out.print(1);
				 
			}else {
				out.print(-1);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "";
	}
    
	public String findContractinByPage(HttpServletRequest request,HttpServletResponse response){
		 //从前端页面获取数据
		String cp = request.getParameter("cp");
        String teachplace = request.getParameter("teachplace");
        String grade = request.getParameter("grade");
        String contracttype =request.getParameter("contracttype");
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        List<String> list = new ArrayList<String>();
        list.add(teachplace); list.add(grade); list.add(contracttype);list.add(start);
        list.add(end);
        int currentPage = cp==null ? 1:Integer.parseInt(cp);
        PageBean<Contractin> page = new PageBean<Contractin>();
        
        page.setCurrentPage(currentPage);
        
        page.setPageSize(6);
        
        PaginationService<Contractin> service = 
        		new PaginationService<Contractin>(EduFactory.getContractinDAOInstance());
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
	
	public String findContractinById(HttpServletRequest request,HttpServletResponse response){
		String contractid = request.getParameter("id");
		
		ContractinDAO dao = EduFactory.getContractinDAOInstance();
		
		Contractin contractin = dao.findById(Long.parseLong(contractid));
		
		request.setAttribute("contractin", contractin);
		
		return "/order-edit.jsp";
	}
}
