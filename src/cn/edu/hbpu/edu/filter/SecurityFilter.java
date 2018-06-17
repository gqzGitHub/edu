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
 

 
public class SecurityFilter implements Filter {
 
	private String page;

	public void init(FilterConfig config) throws ServletException {
		page = config.getInitParameter("pass");
	}
	 
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        
        String uri = req.getRequestURI(); //获取客户端请求资源的名称
        uri = uri.substring(uri.lastIndexOf("/")+1);
        if (page.equals(uri)) {
			chain.doFilter(req, resp);
		}else {
			Object obj = req.getSession().getAttribute("login"); //检查Session中有没有用户信息
			if (obj != null) {
				chain.doFilter(req, resp);
			}else{
	           resp.sendRedirect("login.jsp");
			}
		}
        
	}

	public void destroy() {
		
	}
	 

}
