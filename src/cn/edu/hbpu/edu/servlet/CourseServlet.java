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

import cn.edu.hbpu.edu.bean.Course;
import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.dao.CourseDAO;
import cn.edu.hbpu.edu.factory.EduFactory;
import cn.edu.hbpu.edu.service.PaginationService;
import cn.edu.hbpu.edu.util.BaseServlet;
import cn.edu.hbpu.edu.util.MyDateConverter;

import com.alibaba.fastjson.JSON;

public class CourseServlet extends BaseServlet {

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = -5519156293818279140L;

	public String getCourseList(HttpServletRequest request,
			HttpServletResponse response) {
		CourseDAO dao = EduFactory.getCourseDAOInstance();

		List<Course> list = dao.getCourseList();

		String courseList = JSON.toJSONString(list);
		try {
			PrintWriter out = response.getWriter();

			out.print(courseList);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}

	public String findCourseByPage(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		// 从前端页面获取数据
		String cp = request.getParameter("cp");
		String coursename = request.getParameter("coursename");

		// 封装查询条件到list中
		List<String> list = new ArrayList<String>();
		list.add(coursename);

		int currentPage = cp == null ? 1 : Integer.parseInt(cp);

		// 创建Staff实体类分页对象
		PageBean<Course> page = new PageBean<Course>();

		page.setCurrentPage(currentPage);

		page.setPageSize(6);

		PaginationService<Course> service = new PaginationService<Course>(
				EduFactory.getCourseDAOInstance());

		// 分页
		page = service.paging(page, list);
		// 将pageBean对象转化为json数据
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

	// 添加课程
	public String addCourse(HttpServletRequest request,
			HttpServletResponse response) {
		// 将form参数 自动封装 Person对象
		Course course = new Course();

		// 将String类型 转换 java.util.Date类型 --- 自定义转换器
		// 在封装数据之前 ，注册转换器
		ConvertUtils.register(new MyDateConverter(), Date.class);

		try {
			BeanUtils.populate(course, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}

		CourseDAO courseDAO = EduFactory.getCourseDAOInstance();

		int result = courseDAO.add(course);

		try {
			PrintWriter out = response.getWriter();
			if (result != 0) {
				out.print(1);
			} else {
				out.print(-1);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "";
	}
	
	
	public void deleteById(HttpServletRequest request,
			HttpServletResponse response) {
		// 获取参数
		String id = request.getParameter("id");
	
		CourseDAO courseDAO = EduFactory.getCourseDAOInstance();

		// 调用StaffDAO，返回id对应的StaffBean
		int i = courseDAO.delete(Long.parseLong(id));

		try {
			PrintWriter out = response.getWriter();
			if (i == 0) {
				out.print("删除失败！");
			} else {
				out.print("删除成功！");
			}
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public String updateCourseStatus(HttpServletRequest request,HttpServletResponse response){
		String flag = request.getParameter("flag");
		String courseid = request.getParameter("courseid");
		
		CourseDAO dao = EduFactory.getCourseDAOInstance();
		int result = dao.updateStatus(flag, courseid);
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
}
