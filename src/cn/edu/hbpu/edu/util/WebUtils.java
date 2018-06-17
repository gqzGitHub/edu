package cn.edu.hbpu.edu.util;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;


public class WebUtils {
	
	public static <T> T fillBean(HttpServletRequest request,Class<T> class1 ){
		  try {
			T bean=class1.newInstance();
			BeanUtils.populate(bean, request.getParameterMap());
			return bean;
		
		} catch (Exception e) {
			throw new RuntimeException();

		} 
		}

	public static String dateFormate(Date date){
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		String time = df.format(date);
		
		return time;
		
	}
	
	public static String dateFormateMin(Date date){
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		String time = df.format(date);
		
		return time;
		
	}
	
	public static Date stringtoDate(String s){
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new  Date();
		try {
			date = df.parse(s);
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
		return date;
	}
}
