function account_check(){

    var ac_num = $("#account_num").val();
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?+]/gi);
   
    if(ac_num.length !== 14){ 
     alert("14자리의 계좌번호를 입력해주세요.");
     return false;
    }else if(pw.search(/\s/) != -1){
     alert("계좌번호를 공백 없이 입력해주세요.");
     return false;
    }else if(eng > 0 || spe > 0){
     alert("숫자만 입력해주세요.");
     return false;
    }else {
       console.log("계좌번호 조건 통과"); 
       return true;
    }
   
}