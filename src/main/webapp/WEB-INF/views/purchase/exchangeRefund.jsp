<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="<%=application.getContextPath() %>/resources/css/mypage.css" rel="stylesheet" type="text/css"/>
<link href="<%=application.getContextPath() %>/resources/css/exchangeRefund.css" rel="stylesheet" type="text/css"/>


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

  <div>
     <!-- 구매내역-교환/환불신청 타이틀 -->
     <h3 id="mypageTitle-under">구매내역 - 교환/환불 신청</h3>
     <hr/>

     <!-- 교환/환불하고자하는 상품의 구매내역 상세정보 -->
     <div class="container-fluid border">
         <div class="row exchangeContent">
             <div class="col">
                 <div class="img-sideline">
                     <img src="<%=application.getContextPath() %>/resources/images/트리/장식용품/3.jpg"id="changeImg">
                 </div>
             </div>
             <div class="col refund-product-details">
                 <p>주문일자 : 2021.02.02<br/>
                     주문번호 : 202102021129384059<br/>
                     주문상품 : Snow Globe girl with star 9cm<br/>
                     선택옵션 : 단일품목<br/>
                     선택수량 : 1개</p>
             </div>
         </div>
         <br>

         <div class="exchangeContent">
             <hr/>
             <!-- 환불사유 선택 -->
             <h5 id="select-refund-reason-title">환불사유를 선택해주세요</h5>
             <hr/>
             <form method="post" action="exchangerefund">
                 <div>
                     <div id="select-reason">
                         <input type="radio" name="reason"> 상품이 마음에 안 들어서<br>
                         <input type="radio" name="reason"> 상품에 하자가 있어서<br>
                         <input type="radio" name="reason"> 서비스에 불만이 있어서<br>
                         <input type="radio" name="reason"> 배송이 늦어서<br>
                         <input type="radio" name="reason"> 말하기 싫음<br>

                     </div>
                 </div>

                 <hr/>
                 <div>

                     <!-- 교환 환불 관련 유의사항 -->
                     <p id="exchange-refund-notice">
                         ※ 교환/환불 접수 후 2~3일 내로 상품은 방문수거 됩니다.
                         <br/>
                         상품이 본사에 도착하면, 상품 점검 후 교환 또는 환불까지는 약 1일이 소요됩니다.
                     </p>
                 </div>

                 <hr/>

                 <!-- 교환환불 버튼 -->
                 <div id="refund-btn-div">
                     <input
                         type="submit"
                         id="refund-btn"
                         onclick="alert('신청이 완료되었습니다.')"
                         value="교환/환불 신청">
                 </div>
                 <hr/>

             </form>

         </div>
     </div>
 </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


