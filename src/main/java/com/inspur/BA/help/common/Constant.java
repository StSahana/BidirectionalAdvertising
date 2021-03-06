package com.inspur.BA.help.common;

/**
 * 整个用户管理模块公共模块的数据
 * @author RM
 *
 */
public class Constant {
	
    /**
	 * 管理员Session名称 
	 */
	public static String USER_SESSION = "USER_SESSION";
   /**
    * 用户权限Session名称 
    */
	public static String USER_AUTHORITY_SESSION = "USER_AUTHORITY_SESSION";
	/**
	 * 页面对应权限的Session名称
	 */
	public static String JSP_AUHORITY_SESSION ="JSP_AUHORITY_SESSION";
	/**
	 * 登录成功返回字符串
	 */
	public static String LOGIN_SUCCESS = "login_success";
	/**
	 * 登录失败返回字符串
	 */
	public static String LOGIN_FAILED ="login_failed";
	/**
	 * 退出系统返回字符串
	 */
	public static String LOGIN_OUT ="login_out";
	/**
	 * 不需要经过过滤的JSP页面 默认login.jsp
	 */
	public static String NO_Filter_JSP = "login.jsp";

}
