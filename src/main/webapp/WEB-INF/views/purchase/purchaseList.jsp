<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
        <link href="<%=application.getContextPath() %>/resources/css/purchaseList.css" rel="stylesheet" type="text/css"/>
        <link href="<%=application.getContextPath() %>/resources/css/mypage.css" rel="stylesheet" type="text/css"/>


<script type="text/javascript" src="<%=application.getContextPath() %>/resources/js/review.js"></script>

  <!-- 컨텐츠 -->
  <div >
	   <!-- 마이페이지 타이틀 -->
	  <div >
	      <h3 id="mypageTitle">MY PAGE</h3>
	  </div>

      <!-- 마이페이지 탭 목록 -->
      <div id="mypageList">
          <a href="<%=application.getContextPath()%>/purchaselist" class="mypage-tab-clicked">구매내역</a>
          <a href="<%=application.getContextPath()%>/wishlist" class="mypage-tab">위시리스트</a>
          <a href="<%=application.getContextPath()%>/changeinfo" class="mypage-tab">개인정보수정</a>
          <a href="<%=application.getContextPath()%>/withdrawal" class="mypage-tab">회원탈퇴</a>
          <a href="<%=application.getContextPath()%>/faq" class="mypage-tab">FAQ</a>
      </div>
  </div>

	<!-- 구매내역 -->
   <div class="container-fluid border">
       <h3 id="mypageTitle-under">구매내역</h3>
       <hr/>
       <div class="row purchaseContent">
           <div class="col" style="border-right:1px solid white;">
               <img src="<%=application.getContextPath() %>/resources/images/트리/장식용품/3.jpg" class="purchaseImg">
           </div>
           <div class="col purchase-details">
               <p>주문일자 : 2021.02.02</p>
               <p>주문번호 : 202102021129384059</p>
               <p>주문상품 : Snow globe girl with star 9cm</p>
               <p>선택옵션 : 단일품목</p>
               <p>선택수량 : 1개</p>
               <p>구매상태 : 배송준비중</p>
           </div>
           <div class="col">
               <a href="<%=application.getContextPath()%>/exchangerefund" class="exchange-btn">교환/환불/구매취소</a>
           </div>
       </div>

       <div class="row purchaseContent">
           <div class="col" style="border-right:1px solid white;">
               <img src="<%=application.getContextPath() %>/resources/images/캔들/6.jpg" class="purchaseImg">
           </div>
           <div class="col" style="padding-top: 20px;">
               <p>주문일자 : 2021.01.08</p>
               <p>주문번호 : 202101081129384059</p>
               <p>주문상품 : The boy and ski 10cm</p>
               <p>선택옵션 : 단일품목</p>
               <p>선택수량 : 1개</p>
               <p>구매상태 : 배송완료</p>
           </div>
           <div class="col">
               <button class="review-btn" onclick="open_review()">한줄평 쓰기</button>
	           <br/>
	           <a href="<%=application.getContextPath()%>/exchangerefund" class="exchange-btn">교환/환불/구매취소</a>
	       </div>
	   </div>

	   <div class="row purchaseContent">
	       <div class="col" style="border-right:1px solid white;">
	           <img src="<%=application.getContextPath() %>/resources/images/트리/장식용품/5.jpg" class="purchaseImg">
	       </div>
	       <div class="col" style="padding-top: 20px;">
	           <p>주문일자 : 2021.02.02</p>
	           <p>주문번호 : 202102021129384059</p>
	           <p>주문상품 : Snow globe girl with star 9cm</p>
	           <p>선택옵션 : 단일품목</p>
	           <p>선택수량 : 1개</p>
	           <p>구매상태 : 배송준비중</p>
	       </div>
	       <div class="col">
	           <a href="<%=application.getContextPath()%>/exchangerefund" class="exchange-btn">교환/환불/구매취소</a>
	       </div>
	   </div>

	   <div class="row purchaseContent">
	       <div class="col" style="border-right:1px solid white;">
	           <img src="<%=application.getContextPath() %>/resources/images/캔들/1.jpg" class="purchaseImg">
	       </div>
	       <div class="col" style="padding-top: 20px;">
	           <p>주문일자 : 2021.01.08</p>
	           <p>주문번호 : 202101081129384059</p>
	           <p>주문상품 : The boy and ski 10cm</p>
	           <p>선택옵션 : 단일품목</p>
	           <p>선택수량 : 1개</p>
	           <p>구매상태 : 배송완료</p>
	       </div>
	       <div class="col">
	           <button class="review-btn" onclick="open_review()">한줄평 쓰기</button>
		        <br/>
		        <a href="<%=application.getContextPath()%>/exchangerefund" class="exchange-btn">교환/환불/구매취소</a>
		    </div>
		</div>

	<!--페이지 넘어가는 부분-->
	  <div class="pagination-purchase">
	      <nav aria-label="Page navigation example">
	          <ul class="pagination">
	              <li class="page-item">
	                  <a class="page-link" href="#" aria-label="Previous">
	                      <span aria-hidden="true">&laquo;</span>
	                  </a>
	              </li>
	              <li class="page-item">
	                  <a class="page-link" href="#">1</a>
	              </li>
	              <li class="page-item">
	                  <a class="page-link" href="#">2</a>
	              </li>
	              <li class="page-item">
	                  <a class="page-link" href="#">3</a>
	              </li>
	              <li class="page-item">
	                  <a class="page-link" href="#">4</a>
	              </li>
	              <li class="page-item">
	                  <a class="page-link" href="#">5</a>
	              </li>
	              <li class="page-item">
	                  <a class="page-link" href="#" aria-label="Next">
	                      <span aria-hidden="true">&raquo;</span>
	                  </a>
	              </li>
	          </ul>
	      </nav>
	  </div>
	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


