package com.mycompany.webapp.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.WishlistDao;
import com.mycompany.webapp.dto.Cart;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Wishlist;

@Service
public class WishlistService {

	private static final Logger logger = LoggerFactory.getLogger(WishlistService.class);

	@Autowired
	private WishlistDao wishlistDao;
	
	public List<Wishlist> getWishlist() {
		List<Wishlist> list = wishlistDao.selectAllWishlist();
		return list;
	}

	public List<Wishlist> getWishlist(Pager pager) {
		List<Wishlist> list = wishlistDao.selectByPage(pager);

		return list;
	}

	public int saveWishlist(Wishlist wishlist) {
		int result = wishlistDao.insert(wishlist);
		return result;
	}
	

	
	public void deleteWishlist(int productNo) {
		/*System.out.println(productNo);*/
		wishlistDao.deleteByWishlistNo(productNo);
	}
	
	public int getTotalRows() {
		int rows = wishlistDao.count();
		return rows;
	}

	

}