<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
        <link href="<%=application.getContextPath() %>/resources/css/mypage.css" rel="stylesheet" type="text/css"/>
        <link href="<%=application.getContextPath() %>/resources/css/wishlist.css" rel="stylesheet" type="text/css"/>


   <!-- 컨텐츠 -->
    <div class="container-fluid">
        <div>

            <!-- 마이페이지 타이틀 -->
            <div>
                <h3 id="mypageTitle">MY PAGE</h3>
            </div>

            <!-- 마이페이지 탭 목록 -->
            <div id="mypageList">
                <a href="<%=application.getContextPath() %>/purchaselist" class="mypage-tab">구매내역</a>
                <a href="<%=application.getContextPath() %>/wishlist" class="mypage-tab-clicked">위시리스트</a>
                <a href="<%=application.getContextPath() %>/changeinfo" class="mypage-tab">개인정보수정</a>
                <a href="<%=application.getContextPath() %>/withdrawal" class="mypage-tab">회원탈퇴</a>
                <a href="<%=application.getContextPath()%>/faq" class="mypage-tab">FAQ</a>
            </div>

            <div class="wishlist">
                <div class="wishlist-path">
                    <p>마이페이지 > 위시리스트</p>
                </div>
            </div>
            <div class="wishlist-wrapper">
                <!--카테고리 12개-->
                <div class="row">
                    <div class="col-3">
                        <a href="<%=application.getContextPath() %>/product">
                            <div class="wishlist-product">
                                <img src="<%=application.getContextPath() %>/resources/images/트리/장식용품/4.jpg">
                            </div>
                        </a>
                        <div class="wishlist-title">
                            <p>위시리스트 제목 샘플</p>
                            <p>
                            <form method="post" action="delwishlist" style="padding-left:35%;">
                                <button type="submit" class="btn btn-primary bt-sm">삭제</button>
                            </form>
                            </p>
                        </div>
                    </div>
                    <div class="col-3">
                        <a href="<%=application.getContextPath() %>/product">
                            <div class="wishlist-product">
                                <img src="<%=application.getContextPath() %>/resources/images/트리/장식용품/5.jpg">
                            </div>
                        </a>
                        <div class="wishlist-title">
                            <p>위시리스트 제목 샘플</p>
                            <p>
                                <button class="btn btn-primary bt-sm">삭제</button>
                            </p>
                        </div>
                    </div>
                    <div class="col-3">
                        <a href="<%=application.getContextPath() %>/product">
                            <div class="wishlist-product">
                                <img src="<%=application.getContextPath() %>/resources/images/트리/장식용품/6.jpg">
                            </div>
                        </a>
                        <div class="wishlist-title">
                            <p>위시리스트 제목 샘플</p>
                            <p>
                                <button class="btn btn-primary bt-sm">삭제</button>
                            </p>
                        </div>
                    </div>
                    <div class="col-3">
                        <a href="<%=application.getContextPath() %>/product">
                            <div class="wishlist-product">
                                <img src="<%=application.getContextPath() %>/resources/images/트리/장식용품/7.jpg">
                            </div>
                        </a>
                        <div class="wishlist-title">
                            <p>위시리스트 제목 샘플</p>
                            <p>
                                <button class="btn btn-primary bt-sm">삭제</button>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-3">
                        <a href="<%=application.getContextPath() %>/product">
                            <div class="wishlist-product">
                                <img src="<%=application.getContextPath() %>/resources/images/캔들/5.jpg">
                            </div>
                        </a>
                        <div class="wishlist-title">
                            <p>위시리스트 제목 샘플</p>
                            <p>
                                <button class="btn btn-primary bt-sm">삭제</button>
                            </p>
                        </div>
                    </div>
                    <div class="col-3">
                        <a href="<%=application.getContextPath() %>/product">
                            <div class="wishlist-product">
                                <img src="<%=application.getContextPath() %>/resources/images/캔들/6.jpg">
                            </div>
                        </a>
                        <div class="wishlist-title">
                            <p>위시리스트 제목 샘플</p>
                            <p>
                                <button class="btn btn-primary bt-sm">삭제</button>
                            </p>
                        </div>
                    </div>
                    <div class="col-3">
                        <a href="<%=application.getContextPath() %>/product">
                            <div class="wishlist-product">
                                <img src="<%=application.getContextPath() %>/resources/images/캔들/7.jpg">
                            </div>
                        </a>
                        <div class="wishlist-title">
                            <p>위시리스트 제목 샘플</p>
                            <p>
                                <button class="btn btn-primary bt-sm">삭제</button>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="pagination">
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


