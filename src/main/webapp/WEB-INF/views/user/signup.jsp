<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
        <link href="<%=application.getContextPath() %>/resources/css/signup.css" rel="stylesheet" type="text/css"/>


  <!-- 컨텐츠 -->
         <div class="signup-content">
            <div class="container-fluid">
                <div class="login-wrapper">
                    <div class="login-path">
                        <p>회원가입</p>
                    </div>
                </div>
                <div class="container-signup">

                    <div class="d-flex justify-content-center container">
                        <div class="card-signup">

                            <!-- 회원가입 헤더 -->
                            <div class="card-header">
                                <h6>SIGN-UP</h6>
                            </div>

                            <!-- 회원가입 바디 -->
                            <div class="card-body">
                                <form method="post" action="signup">
                                    <div class="input-group form-group">
                                        <input type="text" class="form-control" name="uname" placeholder="이름">
                                    </div>

                                    <!-- 이메일 인증 진행 email.js 파일 -->
                                    <div class="input-group form-group">
                                        <input type="text" id="email" name="uemail" class="form-control" placeholder="이메일 아이디">
                                        <input
                                            type="button"
                                            class="btn btn-primary form-control signup-btn"
                                            onclick="check_Email_all()"
                                            value="이메일 인증">
                                    </div>

                                    <!-- 비밀번호 확인 진행 password.js 파일 -->
                                    <div class="input-group form-group">
                                        <div>
                                            <input type="password" id="password" name="upassword" class="form-control" placeholder="비밀번호">
                                        </div>
                                        <div>
                                            <input
                                                type="password"
                                                id="password_same"
                                                class="form-control"
                                                placeholder="비밀번호 재입력">
                                        </div>
                                        <div>
                                            <input
                                                type="button"
                                                class="btn btn-primary form-control signup-btn"
                                                onclick="password_check()"
                                                value="비밀번호 확인">
                                        </div>
                                    </div>

                                    <!-- 우편번호 찾기 post.js 파일 -->
                                    <div class="input-group form-group">
                                        <div>
                                            <input
                                                type="text"
                                                id="sample4_postcode"
                                                class="form-control"
                                                name="zipcode"
                                                placeholder="우편번호"
                                                readonly="readonly">
                                            <input
                                                type="button"
                                                onclick="sample4_execDaumPostcode()"
                                                class="form-control signup_btn"
                                                value="우편번호 찾기">
                                            <br>
                                        </div>

                                        <div><input
                                            type="text"
                                            id="sample4_roadAddress"
                                            class="form-control"
                                            name="roadname"
                                            placeholder="도로명주소"
                                            readonly="readonly"></div>
                                        <div><input
                                            type="text"
                                            id="sample4_detailAddress"
                                            class="form-control"
                                            name="detailaddress"
                                            placeholder="상세주소"></div>
                                    </div>

                                    <!-- 환불용 계좌번호 입력 -->
                                    <div class="input-group form-group">
                                        <input type="text" class="form-control" placeholder="계좌번호('-'없이 작성)">
                                        <input
                                            type="button"
                                            class="btn btn-primary form-control signup-btn"
                                            name="account"
                                            onclick="account_check()"
                                            value="계좌번호 확인">
                                    </div>
                                    <div class="input-group form-group">
                                        <input type="text" class="form-control" name="backname" placeholder="은행명">
                                    </div>

                                    <div class="input-group form-group">
                                        <input type="text" class="form-control" name="accountholder" placeholder="예금주">
                                    </div>
                                    
                                    <div class="form-group">
                                        <hr/>
                                        <input
                                            type="submit"
                                            value="회원가입"
                                            class="btn float-right signup-btn-complete"
                                            onclick="password_check()">
                                    </div>

                                </form>
                            </div>

                        </div>

                    </div>

                </div>

            </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>


