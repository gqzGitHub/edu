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

import cn.edu.hbpu.edu.bean.AllTeacher;
import cn.edu.hbpu.edu.bean.PageBean;
import cn.edu.hbpu.edu.bean.Teacherwage;
import cn.edu.hbpu.edu.dao.TeacherWageDAO;
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
public class TeacherWageServlet extends BaseServlet {

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
	public String findTeacherWageByPage(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		// 从前端页面获取数据
		String cp = request.getParameter("cp");
		String teachername = request.getParameter("teachername");
		String tsubjectname = request.getParameter("tsubjectname");

		// System.out.println("query"+teachername+tsubjectname);

		// 封装查询条件到list中
		List<String> list = new ArrayList<String>();
		list.add(teachername);
		list.add(tsubjectname);

		int currentPage = cp == null ? 1 : Integer.parseInt(cp);

		// 创建Staff实体类分页对象
		PageBean<AllTeacher> page = new PageBean<AllTeacher>();

		page.setCurrentPage(currentPage);

		page.setPageSize(6);

		PaginationService<AllTeacher> service = new PaginationService<AllTeacher>(
				EduFactory.getTeacherwageDAOInstance());

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
		for (AllTeacher allTeacher : page.getList()) {
			allTeacher.setTotalwage(allTeacher.getPeriod()
					* allTeacher.getWage() - allTeacher.getFine());
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
	public String findTeacherWageById(HttpServletRequest request,
			HttpServletResponse response) {

		// 获取参数
		String id = request.getParameter("id");
		TeacherWageDAO teacherWageDAO = EduFactory.getTeacherwageDAOInstance();

		AllTeacher allTeacher = teacherWageDAO.findById(Long.parseLong(id));

		// 计算工资
		allTeacher.setTotalwage(allTeacher.getPeriod() * allTeacher.getWage()
				- allTeacher.getFine());

		// 保存到request对象中
		request.setAttribute("teacherwage", allTeacher);

		return "/salary-info.jsp";
	}

	// 根据指定的id查询Staff
	public String preEditTeacherWageById(HttpServletRequest request,
			HttpServletResponse response) {

		// 获取参数
		String id = request.getParameter("id");

		TeacherWageDAO teacherWageDao = EduFactory.getTeacherwageDAOInstance();
		
		Teacherwage teacherwage = new Teacherwage();
		
		AllTeacher allTeacher = teacherWageDao.findById(Long.parseLong(id));
		if (allTeacher==null) {
			teacherwage.setTeacherid(Long.parseLong(id));
			teacherwage.setPeriod(0);
			teacherwage.setFine((double)0);
			teacherwage.setTotalwage((double)0);
			// 调用StaffDAO，返回id对应的StaffBean
			teacherWageDao.insert(teacherwage);
		}
		
		teacherwage = teacherWageDao.findTeacherWageById(Long.parseLong(id));

		// 保存到request对象中
		request.setAttribute("wage", teacherwage);

		return "wage-edit.jsp";
	}

	// 编辑
	public String editTeacherWageById(HttpServletRequest request,
			HttpServletResponse response) {
		// 将form参数 自动封装 Person对象
		Teacherwage teacherwage = new Teacherwage();

		// 将String类型 转换 java.util.Date类型 --- 自定义转换器
		// 在封装数据之前 ，注册转换器
		ConvertUtils.register(new MyDateConverter(), Date.class);

		try {
			BeanUtils.populate(teacherwage, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		TeacherWageDAO teacherWageDAO = EduFactory.getTeacherwageDAOInstance();
		
		int result = teacherWageDAO.update(teacherwage);

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
