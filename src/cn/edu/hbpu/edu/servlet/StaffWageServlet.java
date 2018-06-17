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

import cn.edu.hbpu.edu.bean.AllStaff;
import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.bean.Staffwage;
import cn.edu.hbpu.edu.dao.StaffWageDAO;
import cn.edu.hbpu.edu.factory.EduFactory;
import cn.edu.hbpu.edu.service.PaginationService;
import cn.edu.hbpu.edu.util.BaseServlet;
import cn.edu.hbpu.edu.util.MyDateConverter;

import com.alibaba.fastjson.JSON;

/**
 * 
 * @ClassName: TeacherServlet
 * @Description: teacherwage控制器
 * @author ganquanzhong
 * @date 2018年4月26日 下午5:59:55
 */
public class StaffWageServlet extends BaseServlet {

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = 6357786681612549891L;

	/**
	 * 
	 * @Title: findTeacherByPage
	 * @Description: 根据条件查询Sataff，并且分页显示
	 * @author ganquanzhong
	 * @date 2018年4月25日 下午7:22:47
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String findStaffWageByPage(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		// 从前端页面获取数据
		String cp = request.getParameter("cp");
		String username = request.getParameter("username");
		String posttype = request.getParameter("posttype");

		// System.out.println("query"+teachername+tsubjectname);

		// 封装查询条件到list中
		List<String> list = new ArrayList<String>();
		list.add(username);
		list.add(posttype);

		int currentPage = cp == null ? 1 : Integer.parseInt(cp);

		// 创建Staff实体类分页对象
		PageBean<AllStaff> page = new PageBean<AllStaff>();

		page.setCurrentPage(currentPage);

		page.setPageSize(6);

		PaginationService<AllStaff> service = new PaginationService<AllStaff>(EduFactory.getStaffWageDAOInstance());

		// 分页
		page = service.paging(page, list);

		// System.err.println("----查询条件----");
		// for (String string : list) {
		// System.err.println(string);
		// }
		// System.err.println("----查询条件----");
		//
		// System.err.println("----查询result----");
		// for (AllTeacher allTeacher : page.getList()) {
		// System.err.println(allTeacher);
		// }
		// System.err.println("----查询result----");

		// 计算工资
		for (AllStaff allStaff: page.getList()) {
			allStaff.setTotalwage(allStaff.getArrangewage()+allStaff.getSenioritywage()+allStaff.getDeductwage()-allStaff.getFine());
		}
		// 将pageBean对象转化为json数据
		String json = JSON.toJSONString(page);

		try {
			PrintWriter out = response.getWriter();
			out.print(json);

			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// System.out.println("----teacher列表！---");
		return "";
	}

	// 根据指定的id查询Staff
	public String findStaffWageById(HttpServletRequest request,	HttpServletResponse response) {

		// 获取参数
		String id = request.getParameter("id");
		StaffWageDAO staffWageDAO = EduFactory.getStaffWageDAOInstance();

		AllStaff allStaff = staffWageDAO.findById(Long.parseLong(id));

		// 计算工资
		allStaff.setTotalwage(allStaff.getArrangewage()+allStaff.getSenioritywage()+allStaff.getDeductwage()-allStaff.getFine());

		// 保存到request对象中
		request.setAttribute("staffwage", allStaff);

		return "/staffsalary-info.jsp";
	}

	
	//staff-list列表中
	
	// 根据指定的id查询Staff
	public String preEditStaffWageById(HttpServletRequest request,
			HttpServletResponse response) {

		// 获取参数
		String id = request.getParameter("id");
		StaffWageDAO staffWageDAO = EduFactory.getStaffWageDAOInstance();
		
		AllStaff allStaff = staffWageDAO.findById(Long.parseLong(id));
		//如果没有对应的staffwageinfo表则添加一个
		Staffwage staffwage = new Staffwage();
		if (allStaff==null) {
			staffwage.setStaffid(Integer.parseInt(id));
			staffwage.setDeductwage((double)0);
			staffwage.setFine((double)0);
			staffwage.setTotalwage((double)0);
			// 调用StaffDAO，返回id对应的StaffBean
			staffWageDAO.insert(staffwage);
		}
		
		staffwage = staffWageDAO.findStaffwageById(Long.parseLong(id));

		// 保存到request对象中
		request.setAttribute("wage", staffwage);

		return "staffwage-edit.jsp";
	}

	// 编辑
	public String editStaffWageById(HttpServletRequest request,
			HttpServletResponse response) {
		// 将form参数 自动封装 Person对象
		Staffwage staffwage = new Staffwage();

		// 将String类型 转换 java.util.Date类型 --- 自定义转换器
		// 在封装数据之前 ，注册转换器
		ConvertUtils.register(new MyDateConverter(), Date.class);

		try {
			BeanUtils.populate(staffwage, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		StaffWageDAO staffWageDAO = EduFactory.getStaffWageDAOInstance();
		
		int result = staffWageDAO.update(staffwage);

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

}
