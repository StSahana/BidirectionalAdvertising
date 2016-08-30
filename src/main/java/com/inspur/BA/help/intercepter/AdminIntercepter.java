package com.inspur.BA.help.intercepter;

import java.util.Map;

import com.inspur.BA.help.common.Constant;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AdminIntercepter extends AbstractInterceptor{
	
	private static final long serialVersionUID = 1L;
	
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext act = invocation.getInvocationContext();
		Map<String,Object> session = act.getSession();
		Object admin = (Object) session.get(Constant.USER_SESSION);
		if(admin!=null){
			return invocation.invoke();
		}else{
			return Constant.LOGIN_FAILED;
		}
	}

}
