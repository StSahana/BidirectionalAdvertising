package com.inspur.BA.help.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.inspur.BA.help.common.Constant;
import com.inspur.BA.platform.entity.Authority;

/**
 * 进入系统后的第一层过滤
 * 如果是请求action,直接向后层转发
 * 如果是请求资源，先判断是否登录，再判断是否有权限，有的话加入session，然后向后传递
 * @author Administrator
 *
 */
public class JspFilter implements Filter{
	
	public JspFilter(){
		
	}

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain filter) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)res;
		HttpSession session = request.getSession();
        String requestUrl = request.getRequestURI();
        String objectName = request.getContextPath();
       
        if(requestUrl.contains(".jsp")&&!requestUrl.contains(Constant.NO_Filter_JSP)
        		||requestUrl.contains(".html")){//如果请求资源
        	Object admin = session.getAttribute(Constant.USER_SESSION);
        	if(admin==null){	//未登录驳回请求，重定向到登录页面；
        		request.setAttribute("loginMsg", "用户没有登录,请登录后再访问！");
        		response.sendRedirect(request.getContextPath());
        	}else{
        		String jspAuthString = requestUrl.replace(objectName, "").substring(1);
        		//获取资源文件的文件名
				@SuppressWarnings("unchecked")
				Map<String,List<Authority>> allAuthSession = 
					(Map<String, List<Authority>>) 
					JSON.parse((String) session.getAttribute(Constant.USER_AUTHORITY_SESSION));//从session获取权限列表
        		if(allAuthSession!=null){//如果权限表不为空，直接从权限表获取数据并存储在jsp操作权限中
        			List<Authority> tempJspAuthList = allAuthSession.get(jspAuthString);
        			if(tempJspAuthList!=null){
        				session.removeAttribute(Constant.JSP_AUHORITY_SESSION);
        				session.setAttribute(Constant.JSP_AUHORITY_SESSION, tempJspAuthList);
        
        			}else{//否则删除当前JSP_AUHORITY_SESSION的内容
        				System.out.println(" no power to visit "+jspAuthString+" page!");
        				//应该跳转到，无权访问的页面
        				session.setAttribute(Constant.JSP_AUHORITY_SESSION, new ArrayList<Authority>());
        			}
        		}else{
        			System.out.println(" Not login ,you can't visit "+jspAuthString+" page!");
        			//应该跳转到登陆页
        			session.setAttribute(Constant.JSP_AUHORITY_SESSION, new ArrayList<Authority>());
        		}
        		
        		filter.doFilter(req, res);//请求向后传递
        	}
        }else if(requestUrl.contains(Constant.NO_Filter_JSP)){
        	Object admin = session.getAttribute(Constant.USER_SESSION);
        	if(admin!=null){
        		request.setAttribute("loginMsg", "用户已经登录！");
        		response.sendRedirect(request.getContextPath()+"/main.jsp");
        	}else{
        		 filter.doFilter(req, res);
        	}
        }else{
        	 filter.doFilter(req, res);
        }
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
