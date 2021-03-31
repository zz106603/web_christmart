function agree_check(){
    var chk_agree = document.getElementById('agree-pay').checked;

    if(chk_agree){
        return true;
    } else {
        alert('약관에 동의하신 후 결제가 가능합니다.');
        return false;
    }

}


// 금액 관련 부분 추가 예정