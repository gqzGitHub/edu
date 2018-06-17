package cn.edu.hbpu.edu.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import org.apache.commons.beanutils.Converter;



public class MyDateConverter implements Converter {

	@Override
	public Object convert(Class c, Object value) {
		   String s = (String) value; // 代表用户输入生日
	        //定义格式
	        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        try {
	            Object result = dateFormat.parse(s); // 将String解析为 Date，将日期变为字符串使用format方法
	            return result;
	        } catch (java.text.ParseException e) {
				e.printStackTrace();
			}
	        return null;
	    }

	}

 
