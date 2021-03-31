package com.mycompany.webapp.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Wishlist;


@Mapper
public interface WishlistDao{
	
	/*public Wishlist selectAll(String userId);*/
	
	/*	public List<Wishlist> selectAll(Wishlist wishlist);*/

	public List<Wishlist> selectAll();
	
	public List<Wishlist> selectByPage(Pager pager);
	
	/*	public Wishlist selectByWishlistNo(String userId);*/
	
	public int insert(Wishlist wishlist);
	
	/*public int deleteByWishlistNo(@Param("userId")String userId, @Param("productNo") int productNo);*/

	public int deleteByWishlistNo(int productNo);
	public int count();
	

}


