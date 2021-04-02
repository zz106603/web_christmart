package com.mycompany.webapp.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Wishlist;


@Mapper
public interface WishlistDao{
	
	
	public List<Wishlist> selectAllWishlist();
	public List<Wishlist> selectAll(String userId);
	
	public List<Wishlist> selectByPage(Pager pager);
		
	public int insert(Wishlist wishlist);
	
	public int deleteByWishlistNo(int productNo);
	public int count();
	

}


