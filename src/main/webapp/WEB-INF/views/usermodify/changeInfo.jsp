<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
        <link href="<%=application.getContextPath() %>/resources/css/mypage.css" rel="stylesheet" type="text/css"/>

        <link href="<%=application.getContextPath() %>/resources/css/changeInfo.css" rel="stylesheet" type="text/css"/>


  <!-- 컨텐츠 -->
  <div >
	   <!-- 마이페이지 타이틀 -->
	  <div >
	      <h3 id="mypageTitle">MY PAGE</h3>
	  </div>

      <!-- 마이페이지 탭 목록 -->
       <div id="mypageList">
          <a href="<%=application.getContextPath()%>/purchaselist" class="mypage-tab">구매내역</a>
          <a href="<%=application.getContextPath()%>/wishlist" class="mypage-tab">위시리스트</a>
          <a href="<%=application.getContextPath()%>/changeinfo" class="mypage-tab-clicked">개인정보수정</a>
          <a href="<%=application.getContextPath()%>/withdrawal" class="mypage-tab">회원탈퇴</a>
          <a href="<%=application.getContextPath()%>/faq" class="mypage-tab">FAQ</a>
      </div>
  </div>

    <form method="post" action="changeinfo">
  <div >
      <h3 id="mypageTitle-under">개인정보수정</h3>
      <hr/>
      <table id="changeTable">
          <tr>
              <th>
                  <label for="name">이름*</label>
              </th>

              <td><input type="text" value="홍길동" class="name" name="uname" required="required"></td>
          </tr>
          <tr>
              <th>
                  <label for="id">아이디*</label>
              </th>
              <td>id1234</td>
          </tr>
          <tr>
              <th>
                  <label for="pw">비밀번호*</label>
              </th>
              <td><input type="password" name="upassword" minlength="4" maxlength="16" required="required">
                  <small>*비밀번호는 4~16자리로 입력해주세요.</small>
              </td>
          </tr>
          <tr>
              <th>
                  <label for="check_pw">비밀번호확인*</label>
              </th>
              <td><input type="password"></td>
          </tr>
          <tr>
              <th rowspan="3">
                  <label for="address">주소*</label>
              </th>
              <td><input type="text">
                  <!-- 우편번호 찾기 post.js 파일 -->

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
                          class="form-control signup_btn"
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
              </td>
          </tr>
          <tr>
              <td><input type="text">
                  기본주소</td>
          </tr>
          <tr>
              <td><input type="text">
                  나머지 주소</td>
          </tr>
          <tr>
              <th>
                  <label for="phoneNum">휴대전화*</label>
              </th>
              <td>
                  <select>
                      <option>010</option>
                      <option>011</option>
                      <option>016</option>
                      <option>017</option>
                  </select>
                  -
                  <input type="text" required="required">
                  -
                  <input type="text" required="required"></td>
          </tr>
      </table>
  </div>
  
  <div>
      <button
          type="submit"
          style="background-color: #d15851; color: #f3f3f3;"
          class="btn changebtn"
          ;=";">
          <a href="<%=application.getContextPath()%>/main" style="color:#f3f3f3">저장</a>
      </button>
      <button
          type=""
          style="background-color: #d15851; color: #f3f3f3;"
          class="btn changebtn"
          ;=";"> 
          <a href="<%=application.getContextPath()%>/main" style="color:#f3f3f3">취소</a>
      </button>
  </div>
  
  </form>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


