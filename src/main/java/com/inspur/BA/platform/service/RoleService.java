package com.inspur.BA.platform.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.inspur.BA.platform.dao.RoleMapper;
import com.inspur.BA.platform.entity.Role;

@Service
public class RoleService {
	@Resource
	private RoleMapper roleMapper;

	public List<Role> getAll() {
		return roleMapper.getAll();
	}

	public boolean deleteByPrimaryKey(String roleId) {
		return roleMapper.deleteByPrimaryKey(roleId)==1;
	}

	public boolean updateByPrimaryKeySelective(Role role) {
		return roleMapper.updateByPrimaryKeySelective(role)==1;
	}

	public boolean insertSelective(Role role) {
		return roleMapper.insertSelective(role)==1;
	}

	
}
