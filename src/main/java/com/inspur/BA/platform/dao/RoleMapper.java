package com.inspur.BA.platform.dao;


import java.util.List;

import com.inspur.BA.platform.entity.Role;


public interface RoleMapper {
    int deleteByPrimaryKey(String roleId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(String roleId);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

	List<Role> getAll();
}