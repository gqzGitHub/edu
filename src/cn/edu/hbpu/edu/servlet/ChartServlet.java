package cn.edu.hbpu.edu.servlet;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.alibaba.fastjson.JSON;
import cn.edu.hbpu.edu.bean.ClassInfo;
import cn.edu.hbpu.edu.dao.ClassInfoDAO;
import cn.edu.hbpu.edu.dao.StudentDAO;
import cn.edu.hbpu.edu.factory.EduFactory;
import cn.edu.hbpu.edu.util.BaseServlet;

public class ChartServlet extends BaseServlet {
	
	
	public String addBar(HttpServletRequest request,HttpServletResponse response){
		
	    ClassInfoDAO dao = EduFactory.getClassInfoDAOInstance();
		
	    List<ClassInfo> list = dao.getListByStatus();
	    
	    String[] categories = new String[list.size()];
	    
	    Integer[] values = new Integer[list.size()];
	    
	    for(int i=0 ;i<list.size();i++){
	    	categories[i]=list.get(i).getClassname();
	    	values[i]=list.get(i).getTotal();
	    } 
	    Map<String, Object> json = new HashMap<String, Object>();  
	    
	    json.put("categories", categories);
	    
	    json.put("values", values);
	    
	    String data = JSON.toJSONString(json);
	    try {
			PrintWriter out = response.getWriter();
			
			out.print(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
	
    public String addPie(HttpServletRequest request,HttpServletResponse response){
		
		StudentDAO dao = EduFactory.getStudentDAOInstance();
		String[] names  ={"电话预约","网络预约","门店直访","市场专员","家长转介绍"};
		
		Integer[] values = new Integer[5];
		
		for(int i =0;i<values.length;i++){
			values[i]=dao.getCountByInfosource(names[i]);
		}
        List<Integer> list = new ArrayList<Integer>();
        
       for (Integer i : values) {
    	   list.add(i);
		}
       String value = JSON.toJSONString(list);
       try {
		PrintWriter out = response.getWriter();
		   out.print(value);
	} catch (IOException e) {

		e.printStackTrace();
	}
		return "";
	}

}
