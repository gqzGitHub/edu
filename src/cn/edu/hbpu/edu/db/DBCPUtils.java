package cn.edu.hbpu.edu.db;

import java.io.InputStream;
import java.sql.Connection;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;

public class DBCPUtils {
	
	 private static DataSource dataSource;
	   static{
		   InputStream is=DBCPUtils.class.getClassLoader()
				   .getResourceAsStream("dbcpconfig.properties");
		   Properties props=new Properties();
		   try {
			    props.load(is);
			   dataSource=BasicDataSourceFactory.createDataSource(props);
		} catch (Exception e) {
			
			e.printStackTrace();
		}   
	   }
	   public static DataSource getDataSource(){
		   return dataSource;
	   }
	   public static Connection getConnection(){
		   try {
			return dataSource.getConnection();
		} catch (Exception e) {
			throw new RuntimeException();
		}
	   }

}
