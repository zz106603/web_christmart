<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="<%=application.getContextPath() %>/resources/css/mypage.css" rel="stylesheet" type="text/css"/>
<link href="<%=application.getContextPath() %>/resources/css/exchangeRefund.css" rel="stylesheet" type="text/css"/>
	
	<script type="text/javascript">
		$(document).on('click','#btnRefund',function(e){
			e.preventDefault();
			
			var url="${pageContext.request.contextPath}/exchangerefund";
			
			url = url + "?orderNo="+$('#orderNo'.val();
			
			location.href = url;
			
			console.log(url);
			
		});
	</script>
	
	
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
         
         	<c:forEach var="order" items="${list}">
	             <div class="col">
	                 <div class="img-sideline">
	                     <img src="<%=application.getContextPath() %>${order.imgSname}"id="changeImg">
	                 </div>
	             </div>
	             <div class="col refund-product-details">
						<p>
						주문일자 : ${order.orderDate}<br/>
						주문번호 : ${order.orderNo}<br/>
						주문상품 : ${order.productName}<br/>
						선택옵션 : 단일품목<br/>
						선택수량 : ${order.amount}
	             		</p>
	             </div>
	             <div class="col">
		               <button class="review-btn" onclick="open_review()">한줄평 쓰기</button>
	       		</div>
             
             </c:forEach>
             
         </div>
 
     </div>
 </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


