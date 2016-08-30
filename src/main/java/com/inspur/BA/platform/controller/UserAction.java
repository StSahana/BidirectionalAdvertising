package com.inspur.BA.platform.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.inspur.BA.help.common.BaseAction;
import com.inspur.BA.platform.entity.User;
import com.inspur.BA.platform.service.UserService;

@Controller
public class UserAction extends BaseAction{
	private static Logger log = Logger.getLogger(UserAction.class);
	private static final long serialVersionUID = 1L;
	
	private int page = 1;//当前页 默认第一页
	private int rows = 25;//每页数据数目 默认25条
	private String userId;
	private User user;
	@Autowired
	private UserService userService;
	
	public String getAll(){
		List<User> list=userService.getAll(this.user);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total", list.size());
		map.put("rows",list);
		try{
			this.responseWriter(JSON.toJSONString(map));
		}catch(Exception e){
			log.error(e.getMessage());
		}
		return null;
	}
	
	public String add(){
		Map<String, Object> map = new HashMap<String, Object>();
		if (this.user != null ) {
			// 开启添加
			if (this.userService.insertSelective(this.user)) {
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
		if (this.user != null ) {
			// 开启添加
			if (this.userService.updateByPrimaryKeySelective(this.user)) {
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
		if (this.userId != null ) {
			// 开启添加
			if (this.userService.deleteByPrimaryKey(this.userId)) {
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

	/**
	 * getter AND setter for struts
	 * @return
	 */
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}
	
	
	
	
	

}
