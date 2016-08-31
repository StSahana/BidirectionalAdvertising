package com.inspur.BA.platform.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.inspur.BA.help.common.BaseAction;
import com.inspur.BA.platform.entity.Role;
import com.inspur.BA.platform.service.RoleService;

@Controller
public class RoleAction extends BaseAction{
	private static Logger log = Logger.getLogger(RoleAction.class);
	@Autowired
	private RoleService roleService;
	private Role role;
	private String roleId;
	
	public String getAll(){
		try{
			this.responseWriter(JSON.toJSONString(roleService.getAll()));
		}catch(Exception e){
			log.error(e.getMessage());
		}
		return null;
	}
	
	public String add(){
		Map<String, Object> map = new HashMap<String, Object>();
		if (this.role != null ) {
			// 开启添加
			if (this.roleService.insertSelective(this.role)) {
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
		if (this.role != null ) {
			// 开启添加
			if (this.roleService.updateByPrimaryKeySelective(this.role)) {
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
		if (this.roleId != null ) {
			// 开启添加
			if (this.roleService.deleteByPrimaryKey(this.roleId)) {
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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	
	
}
