
// =============================================================== 이메일 관련

function check_Email_form(str)
{                                                 
    //이메일 형식을 사용했는지 여부
     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
     if(!reg_email.test(str)) {  
               
        return false;         
     } else {                       
        return true;         
     }                            

}                                

function check_Email_database(str){
    //기존 사용자인지 아닌지 판별식 기입 예정
    if(true){
        return true;
    } else {
        return false;
    }
}

function confirm_Email(str){
    //이메일 인증 여부
    if(true){
        return true;
    } else {
        return false;
    }
}


function check_Email_all(str){

    var chk_form = check_Email_form(str);
    var chk_data = check_Email_database(str);
    
    if(chk_form && chk_data) {
        alert("이메일이 정상 인증되었습니다.");
        //이메일의 형식과 중복확인이 되면 이메일 인증 진행
        confirm_Email();
        return true;
    } else if(chk_form === false){
        alert("올바른 이메일 형식이 아닙니다.");    
        return false;
    } else if(chk_data === true) {
       alert("이미 등록된 사용자입니다.");
    } else {
        console.log("이메일 관련 에러입니다. 확인하세요.");
        return false;
    }
}




// ===============================================================패스워드 관련

function password_check(){

    var pw = $("#password").val();
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?+]/gi);
   
    var chk_length = pw.length < 8 || pw.length > 20;
    var chk_space = pw.search(/\s/) != -1;
    var chk_typemix = num < 0 || eng < 0 || spe < 0;


    if(chk_length){ 
     alert("비밀번호를 8자리 ~ 20자리 이내로 입력해주세요.");
     return false;
    }else if(chk_space){
     alert("비밀번호는 공백 없이 입력해주세요.");
     return false;
    }else if(chk_typemix){
     alert("비밀번호를 영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
     return false;
    }else if(chk_length && chk_space && chk_typemix){
       console.log("패스워드 조건 통과"); 
       return true;
    }else {
        console.log("패스워드 입력 관련 오류가 발생했습니다. 확인하세요.");
        return false;
    }
   
}


function password_same_check(){

    var pw1 = $("#password").val();
    var pw2 = $("#password_same").val();

    if(pw1!=pw2){
        alert("패스워드가 일치하지 않습니다. 다시 입력해주세요.");
        return false;
    } else {
        console.log("패스워드 일치 통과")
        return true;
    }
}

function password_database(str){
    //기존 사용자인지 아닌지 판별식과 private형태 구현 관련 기입 예정
    if(true){
        return true;
    } else {
        return false;
    }
}

// ===============================================================로그인 관련

function login(){
    var chk_pw = password_database();
    var chk_email = check_Email_database();

    if(chk_pw && chk_email) {
        return true;
    } else if(chk_pw===false) {
        alert("비밀번호가 잘못되었습니다.");
        return false;
    } else if(chk_email===false) {
        alert("아이디가 잘못되었습니다.");
        return false;
    } else if(chk_email===false && chk_pw===false) {
        alert("아이디와 비밀번호가 잘못 되었습니다.");
        return false;
    } else {
        console.log("로그인 에러가 발생했습니다. 확인하세요.");
        return false;
    }

}

function remember_check(){
    var chk_rm = document.getElementById('id-remember').checked;

    if(chk_rm){
        //입력한 계정이 고정 되도록 관련 부분 작성 예정
    } else {
        //입력한 계정이 리셋 되도록 관련 부분 작성 예정
    }


}


// ===============================================================아이디찾기 관련

function check_phone_database(phone){
        //기존 사용자인지 아닌지 판별식과 private형태 구현 관련 기입 예정
        if(true){
            return true;
        } else {
            return false;
        }
}

function check_name_database(phone){
    //기존 사용자인지 아닌지 판별식과 private형태 구현 관련 기입 예정
    if(true){
        return true;
    } else {
        return false;
    }
}

function find_id(){
    var chk_phone = check_phone_database();
    var chk_name = check_name_database();

    if(chk_phone && chk_name){
        return true;
    } else if(chk_phone!==true){
        alert("등록되지 않은 전화번호입니다.");
        return false;
    } else if(chk_name !==true){
        alert("등록되지 않은 사용자입니다.");
        return false;
    } else if(chk_phone===false && chk_name===false){
        alert("등록되지 않은 전화번호와 사용자입니다.");
        return false;
    } else {
        console.log("아이디 찾기에서 에러가 발생했습니다. 확인하세요.");
        return false;
    }
}


// ===============================================================비밀번호 찾기 관련

function generatePassword() {
    var length = 8,
        charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789",
        retVal = "";
    for (var i = 0, n = charset.length; i < length; ++i) {
        retVal += charset.charAt(Math.floor(Math.random() * n));
    }
    return retVal;
}

function find_password(){
    var chk_data = check_Email_database(str);
    if(chk_data){
        var newpw = generatePassword();
        alert('귀하의 이메일로 비밀번호가 전송되었습니다.');
        //이메일로 초기화된 비밀번호를 전송할 부분
        return true;
    } else {
        return false;
    }
}