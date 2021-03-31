<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>



 <!-- 컨텐츠 -->
        <div class="container-fluid">
            <!--여기에 작성-->
            <br/>
            <br/>
            <div class="jumbotron text-center" style="background-color: f3f3f3;">

                <h4 class="display">주문완료</h4>
                <br/>
                <p class="lead">
                    <strong>주문번호 :
                    </strong>
                    01001255477982</p>
                <p class="lead">
                    <strong>회원이름 :
                    </strong>
                    민지현</p>
                <hr>
                <p class="lead">
                    <a
                        class="btn btn-danger btn-sm"
                        style="background-color: #d15851;"
                        href="<%=application.getContextPath()%>/main"
                        role="button">메인페이지</a>
                    <a
                        class="btn btn-danger btn-sm"
                        style="background-color: #d15851;"
                        href="<%=application.getContextPath()%>/purchaselist"
                        role="button">구매 내역</a>
                </p>
            </div>
        </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


