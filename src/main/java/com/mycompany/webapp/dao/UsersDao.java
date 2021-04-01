package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Users;

@Mapper
public interface UsersDao {
	public int insert(Users user); 
	public Users selectByUserid(String userId); 
	public List<Users> selectAll(); 
	public int update(String userId); 
}
