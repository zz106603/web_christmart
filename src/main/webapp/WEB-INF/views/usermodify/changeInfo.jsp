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
                          onclick="excution_daum_address()"
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
  
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script>
			<!-- 다음 주소 연동 -->
			    function excution_daum_address(){
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var addr = ''; // 주소 변수
			                var extraAddr = ''; // 참고항목 변수
			                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.roadAddress;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    addr = data.jibunAddress;
			                }
			                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                if(data.userSelectedType === 'R'){
			                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있고, 공동주택일 경우 추가한다.
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                    //주소변수 문자열과 참고항목 문자열 합치기
			                    addr += extraAddr;
			                } else {
			                    addr += ' ';
			                }
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                $("#sample4_postcode").val(data.zonecode);
			                $("#sample4_roadAddress").val(addr);
			                // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
			                $("#sample4_detailAddress").attr("readonly", false);
			                $("#sample4_detailAddress").focus();
			            }
			        }).open();
			    }
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>


