package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dto.Products;
import com.mycompany.webapp.dto.ProductsImg;
import com.mycompany.webapp.service.ProductsService;

@Controller
public class ProductController {
	private static final Logger logger =
			LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private ProductsService productsService;


	@GetMapping("/product")
	public String openProduct(int productNo, Model model) {
		
		productsService.addHitCount(productNo);
		List<Products> list = productsService.getProductDetail(productNo);
		
	
		Products product = new Products();
		product = list.get(0);
		
		model.addAttribute("list", list);
		model.addAttribute("product", product);
		
		return "product/product";
	}
	
	 @GetMapping("/getphoto")
	   public void getPhoto(String imgSname, String imgType, HttpServletResponse response) {
	      try {
	 
	    	  
	         // 응답 HTTP 헤더에 저장될 바디의 타입
	    	 response.setContentType(imgType);

	         // 한글 파일일 경우, 깨짐 현상을 방지
	    	 imgSname = new String(imgSname.getBytes("UTF-8"), "ISO-8859-1");
	         response.setHeader("Content-Disposition", "attachment; filename=\"" + imgSname+ "\";");

	         
	         // 응답 HTTP 바디에 이미지 데이터를 출력
	         InputStream is = new FileInputStream("C:/Users/COM/Desktop/상품사진들/캔들/" + imgSname + "." + imgType);
	         OutputStream os = response.getOutputStream();
	         FileCopyUtils.copy(is, os);
	         os.flush();
	         is.close();
	         os.close();

	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }

	
	
	//이미지를 DB에 넣기위한 관리자 전용 페이지
	@GetMapping("/insertImg") 
	public String insertImg() { 
		return "admin/insertImg"; 
	}

	//이미지를 DB에 넣기위한 관리자 전용 페이지
	@PostMapping("/insertImg") 
	public String insertImgFile(ProductsImg productImg) { 
		int result = 0; MultipartFile[] battach = productImg.getBattach(); 
		for(int i=0; i<battach.length; i++) {
			productImg.setImgOname(battach[i].getOriginalFilename());
			productImg.setImgType(battach[i].getContentType()); //파일 저장 시 이름 중복 제거 
			String	saveName = new Date().getTime() + "-" + battach[i].getOriginalFilename();
			productImg.setImgSname(saveName);

			logger.info(productImg.getImgOname()); logger.info(productImg.getImgSname());
			System.out.println(result);

			result = productsService.insertImg(productImg);

			File file = new File("D:/상품/캔들/" + saveName);

			try { battach[i].transferTo(file); } catch (Exception e) {
				e.printStackTrace(); } }


		return "main"; 
	}






}
