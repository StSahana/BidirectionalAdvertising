package com.inspur.BA.platform.controller;

import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.inspur.BA.help.common.BaseAction;
import com.inspur.BA.help.common.Constant;
import com.inspur.BA.platform.entity.User;
import com.inspur.BA.platform.service.AuthorityService;
import com.inspur.BA.platform.service.UserService;


/**
 * 管理员操作接口
 *
 */
@Controller
public class LoginAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	@Autowired
	private UserService userService;
	@Autowired
	private AuthorityService authorityService;

	private String userId;// 用户ID
	private String password;//
	private String loginMsg;
	private User user;

	public String login() {
		User sessionUser = (User) this.getSession(Constant.USER_SESSION);//获取用户信息
		try {
			if (sessionUser.getUserId() != null) {
				return Constant.LOGIN_SUCCESS;//有的话登陆成功
			} else {
				return Constant.LOGIN_FAILED;//没有登录失败
			}

		} catch (Exception e) {//如果sessinUser为空，说明用户第一次登录
			if (this.userId != null && this.password != null) {
				Map<String, Object> map = this.userService.isLoginSuccess(
						userId, password);
				if ((Boolean) map.get("flag")) {
					// 设置管理员用户Session
					User loginUser = (User) map.get("User");
					this.getSession().setAttribute(
							Constant.USER_SESSION, loginUser);
					// 查询所有管理员的权限（Map对象），并且把它放到Session中
					this.getSession().setAttribute(
							Constant.USER_AUTHORITY_SESSION,
							this.authorityService.getOptionList(userId));
					return Constant.LOGIN_SUCCESS;
				} else {
					// 登录失败 返回失败原因
					this.loginMsg = (String) map.get("msg");
					return Constant.LOGIN_FAILED;
				}
			}else{
				this.loginMsg = "用户名及其密码必填";
				return Constant.LOGIN_FAILED;
			}
		
		}
	}
	
	public String logout(){
		this.getSession().removeAttribute(Constant.USER_SESSION);
		return Constant.LOGIN_OUT;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLoginMsg() {
		return loginMsg;
	}

	public void setLoginMsg(String loginMsg) {
		this.loginMsg = loginMsg;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}