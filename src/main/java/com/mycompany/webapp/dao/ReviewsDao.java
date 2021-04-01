package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Reviews;

@Mapper
public interface ReviewsDao {
	public List<Reviews> selectByPno(int productNo);
	public Reviews selectReview(int reviewNo);
	public List<Reviews> selectByPage(Pager pager);
	public int insert(Reviews review);
	public int deleteReview(@Param("reviewNo") int reviewNo, @Param("userId") String userID);
	//public int count(String userID);	
}
