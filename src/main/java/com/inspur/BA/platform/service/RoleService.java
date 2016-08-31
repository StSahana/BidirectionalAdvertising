package com.inspur.BA.platform.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.inspur.BA.platform.dao.RoleMapper;
import com.inspur.BA.platform.entity.Role;

@Service
public class RoleService {
	@Resource
	private RoleMapper roleMapper;

	public List<Role> getAll() {
		return roleMapper.getAll();
	}

	@Transactional
	public boolean deleteByPrimaryKey(String roleId) {
		return (roleMapper.deleteByPrimaryKey(roleId)&
				roleMapper.deleteAuthorityByPrimaryKey(roleId))==1;
	}

	@Transactional
	public boolean updateByPrimaryKeySelective(Role role) {
		return (roleMapper.updateByPrimaryKeySelective(role)&
				roleMapper.deleteAuthorityByPrimaryKey(role.getRoleId())&
				roleMapper.insertAuthoritySelective(role))==1;
	}

	@Transactional
	public boolean insertSelective(Role role) {
		return (roleMapper.insertSelective(role)&
				roleMapper.insertAuthoritySelective(role))==1;
	}

	
}
