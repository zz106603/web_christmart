<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="<%=application.getContextPath() %>/resources/css/cart.css" rel="stylesheet" type="text/css"/>


  <!-- 컨텐츠 -->
        <div class="cart-content">
            <div class="container-fluid">
                <div class="cart-line">
                    <p class="text">장바구니</p>
                </div>

				<!-- 카트 목록 -->
                <div class="cart-list">
                	
                		<table class="cart-table">
                        <thead>
                            <tr>
                                <th colspan="2">아이템</th>
                                <th>가격</th>
                                <th>수량</th>
                                <th>총가격</th>
                                <th>삭제</th>
                            </tr>
                        </thead>
                         
                        <tbody>   
                        	<c:set var="sum" value="0"/>
                        	<c:set var="count" value="0"/>                      
                        		<c:forEach var="cart" items="${clist}">                        		                       		
                        			<tr>
                                <td class="cart-img-line">
                                    <div class="cart-img">
                                        <img src="${cart.imgSname}">
                                    </div>
                                </td>
                                <td class="cart-img-name">
                                    <p class="text">${cart.productName}</p>
                                </td>
                                <td class="cart-img-rightline">${cart.price}</td>
                                <td class="cart-img-rightline">
                                	<form method="post" action="updateamount">
                                		<input type="text" name="amount" value="${cart.amount}">
                                		<input type="hidden" name="productNo" value="${cart.productNo}"/>
                               			<input type="hidden" name="price"  value="${cart.price}"/>
                              			<input type="hidden" name="userId" value="${cart.userId}"/>
                                		<button  class="btn btn-sm" type="submit">변경</button>
                                	</form>
                                </td>
                                <td class="cart-img-rightline">${cart.allPrice}</td>
                                <td><a class="btn btn-primary btn-sm" style="padding-right:9px;" href="delcart?productNo=${cart.productNo}">X</a></td>
                                <c:set var="sum" value="${sum+cart.allPrice}"/>
                                <c:set var="count" value="${count+cart.amount}"/>   
	                            </tr>                
                        	</c:forEach>                        
                        </tbody>
                    </table>
                	
                    
                </div>
                <div class="price-check">
                	           	
                		<table class="summary-table">
                        <tr class="one-line">
                            <th colspan="2" class="summary-title">SUMMARY</th>
                        </tr>
                        <tr class="two-line">
                            <td colspan="2">
                                SHOPPING AND TAX</td>
                        </tr>
                        <tr>
                            <td>주문 수량</td>
                            <td>${count}</td>
                        </tr>
                        <tr class="three-line">
                            <td>주문 금액</td>
                            <td>${sum}</td>
                        </tr>
                        <tr>
                            <td>할인 금액</td>
                            <td>-0</td>
                        </tr>
                        <tr>
                            <td class="estimated-payment">결제 예상 금액</td>
                            <td class="estimated-payment">${sum}</td>
                        </tr>
                    </table>         

					<!-- 결제세부 창으로 넘어가는 버튼 -->
					<form method="post" action="order">
						<c:forEach var="cart" items="${clist}">										
							<input type="hidden" name="productNo" value="${cart.productNo}"/>
							<input type="hidden" name="userId" value="${cart.userId}"/>
							<input type="hidden" name="amount" value="${cart.amount}">
	                    	<input type="hidden" name="allPrice"  value="${cart.allPrice}"/>
	                  		<input type="hidden" name="productName" value="${cart.productName}"/>
	                  		<input type="hidden" name="price" value="${cart.price}"/>
	                  		<input type="hidden" name="imgOname" value="${cart.imgOname}"/>
	                  		<input type="hidden" name="imgSname" value="${cart.imgSname}"/>
	                  		<input type="hidden" name="imgType" value="${cart.imgType}"/>	                  	
						</c:forEach>
						<input type="hidden" name="sum" value="${sum}"/>
	                  	<input type="hidden" name="count" value="${count}"/>
                  	 <button class="btn btn-info btn-lg btn-block">결제하기</button>
					</form>
								 
               </div>
            </div>

			<div class="text-center">									
				<!-- [처음][이전] 1 2 3 4 5 [다음][맨끝] -->
				<a class="btn btn-outline-primary btn-sm"
					href="cart?pageNo=1">처음</a>
				
				<c:if test="${pager.groupNo>1}">
					<a class="btn btn-outline-info btn-sm"
					href="cart?pageNo=${pager.startPageNo-1}">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo!=i}">
						<a class="btn btn-outline-success btn-sm"
						href="cart?pageNo=${i}">${i}</a>
					</c:if>
					<c:if test="${pager.pageNo==i}">
						<a class="btn	btn-danger btn-sm"
						href="cart?pageNo=${i}">${i}</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${pager.groupNo<pager.totalGroupNo}">
					<a class="btn btn-outline-info btn-sm"
					href="cart?pageNo=${pager.endPageNo+1}">다음</a>
				</c:if>
				
				<a class="btn btn-outline-primary btn-sm"
					href="cart?pageNo=${pager.totalPageNo}">맨끝</a>				
			</div>

    </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
