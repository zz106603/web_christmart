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
                            <tr>
                                <td class="cart-img-line">
                                    <div class="cart-img">
                                        <img src="<%=application.getContextPath() %>/resources/images/트리/장식용품/4.jpg">
                                    </div>
                                </td>
                                <td class="cart-img-name">
                                    <p class="text">장바구니 상품이름 샘플</p>
                                </td>
                                <td class="cart-img-rightline">33,000</td>
                                <td class="cart-img-rightline"><input type="text" value="1"></td>
                                <td class="cart-img-rightline">33,000</td>
                                <td>
                                    <form method="post" action="delcart">
                                    	<input type="button" class="btn btn-primary btn-sm" value="X" style="padding-right:9px;">
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td class="cart-img-line">
                                    <div class="cart-img">
                                        <img src="<%=application.getContextPath() %>/resources/images/트리/장식용품/5.jpg">
                                    </div>
                                </td>
                                <td class="cart-img-name">
                                    <p class="text">장바구니 상품이름 샘플</p>
                                </td>
                                <td class="cart-img-rightline">33,000</td>
                                <td class="cart-img-rightline"><input type="text" value="1"></td>
                                <td class="cart-img-rightline">33,000</td>
                                <td>
                                    <form method="post" action="delcart">
                                    	<input type="button" class="btn btn-primary btn-sm" value="X" style="padding-right:9px;">
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td class="cart-img-line">
                                    <div class="cart-img">
                                        <img src="<%=application.getContextPath() %>/resources/images/트리/장식용품/6.jpg">
                                    </div>
                                </td>
                                <td class="cart-img-name">
                                    <p class="text">장바구니 상품이름 샘플</p>
                                </td>
                                <td class="cart-img-rightline">33,000</td>
                                <td class="cart-img-rightline"><input type="text" value="1"></td>
                                <td class="cart-img-rightline">33,000</td>
                                <td>
                                     <form method="post" action="delcart">
                                    	<input type="button" class="btn btn-primary btn-sm" value="X" style="padding-right:9px;">
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td class="cart-img-line">
                                    <div class="cart-img">
                                        <img src="<%=application.getContextPath() %>/resources/images/트리/장식용품/7.jpg">
                                    </div>
                                </td>
                                <td class="cart-img-name">
                                    <p class="text">장바구니 상품이름 샘플</p>
                                </td>
                                <td class="cart-img-rightline">33,000</td>
                                <td class="cart-img-rightline"><input type="text" value="1"></td>
                                <td class="cart-img-rightline">33,000</td>
                                <td>
                                     <form method="post" action="delcart">
                                    	<input type="button" class="btn btn-primary btn-sm" value="X" style="padding-right:9px;">
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td class="cart-img-line">
                                    <div class="cart-img">
                                        <img src="<%=application.getContextPath() %>/resources/images/캔들/7.jpg">
                                    </div>
                                </td>
                                <td class="cart-img-name">
                                    <p class="text">장바구니 상품이름 샘플</p>
                                </td>
                                <td class="cart-img-rightline">33,000</td>
                                <td class="cart-img-rightline"><input type="text" value="1"></td>
                                <td class="cart-img-rightline">33,000</td>
                                <td>
                                     <form method="post" action="delcart">
                                    	<input type="button" class="btn btn-primary btn-sm" value="X" style="padding-right:9px;">
                                    </form>
                                </td>
                            </tr>
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
                            <td>1</td>
                        </tr>
                        <tr class="three-line">
                            <td>주문 금액</td>
                            <td>33,000</td>
                        </tr>
                        <tr>
                            <td>할인 금액</td>
                            <td>-0</td>
                        </tr>
                        <tr>
                            <td class="estimated-payment">결제 예상 금액</td>
                            <td class="estimated-payment">33,000</td>
                        </tr>
                    </table>

					<!-- 결제세부 창으로 넘어가는 버튼 -->
                    <button class="btn btn-info btn-lg btn-block" onclick="location.href='<%=application.getContextPath() %>/order'">결제하기</button>

                </div>

            </div>

            <!--페이지 넘어가는 부분-->
            <div class="pagination-cart">
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
    </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


