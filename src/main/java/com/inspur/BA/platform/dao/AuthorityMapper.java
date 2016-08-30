package com.inspur.BA.platform.dao;


import java.util.List;

import com.inspur.BA.platform.entity.Authority;


public interface AuthorityMapper {
    int deleteByPrimaryKey(String authorityId);

    int insert(Authority record);

    int insertSelective(Authority record);

    Authority selectByPrimaryKey(String authorityId);

    int updateByPrimaryKeySelective(Authority record);

    int updateByPrimaryKey(Authority record);
    
    List<Authority> getAuthorityList(String userId);

	List<Authority> getCompleteAuthorityList();
}