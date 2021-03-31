<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<%@ include file="/WEB-INF/views/common/header.jsp"%>
        <link href="<%=application.getContextPath() %>/resources/css/product.css" rel="stylesheet" type="text/css"/>


<script>

var amount;

function init () {
	amount = document.amountForm.amount.value;
	change();
}

function add () {
	resultAmount = document.amountForm.amount;
	resultAmount.value ++ ;

}
function del () {
	resultAmount = document.amountForm.amount;
		if (resultAmount.value > 1) {
			resultAmount.value -- ;
		}
}
function change () {
	resultAmount = document.amountForm.amount;
		if (resultAmount.value < 0) {
			resultAmount.value = 0;
		}
}  
</script>
<!--상세페이지를 위한-->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            rel="stylesheet">
            
       <!-- 컨텐츠 -->
        <div class="container-fluid">
            <!--여기에 작성-->

            <div class="row product-section ">
                <div class="col-md-12">
                    <hr>
                    <h3>| Product |</h3>
                    <hr>
                </div>
                <div class="preview col-md-5" style="float: left; margin-left: 8%;">
                    <div class="preview-pic tab-content">
                    	<c:forEach var="product" items="${list}" varStatus="status">
	                    	<c:if test="${status.count eq 1}"> 
								<div class="tab-pane active" id="pic-1" style="width:80%"><img class="product-img" src="<%=application.getContextPath()%>/getphoto?imgSname=${product.imgSname}&imgType=${product.imgType}"/></div>	   		
							</c:if>
							<c:if test="${status.count eq 2}"> 
								<div class="tab-pane" id="pic-2" style="width:80%"><img class="product-img" src="<%=application.getContextPath()%>/getphoto?imgSname=${product.imgSname}&imgType=${product.imgType}"/></div>	   		
							</c:if>
							<c:if test="${status.count eq 3}"> 
								<div class="tab-pane" id="pic-3" style="width:80%"><img class="product-img" src="<%=application.getContextPath()%>/getphoto?imgSname=${product.imgSname}&imgType=${product.imgType}"/></div>	   		
							</c:if>
							<c:if test="${status.count eq 4}"> 
								<div class="tab-pane" id="pic-4" style="width:80%" ><img class="product-img" src="<%=application.getContextPath()%>/getphoto?imgSname=${product.imgSname}&imgType=${product.imgType}"/></div>
							</c:if>
                    	</c:forEach>
                        
                        
                    </div>
                    <ul class="preview-thumbnail nav nav-tabs">
                    	<c:forEach var="product" items="${list}" varStatus="status">
	                    	<c:if test="${status.count eq 1}"> 
								 <li class="active">
                            		<a data-target="#pic-1" data-toggle="tab"><img class="product-img" src="<%=application.getContextPath()%>/getphoto?imgSname=${product.imgSname}&imgType=${product.imgType}"/></a>
                       			 </li>	   		
							</c:if>
							<c:if test="${status.count eq 2}"> 
								<li>
		                            <a data-target="#pic-2" data-toggle="tab"><img class="product-img" src="<%=application.getContextPath()%>/getphoto?imgSname=${product.imgSname}&imgType=${product.imgType}"/></a>
		                        </li>	   		
							</c:if>
							<c:if test="${status.count eq 3}"> 
								 <li>
		                            <a data-target="#pic-3" data-toggle="tab"><img class="product-img" src="<%=application.getContextPath()%>/getphoto?imgSname=${product.imgSname}&imgType=${product.imgType}"/></a>
		                        </li>	   		
							</c:if>
							<c:if test="${status.count eq 4}"> 
								<li>
		                            <a data-target="#pic-4" data-toggle="tab"><img class="product-img" src="<%=application.getContextPath()%>/getphoto?imgSname=${product.imgSname}&imgType=${product.imgType}"/></a>
		                        </li>	   		
							</c:if>
                    	</c:forEach>
                       
                    </ul>
                </div>
                <div
                    class="product-details col-md-6"
                    style="position:relative; left: 2%; top:25%; padding-top: 50px;">
                    <h3 class="product-title">| ${product.productName} |</h3>
                    <h5 class="product-price">가격 :
                        <span>${product.productPrice}원</span></h5>
                    <div class="quantity-section">
                        <h5 class="product-quantity">수량
                        </h5>
                    </div>
                    
                    <div class="product-action">
                        <!-- 장바구니 추가 post -->
                    <form method="post" name="amountForm" action="addcart" style="display:inline-block">
                    	<input type="hidden" name="productNo" value="${product.productNo}" />
                    	<input type="hidden" name="userId" value="" />
                    	<input type="hidden" name="price" value="${product.productPrice}" />
                    	<div style="margin-bottom:20%;">
                    		<input type="text" name="amount" value="1" size="3" onchange="change();">
							<input type="button" value=" + " onclick="add();">
							<input type="button" value=" - " onclick="del();"><br>
						</div>
                        <button
                            class="add-to-cart btn btn-default"
                            type="submit"
                            onclick="alert('장바구니에 추가되었습니다.')">add to cart</button>
					</form>
					<form method="post" action="addwishlist" style="display:inline-block">
						<input type="hidden" name="productNo" value="${product.productNo}" />
                    	<input type="hidden" name="userId" value="" />
                        <button
                            class="like btn btn-default"
                            type="submit"
                            onclick="alert('찜 리스트에 추가되었습니다.')"><span class="fa fa-heart"></span></button>
                    </form>
                    </div>
                </div>
            </div>

            <div class="row detail-section">
                <div class="col-md-12">
                    <hr>
                    <h3>| details |</h3>
                    <hr>
                </div>
                <div class="col-md-12 product-description">
                    <p>
                       ${product.productContent}
                    </p>
                </div>
            </div>

            <div class="row review-section">
                <div class="col-md-12">
                    <hr>
                    <h3>| Reviews |</h3>
                    <hr>
                </div>
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-4 review-part-left">
                            <div class="row">
                                <div class="col-md-4">
                                    <img src="http://placekitten.com/400/252">
                                </div>
                                <div class="col-md-4">
                                    <p>8 days ago</p>
                                    <span>고영희</span><br>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 review-part-right">

                            <p>Mr. and Mrs. Dursley, of number four, Privet Drive, were proud to say that
                                they were perfectly normal, thank you very much.
                            </p>
                        </div>
                        <div class="col-md-2 review-part-right">
                        <form method="post" action="delreview">
                            <button class="review-btn" type="submit" onclick="alert('삭제되었습니다.')">
                                <span>remove</span></button>
                         </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-4 review-part-left">
                            <div class="row">
                                <div class="col-md-4 ">
                                    <img src="http://placekitten.com/200/126">
                                </div>
                                <div class="col-md-8">
                                    <p>2 days ago</p>
                                    <span>이강쥐</span><br>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 review-part-right">
                            <p>They were the last people you'd expect to be involved in anything strange or
                                mysterious, because they just didn't hold with such nonsense.</p>
                        </div>
                        <div class="col-md-2 review-part-right">
                            <button class="review-btn" type="button" onclick="alert('삭제되었습니다.')">
                                <span>remove</span></button>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-4 review-part-left">
                            <div class="row">
                                <div class="col-md-4">
                                    <img src="http://placekitten.com/400/252">
                                </div>
                                <div class="col-md-8 ">
                                    <p>12 days ago</p>
                                    <span>김제니</span><br>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 review-part-right">
                            <p>Mr. Dursley was the director of a firm called Grunnings, which made drills.
                            </p>
                        </div>
                        <div class="col-md-2 review-part-right">
                            <button class="review-btn" type="button" onclick="alert('삭제되었습니다.')">
                                <span>remove</span></button>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 ">
                    <div class="row">
                        <div class="col-md-4 review-part-left">
                            <div class="row">
                                <div class="col-md-4 ">
                                    <img src="http://placekitten.com/200/126">
                                </div>
                                <div class="col-md-8 ">
                                    <p>15 days ago</p>
                                    <span>김미영</span><br>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 review-part-right">
                            <p>He was a big, beefy man with hardly any neck, although he did have a very
                                large mustache.</p>
                        </div>
                        <div class="col-md-2 review-part-right">
                            <button class="review-btn" type="button" onclick="alert('삭제되었습니다.')">
                                <span>remove</span></button>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 ">
                    <div class="row">
                        <div class="col-md-4 review-part-left">
                            <div class="row">
                                <div class="col-md-4">
                                    <img src="http://placekitten.com/400/252">
                                </div>
                                <div class="col-md-8 ">
                                    <p>5 month ago</p>
                                    <span>김지연</span><br>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 review-part-right">
                            <p>Mrs. Dursley was thin and blonde and had nearly twice the usual amount of
                                neck, which came in very useful as she spent so much of her time craning over
                                garden fences, spying on the neighbors.</p>
                        </div>
                        <div class="col-md-2 review-part-right">
                            <button class="review-btn" type="button" onclick="alert('삭제되었습니다.')" ;=";">
                                <span>remove</span></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


