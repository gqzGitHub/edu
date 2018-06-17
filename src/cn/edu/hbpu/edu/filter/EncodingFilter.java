package cn.edu.hbpu.edu.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EncodingFilter implements Filter {

	@Override
	public void destroy() {
		 
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		 HttpServletRequest req =(HttpServletRequest) request;
		 HttpServletResponse resp =(HttpServletResponse)response;
		 String encoding = "utf-8";
		 req.setCharacterEncoding(encoding);
		 resp.setCharacterEncoding(encoding);
		 resp.setContentType("text/html;charset="+encoding);
		chain.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	 
		
	}

}
