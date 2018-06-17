package cn.edu.hbpu.edu.servlet;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;

import cn.edu.hbpu.edu.bean.Score;
import cn.edu.hbpu.edu.dao.ScoreDAO;
import cn.edu.hbpu.edu.factory.EduFactory;
import cn.edu.hbpu.edu.util.BaseServlet;
import cn.edu.hbpu.edu.util.MyDateConverter;

import com.alibaba.fastjson.JSON;

public class ScoreServlet extends BaseServlet {
	
	public String addScore(HttpServletRequest request,HttpServletResponse response){
		  // 将form参数 自动封装 ClassInfo对象
        Score score = new Score();

        // 将String类型 转换 java.util.Date类型 --- 自定义转换器
        // 在封装数据之前 ，注册转换器
        ConvertUtils.register(new MyDateConverter(), Date.class);
	  
        try {
			BeanUtils.populate(score, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}  
	 ScoreDAO dao = EduFactory.getScoreDAOInstance();
	 int result = dao.addScore(score);
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
	
	public String scoreEdit(HttpServletRequest request,HttpServletResponse response){	
		String studentid = request.getParameter("studentid");
		String courseid = request.getParameter("courseid");
		String score = request.getParameter("score");
		Score score2 =new Score();
		score2.setStudentid(studentid);
		score2.setCourseid(courseid);
		score2.setScore(Double.parseDouble(score));
		ScoreDAO dao = EduFactory.getScoreDAOInstance();
		int result = dao.updateScore(score2);
		try {
			PrintWriter out = response.getWriter();
			if(result!=0){
				out.print(1);
			}else {
				out.print(0);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public String findAll(HttpServletRequest request,HttpServletResponse response){
	  String classid = request.getParameter("classid");
	  ScoreDAO dao = EduFactory.getScoreDAOInstance();
	  List<Score> list= dao.findAll(classid);
	  //System.out.println(list);
	  String json = JSON.toJSONString(list);
	  try {
		PrintWriter out = response.getWriter();
		out.print(json);
	} catch (IOException e) {
		e.printStackTrace();
	}  
    return "";
	}
	
	public String delByCourseId(HttpServletRequest request,HttpServletResponse response){
	
		String scoreid = request.getParameter("scoreid");
		ScoreDAO dao = EduFactory.getScoreDAOInstance();
		int result = dao.delScore(scoreid);
		try {
			PrintWriter out = response.getWriter();
			if(result !=0){
				out.print(1);
			}else {
				out.print(0);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
}

