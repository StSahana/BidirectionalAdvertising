package com.inspur.BA.platform.dao;


import java.util.List;

import com.inspur.BA.platform.entity.User;


public interface UserMapper {
    int deleteByPrimaryKey(String userId);
    
    int deleteRoleByPrimaryKey(String userId);

    int insert(User record);

    int insertSelective(User record);
    
    int insertRole(User record);

    User selectByPrimaryKey(String userId);

    int updateByPrimaryKeySelective(User record);
    
    int updateRoleByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	List<User> getAll(User user);
}