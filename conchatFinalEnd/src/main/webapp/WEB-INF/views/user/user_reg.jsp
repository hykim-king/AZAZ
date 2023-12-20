<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/user_join.css">
<link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">

<style>
    .p-label{
        display:block;
        margin-bottom : 5px;
        font-weight:bold;
    }
    .p-input{
        width:300px;
        height:26.5px;
        vertical-align: middle;
        font-size: 12px;
        border: 1px solid #ccc;
        border-radius:4px;
    }
    
    .p-div{
        margin-bottom : 5px;
        border:1px solid #ccc;
    }
    
</style>
<title>회원등록</title>
<script src="/ehr/resources/js/jquery-3.7.1.js"></script>
<script src="/ehr/resources/js/eUtill.js"></script>
<script >

	function closeTabClick() {
	    window.close();
	}

    function moveToMain(){
        console.log("----------------------------");
        console.log("-------moveToMain-----------");
        console.log("----------------------------");
        
        window.location.href = "/ehr/user/moveToMain.do";
    }

    function moveToList(){
        console.log("----------------------------");
        console.log("-------moveToList-----------");
        console.log("----------------------------");
        
        window.location.href = "/ehr/user/doRetrieve.do";
    }
    
 // doCheckId 함수 정의
    function doCheckId() {
        console.log("----------------------------");
        console.log("-------doCheckId-----------");
        console.log("----------------------------");
        return $.ajax({
            type: "GET",
            url: "/ehr/user/doCheckId.do",
            async: true,
            dataType: "json", // 반환 데이터 타입을 json으로 설정
            data: {
                id: document.querySelector("#id").value
            }
        });
    }

    // doCheckEmail 함수 정의
    function doCheckEmail() {
        console.log("----------------------------");
        console.log("-------doCheckEmail-----------");
        console.log("----------------------------");
        return $.ajax({
            type: "GET",
            url: "/ehr/user/doCheckEmail.do",
            async: true,
            dataType: "json", // 반환 데이터 타입을 json으로 설정
            data: {
                email: document.querySelector("#email").value
            }
        });
    }
    
    function doSave(){
        console.log("----------------------------");
        console.log("----------doSave------------");
        console.log("----------------------------");
        
        // 중복 체크 수행
        doCheckId()
            .done(function (data) {
                console.log("Iddata: "+ data)
                // 아이디 중복 체크 성공
                if (data == 1) {
                    // 중복된 아이디 처리
                    alert("중복된 아이디입니다. 다시 확인해주세요.");
                } else {
                    // 이메일 중복 체크 수행
                    doCheckEmail()
                        .done(function (data) {
                            console.log("Emaildata: "+ data)
                            // 이메일 중복 체크 성공
                            if (data == 1) {
                                // 중복된 이메일 처리
                                alert("중복된 이메일입니다. 다시 확인해주세요.");
                            } else {
                                // 이제 doSave 로직 실행
                                console.log("doSave 로직을 실행합니다.");

                                // 나머지 doSave 로직을 여기에 추가
                                //javascrip
                                /* console.log("javascript userId: "+document.querySelector("#id").value);
                                console.log("javascript ppl_input: "+document.querySelector(".ppl_input").value); */
                                
                                //jquert : $
                                     
                                console.log("jquery userId: "+$("#id").val());
                                console.log("jquery ppl_input: "+$(".ppl_input").val());
                                
                                if(eUtil.isEmpty(document.querySelector("#nm").value) == true){
                                    alert('이름을 입력하세요');
                                    //$('#userId').focus();//사용자 id에 포커스
                                    document.querySelector("#nm").focus();
                                    return;
                                }
                                
                                if(eUtil.isEmpty(document.querySelector("#birth").value) == true){
                                    alert('생년월일을 입력하세요.');
                                    //$('#userId').focus();//사용자 id에 포커스
                                    document.querySelector("#birth").focus();
                                    return;
                                }
                                
                                if(eUtil.isEmpty(document.querySelector("#id").value) == true){
                                    alert('아이디를 입력하세요.');
                                    //$('#userId').focus();//사용자 id에 포커스
                                    document.querySelector("#id").focus();
                                    return;
                                }
                                
                                if(eUtil.isEmpty(document.querySelector("#pw").value) == true){
                                    alert('비밀번호를 입력하세요.');
                                    //$('#userId').focus();//사용자 id에 포커스
                                    document.querySelector("#pw").focus();
                                    return;
                                }
                                
                                if(eUtil.isEmpty(document.querySelector("#email").value) == true){
                                    alert('이메일을 입력하세요');
                                    //$('#userId').focus();//사용자 id에 포커스
                                    document.querySelector("#email").focus();
                                    return;
                                }
                                
                                if(eUtil.isEmpty(document.querySelector("#lolnick").value) == true){
                                    alert('롤 닉네임을 입력하세요');
                                    //$('#userId').focus();//사용자 id에 포커스
                                    document.querySelector("#email").focus();
                                    return;
                                }
                                
                                if(eUtil.isEmpty(document.querySelector("#lolchenick").value) == true){
                                    alert('롤체 닉네임을 입력하세요');
                                    //$('#userId').focus();//사용자 id에 포커스
                                    document.querySelector("#email").focus();
                                    return;
                                }
                                
                                if(eUtil.isEmpty(document.querySelector("#valnick").value) == true){
                                    alert('발로란트 닉네임을 입력하세요');
                                    //$('#userId').focus();//사용자 id에 포커스
                                    document.querySelector("#email").focus();
                                    return;
                                }
                                
                                if(eUtil.isEmpty(document.querySelector("#chat").value) == true){
                                    alert('음성채팅 여부를 선택하세요');
                                    //$('#userId').focus();//사용자 id에 포커스
                                    document.querySelector("#chat").focus();
                                    return;
                                }
                                
                                if(eUtil.isEmpty(document.querySelector("#act").value) == true){
                                    alert('적극성 여부를 선택하세요');
                                    //$('#userId').focus();//사용자 id에 포커스
                                    document.querySelector("#act").focus();
                                    return;
                                }
                                
                                //confirm
                                if(confirm("가입 완료") == false)return;

                                
                                $.ajax({
                                    type: "POST",
                                    url:"/ehr/user/doSave.do",
                                    asyn:"true",
                                    dataType:"html",
                                    data:{
                                    	nm:document.querySelector("#nm").value,
                                        birth:document.querySelector("#birth").value,
                                        id: document.querySelector("#id").value,
                                        pw: document.querySelector("#pw").value,
                                        lolnick: document.querySelector("#lolnick").value,
                                        lolchenick: document.querySelector("#lolchenick").value,
                                        valnick: document.querySelector("#valnick").value,
                                        email: document.querySelector("#email").value,
                                        chat: document.querySelector("#chat").value,
                                        act: document.querySelector("#act").value
                                    },
                                    success:function(data){//통신 성공
                                        console.log("success data:"+data);
                                        //success data:{"msgId":"1","msgContents":"ㅇㅇ가 등록 되었습니다.","no":0,"totalCnt":0,"pageSize":0,"pageNo":0}
                                        let parsedJSON = JSON.parse(data);
                                        if("1" === parsedJSON.msgId){
                                            alert(parsedJSON.msgContents);
                                            window.close();
                                        }else{
                                            alert(parsedJSON.msgContents);
                                        }
                                    },
                                    error:function(data){//실패시 처리
                                        console.log("error:"+data);
                                    },
                                    complete:function(data){//성공/실패와 관계없이 수행!
                                        console.log("complete:"+data);
                                    }
                                });
                            }
                        })
                        .fail(function () {
                            // 이메일 중복 체크 실패
                            alert("이메일 중복 체크에 실패했습니다.");
                        });
                }
            })
            .fail(function () {
                // 아이디 중복 체크 실패
                alert("아이디 중복 체크에 실패했습니다.");
            });
      
    }
</script>
</head>
<body>
    <!-- <div class = "popup-size" > -->
        <div class="body-bgcolor-set">
            <div class="user-join">
                
                <div class="inner-box">
                    <div class="contents-box">
                        <!-- 회원가입 안내문 -->
                        <div class="flex-box join-description">
                            <a href="#" class="icon icon-login-conchat"></a>
                        </div>

                        <div class="line-bottom">
                            <h1 class="sub-section-title ">회원가입</h1>
                        </div>

                        <!-- 정보 수정 -->
                        <div class="table-indent">
                            <form class="user-join-form">
                                <table>
                                    <tr>
                                        <th>이름</th>
                                        <td>
                                            <input type="text" class="p-input ppl_input" name="nm" id="nm" placeholder ="이름 입력" size="20" maxlength="30">
                                        </td>
                                    </tr>
                                        
                                    <tr>    
                                        <th>생년월일</th>
                                        <td>
                                            <input type="text" class="p-input ppl_input" name="birth" id="birth" placeholder ="생년월일 6자리 입력" size="20" maxlength="6">
                                        </td>
                                    </tr>
                                    <tr>    
                                        <th>아이디</th>
                                        <td>
                                            <input type="text" class="p-input" name="id" id="id" placeholder ="아이디 입력" size="20" maxlength="20">
                                        </td>
                                        
                                    </tr>
                                    <tr>    
                                        <th>비밀번호</th>
                                        <td>
                                            <input type="password"  class="p-input" name="pw" id="pw" placeholder ="비밀번호 입력" size="20" maxlength="20">
                                        </td>
                                    </tr>                                   
                                    <tr>    
                                        <th>이메일</th>
                                        <td>
                                            <input type="text"  class="p-input" name="email" id="email" placeholder ="이메일 입력" size=20 maxlength="320">
                                        </td>
                                    </tr>
                                    <tr>    
                                        <th>롤 닉네임</th>
                                        <td>
                                            <input type="text" class="p-input" name="lolnick" id="lolnick" placeholder ="롤 닉네임 입력" size="20" maxlength="30">
                                        </td>
                                    </tr>
                                    <tr>    
                                        <th>롤토체스 닉네임</th>
                                        <td>
                                            <input type="text" class="p-input" name="lolchenick" id="lolchenick" placeholder ="롤토체스 닉네임 입력" size="20" maxlength="30">
                                        </td>
                                    </tr>
                                    <tr>    
                                        <th>발로란트 닉네임</th>
                                        <td>
                                            <input type="text" class="p-input" name="valnick" id="valnick" placeholder ="발로란트 닉네임 입력" size="20" maxlength="30">
                                        </td>
                                    </tr>
                                    
                                    <tr>    
                                        <th>음성채팅</th>
                                        <td>
                                            <select name ="chat" id="chat">
                                                <option value="1">사용</option>
                                                <option value="2">미사용</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>    
                                        <th>적극성</th>
                                        <td>
                                            <select name ="act" id="act">
                                                <option value="1">적극적</option>
                                                <option value="2">소극적</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" class="tac">
                                            <input type="button" class="my-btn blue-red mb10" value="가입 완료" id="doSave"     onclick="window.doSave();">
                                            <input type="button" class="my-btn blue-red mb10" value="돌아가기" id="moveToList" onclick="window.close();">                                    
                                        </td>
                                    </tr>
                                </table>    
                            </form>
                        </div>
                    </div>
                </div>      
            </div>
        </div>
    </div>
</body>