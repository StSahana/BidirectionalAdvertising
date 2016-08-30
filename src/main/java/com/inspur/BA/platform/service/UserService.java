package com.inspur.BA.platform.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.inspur.BA.help.util.MD5Util;
import com.inspur.BA.platform.dao.AuthorityMapper;
import com.inspur.BA.platform.dao.UserMapper;
import com.inspur.BA.platform.entity.User;


@Service
public class UserService{
	@Resource
	private UserMapper userMapper;
	@Resource
	private AuthorityMapper authorityMapper;
	

	public Map<String, Object> isLoginSuccess(String userId, String password) {
		Map<String,Object> map=new HashMap<String,Object>();
		User user=this.userMapper.selectByPrimaryKey(userId);
		if(user!=null){
			if(MD5Util.MD5(password).equals(user.getPassword())){
				if(user.getEnable()==1){
					map.put("flag", true);
					map.put("msg", "登录成功！");
					map.put("User",user);
				}else{
					map.put("flag", false);
					map.put("msg", "该用户已被冻结，无法登录！");
					map.put("User",user);	
				}
			}else{
				map.put("flag", false);
				map.put("msg", "密码输入不正确");
			}
		}else{
			map.put("flag", false);
			map.put("msg", "该账号不存在");
		}
		return map;
	}


	public List<User> getAll(User user) {
		return userMapper.getAll(user);
	}


	public boolean insert(User user) {
		return userMapper.insert(user)==1;
	}
	@Transactional
	public boolean insertSelective(User user) {
		return (userMapper.insertSelective(user)&userMapper.insertRole(user))==1;
	}
	@Transactional
	public boolean updateByPrimaryKeySelective(User user) {
		return (userMapper.updateByPrimaryKeySelective(user)&userMapper.updateRoleByPrimaryKeySelective(user))==1;
	}
	@Transactional
	public boolean deleteByPrimaryKey(String userId){
		return (userMapper.deleteByPrimaryKey(userId)&userMapper.deleteRoleByPrimaryKey(userId))==1;
	}


}
