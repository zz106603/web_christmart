package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Cart;
import com.mycompany.webapp.dto.Pager;

@Mapper
public interface CartDao {
	public List<Cart> selectAll();
	public List<Cart> selectByPage(Pager pager);
	public int insert(Cart cart);
	public int deleteCart(Cart cart);
	public int count();	
}
