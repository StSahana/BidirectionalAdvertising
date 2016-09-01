package com.inspur.BA.platform.controller;


import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.inspur.BA.help.common.BaseAction;
import com.inspur.BA.help.common.Constant;
import com.inspur.BA.platform.entity.Authority;
import com.inspur.BA.platform.entity.User;
import com.inspur.BA.platform.service.AuthorityService;


@Controller
public class AuthorityAction extends BaseAction {
	private static Logger log = Logger.getLogger(AuthorityAction.class);
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private AuthorityService authorityService;
	private Authority authority;
	
	private String userId;
	private String authorityId;
	/**
	 * 
	 * @return 权限菜单
	 */
	public String getAll(){
		if(this.userId==null){
		User user = (User) this.getSession(Constant.USER_SESSION);
		this.userId=user.getUserId();
		}
		try {
			this.responseWriter(JSON.toJSONString(authorityService.getAuthorityList(userId)));
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
		}
		return null;
	}
	/**
	 * 
	 * @return 权限菜单与功能菜单
	 */
	public String getComplete(){
		try {
			this.responseWriter(JSON.toJSONString(authorityService.getCompleteAuthorityList()));
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
		}
		return null;
	}
	
	public String add(){
		Map<String, Object> map = new HashMap<String, Object>();
		if (this.authority != null ) {
			// 开启添加
			if (this.authorityService.insertSelective(this.authority)) {
				map.put("flag", true);
				map.put("msg", "添加成功!");
			} else {
				map.put("flag", false);
				map.put("msg", "添加失败，请检查数据库连接问题！");
			}
		} else {
			map.put("flag", false);
			map.put("msg", "传递的参数为空");
		}
		try {
			this.responseWriter(JSON.toJSONString(map));
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return null;
	}
	
	public String edit(){
		Map<String, Object> map = new HashMap<String, Object>();
		if (this.authority != null ) {
			// 开启添加
			if (this.authorityService.updateByPrimaryKeySelective(this.authority)) {
				map.put("flag", true);
				map.put("msg", "更新成功!");
			} else {
				map.put("flag", false);
				map.put("msg", "更新失败，请检查数据库连接问题！");
			}
		} else {
			map.put("flag", false);
			map.put("msg", "传递的参数为空");
		}
		try {
			this.responseWriter(JSON.toJSONString(map));
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return null;
	}
	
	public String delete(){
		Map<String, Object> map = new HashMap<String, Object>();
		if (this.authorityId != null ) {
			// 开启添加
			if (this.authorityService.deleteByPrimaryKey(this.authorityId)) {
				map.put("flag", true);
				map.put("msg", "删除成功!");
			} else {
				map.put("flag", false);
				map.put("msg", "删除失败，请检查数据库连接问题！");
			}
		} else {
			map.put("flag", false);
			map.put("msg", "传递的参数为空");
		}
		try {
			this.responseWriter(JSON.toJSONString(map));
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return null;
	}

	
	
	public Authority getAuthority() {
		return authority;
	}

	public void setAuthority(Authority authority) {
		this.authority = authority;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAuthorityId() {
		return authorityId;
	}

	public void setAuthorityId(String authorityId) {
		this.authorityId = authorityId;
	}
	
	
}
