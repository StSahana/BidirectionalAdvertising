package com.inspur.BA.platform.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.inspur.BA.platform.dao.AuthorityMapper;
import com.inspur.BA.platform.entity.Authority;
@Service
public class AuthorityService {
	@Resource
	private AuthorityMapper authorityMapper;

	/**
	 * 权限列表
	 * @param authorityId
	 * @return
	 */
	public List<Authority> getAuthorityList(String authorityId) {
		return authorityMapper.getAuthorityList(authorityId);
	}
	
	/**
	 * 操作菜单
	 * @param authorityId
	 * @return
	 */
	public String getOptionList(String authorityId) {
		Map<String,List<Authority>> map=new HashMap<String,List<Authority>>();
		List<Authority> list=this.getAuthorityList(authorityId);
		for(int i=0;i<list.size();i++){
			if(list.get(i).getType()==1){
				map.put(list.get(i).getMenuUrl(),new ArrayList<Authority>());
				}
			}
		for(int i=0;i<list.size();i++){
			if(list.get(i).getType()==2){
				for(int j=0;j<list.size();j++){
					if(list.get(i).getParentId().equals(list.get(j).getAuthorityId())){
						map.get(list.get(j).getMenuUrl()).add(list.get(i));
						break;
					}
					
				}
			}
		}
		return JSON.toJSONString(map);
	}	

	public boolean insertSelective(Authority authority) {
		return authorityMapper.insertSelective(authority)==1;
	}
	
	public boolean updateByPrimaryKeySelective(Authority authority) {
		return authorityMapper.updateByPrimaryKeySelective(authority)==1;
	}
	
	public boolean deleteByPrimaryKey(String authorityId){
		return authorityMapper.deleteByPrimaryKey(authorityId)==1;
	}

	public List<Authority> getCompleteAuthorityList() {
		return authorityMapper.getCompleteAuthorityList();
	}
}
	

