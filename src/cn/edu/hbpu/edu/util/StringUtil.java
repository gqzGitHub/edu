package cn.edu.hbpu.edu.util;

public class StringUtil {
	
	public static boolean isEmpty(String str){
		
		if("".equals(str)||str == null){
			return true;
		}else {
			return false;
		}
	}

public static boolean isNotEmpty(String str){
		
		if( str != null && !"".equals(str)){
			return true;
		}else {
			return false;
		}
	}
}
