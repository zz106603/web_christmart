<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
        <link href="<%=application.getContextPath() %>/resources/css/order.css" rel="stylesheet" type="text/css"/>


  <!-- 컨텐츠 -->
        <div class="login-content">
            <div class="container-fluid">
                <div class="login-wrapper">
                    <div class="login-path">
                        <p>주문</p>
                    </div>
                </div>
                <div class="container-order">
                    <div class="d-flex justify-content-center container">

                        <!-- 수령인 관련 정보입력 카드
                        ======================================================================== -->
                        <div class="card-order">
                            <div class="card-header">
                                <h6>수령인</h6>
                            </div>
                            <div class="card-body">
                                <form>
                                    <div class="input-group form-group">
                                        <!-- 주소입력 -->
                                        <div>
                                            <input
                                                type="text"
                                                id="sample4_postcode"
                                                class="form-control"
                                                placeholder="우편번호"
                                                readonly="readonly">
                                            <input
                                                type="button"
                                                onclick="sample4_execDaumPostcode()"
                                                class="form-control find_btn"
                                                value="우편번호 찾기">
                                            <br>
                                        </div>
                                        <div><input
                                            type="text"
                                            id="sample4_roadAddress"
                                            class="form-control"
                                            placeholder="도로명주소"
                                            readonly="readonly"></div>
                                        <div><input
                                            type="text"
                                            id="sample4_detailAddress"
                                            class="form-control"
                                            placeholder="상세주소"></div>
                                    </div>

                                    <!-- 수령인 이름과 전화번호 -->
                                    <div class="input-group form-group">
                                        <input type="text" class="form-control" placeholder="수령인">
                                    </div>
                                    <div class="input-group form-group">
                                        <input type="text" class="form-control" placeholder="수령인 연락처">
                                    </div>
                                </form>
                            </div>

                        </div>

                        <!-- 결제방법 카드
                        ======================================================================== -->
                        <div class="card-order">
                            <div class="card-header">
                                <h6>결제방법-무통장입금</h6>
                            </div>
                            <div class="card-body">
                                <form>
                                    <!-- 산타캔디의 입금전용 계좌 고정값-->
                                    <div class="input-group form-group">
                                        <label class="align-self-center" id="accountlabel">입금하실 계좌번호</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            placeholder="202100-00-000000"
                                            readonly="readonly">
                                    </div>

                                    <div class="input-group form-group">
                                        <label class="align-self-center" id="accountlabel">예금주</label>
                                        <input type="text" class="form-control" placeholder="송파은행" readonly="readonly">
                                    </div>
                                    <div class="input-group form-group">
                                        <label class="align-self-center" id="accountlabel">은행명</label>
                                        <input type="text" class="form-control" placeholder="산타캔디" readonly="readonly">
                                    </div>

                                    <div>
                                        <h6>※ 위 계좌로 결제 금액을 입금하시면, 확인 후 2~3일 내에 배송이 시작됩니다.</h6>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- 결제 금액 및 배송비 카드 -->
                        <div class="card-order">
                            <div class="card-header">
                                <h6>결제금액</h6>
                            </div>
                            <div class="row card-body">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>항목</th>
                                            <th>금액</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <!-- 상품 금액 받아옴 -->
                                            <td>상품 금액</td>
                                            <td>
                                                <!-- ***************************금액 관련 부분은 추후 상당부분 js로 빼고 재분배
                                                예정*********************** -->
                                                <script>
                                                    // 금액 보내는 페이지 <script>     var tot = tot.value; location.href="order.html?"+tot;
                                                    //

                                                    // 금액 받는 페이지
                                                    var temp = location
                                                        .href
                                                        .split("?");
                                                    var data = temp[1];
                                                    document.write(data + "원");
                                                </script>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>배송비</td>
                                            <td>
                                                <script>
                                                    // 배송비 고정값
                                                    var delivery = 2500;
                                                    document.write(delivery + "원");
                                                </script>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>총 결제금액</td>
                                            <td>
                                                <script>
                                                    // 결과값에 배송비 합산해 리턴
                                                    var result = Number(data) + delivery;
                                                    document.write(result + "원");
                                                </script>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <!--
                                *************************************************************************************************************-->

                                <!-- 결제약관 동의 체크박스 추후 결제약관 동의 관련 order.js 파일에 추가 예정-->
                                <div class="row form-group remember" style="margin-left:30px;">
                                    <input type="checkbox" id="agree-pay">
                                    결제 및 이용약관에 동의합니다.
                                </div>

                                <!-- 구매확정 창으로 넘어가기 위한 버튼 -->
                                <div class="form-group pay_btn_div">
                                <form method="post" action="ordercomplete">
                                    <button type="submit" class="btn btn-primary" id="pay-btn">
                                        <a href="<%=application.getContextPath()%>/ordercomplete" 
                                        style="color:white">결제하기</button>
                                </form>
                                </div>

                                </div>
                            </div>

                        </div>

                    </div>

                </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


