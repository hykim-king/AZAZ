<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">                                       
<link type="text/css" rel="stylesheet" href="../resources/css/reset.css" />
<link type="text/css" rel="stylesheet" href="../resources/css/matching_var.css"/>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<style>
   
</style>
<title>발로란트 매칭</title>
<script src="/ehr/resources/js/jquery-3.7.1.js"></script>
<script src="/ehr/resources/js/eUtill.js"></script>
<script >

    var matchedId;
    var matchedNickname;
    
    function closeTabClick() {
        window.close();
    }
    
    function doFindValNickname(){
        console.log("----------------------------");
        console.log("-------doFindValNickname-------");
        console.log("----------------------------");
        
        return $.ajax({
            type: "GET",
            url: "/ehr/match/doFindValNickname.do",
            async: true,
            dataType: "html",
            data: {
                id: matchedId
            },
            success:function(data){//통신 성공
                matchedNickname = data;
                console.log("success data:"+data);
                if(data != ""){
                    matchedNickname = data;
                    console.log("matchedNickname: " + data);
                    if (!confirm(matchedId + "님과 매칭 되었습니다. 게임 닉네임은 " + matchedNickname + "입니다.")) {
                        doSaveMatch();
                        doFinishMatch();
                        //moveToMain();
                    }
                    else {
                        /* matchedId = data;
                        console.log("matchedID: " + matchedId); */
                        doSaveMatch();
                        doFinishMatch();
                        //moveToMain();
                    }
                }else{}
            },
            error:function(data){//실패시 처리
                console.log("error:"+data);
            },
            complete:function(data){
                moveToMain();
            }
        });
    }
    
    function doSaveMatch(){
        console.log("----------------------------");
        console.log("-------doSaveMatch-------");
        console.log("----------------------------");
        
        $.ajax({
            type: "POST",
            url: "/ehr/match/doSaveMatch.do",
            async: true,
            dataType: "json",
            data: {
                id1: document.querySelector("#id").value,
                id2: matchedId
            }
        });
    }
    
    function doFinishMatch(){
        console.log("------------------------------");
        console.log("-------doFinishMatch-------");
        console.log("------------------------------");
        
        $.ajax({
            type: "POST",
            url: "/ehr/match/doFinishMatch.do",
            async: true,
            dataType: "json",
            data: {
                id: document.querySelector("#id").value
            }
        });
    }
    
    function moveToMain(){
        console.log("----------------------------");
        console.log("-------moveToMain-----------");
        console.log("----------------------------");
        
        window.location.href = "/ehr/user/moveToMain.do";
    }
    
    function doFindChatValue() {
        console.log("------------------------------------");
        console.log("-------doFindChatValue-----------");
        console.log("-------------------------------------");

        $.ajax({
            type: "GET",
            url: "/ehr/match/doFindChatValue.do",
            async: true,
            dataType: "json",
            data: {
                id: document.querySelector("#id").value
            }
        });
    }
    
    function doMatch() {
        console.log("----------------------------");
        console.log("-------doMatch-----------");
        console.log("----------------------------");

        return $.ajax({
            type: "GET",
            url: "/ehr/match/doMatch.do",
            async: true,
            dataType: "html",
            data: {
                tier: $("#tier").val(),
                chat: $("#chat").val(),
                act: $("#act").val(),
                click: 3,
                id: $("#id").val()
            },
            success:function(data){//통신 성공
                console.log("success data:"+data);
                if(data != ""){
                    matchedId = data;
                    return doFindValNickname();
                }else{
                    alert("매칭된 유저가 없습니다. 다시 시도해주세요.");
                }
            },
            error:function(data){//실패시 처리
                console.log("error:"+data);
            },
            complete:function(data){//성공/실패와 관계없이 수행!
                moveToMain();
            }
        });
    }
    
    function doCheckId() {
        console.log("----------------------------");
        console.log("-------doCheckId-----------");
        console.log("----------------------------");
        return $.ajax({
            type: "GET",
            url: "/ehr/user/doCheckId.do",
            async: true,
            dataType: "json",
            data: {
                id: document.querySelector("#id").value
            }
        });
    }

    function doCheckPassword() {
        console.log("----------------------------");
        console.log("-------doCheckPassword-----------");
        console.log("----------------------------");
        return $.ajax({
            type: "GET",
            url: "/ehr/user/doCheckPassword.do",
            async: true,
            dataType: "json",
            data: {
                pw: document.querySelector("#pw").value
            }
        });
    }

    function doUpdate() {
        console.log("----------------------------");
        console.log("----------doUpdate------------");
        console.log("----------------------------");

        // 중복 체크 수행
        doCheckId()
            .then(function (data) {
                console.log("Id: " + data);
                if (data == 0) {
                    alert("존재하지 않는 아이디입니다.");
                    return $.Deferred().reject("Invalid Id");
                } else {
                    return doCheckPassword();
                }
            })
            .then(function (data) {
                console.log("Password: " + data);
                if (data == 0) {
                    alert("비밀번호가 틀렸습니다.");
                    return $.Deferred().reject("Invalid Password");
                } else {
                    // doFindChatValue 호출 후 성공 시 doMatch 호출
                    // return doFindChatValue();
                }
            })
            .then(function (data) {
                console.log("doUpdate 로직을 실행합니다.");

                // 나머지 doUpdate 로직을 여기에 추가
                // ...

                if (eUtil.isEmpty($("#id").val()) || eUtil.isEmpty($("#pw").val()) || eUtil.isEmpty($("#tier").val())) {
                    alert('아이디, 비밀번호, 티어를 입력하세요.');
                    return $.Deferred().reject("Invalid Input");
                }

                // confirm
                if (!confirm("매칭 시작")) {
                    return $.Deferred().reject("User Cancel");
                }
                
                return $.ajax({
                    type: "POST",
                    url: "/ehr/user/doUpdate.do",
                    async: true,
                    dataType: "json", // 반환 데이터 타입을 json으로 설정
                    data: {
                        tier: document.querySelector("#tier").value,
                        chat: document.querySelector("#chat").value,
                        act: document.querySelector("#act").value,
                        click: 3,
                        id: document.querySelector("#id").value
                    }
                });
            })
            .done(function (data) {
                console.log("doMatch success data:" + data);
                return doMatch();
            })
            .fail(function (error) {
                console.log("doUpdate error:" + error);
                // 에러 처리 추가
            });
    }
</script>
</head>
<body class ="inner-box bg-game">
    <div class="title-box mb20">
            <div class="inner-box">
            </div>
        </div>  
        <div class="grid grid-cols-2 gap-4 mb-4 " name="userRegFrm">
            <div>
                <label for="username" class="m-text">아이디</label>
                <input type="text" id="id" class="p-input ppl_input shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" placeholder="아이디"
                size="20" maxlength="20">
            </div>
            <div>
                <label for="password" class="m-text">비밀번호</label>
                <input type="password" id="pw" class="p-input ppl_input shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" placeholder="비밀번호"
                size="20" maxlength="20">
            </div>
        </div>
        <div class="grid grid-cols-3 gap-4 mb20">
            <div>
                <label for="tier" class="m-text">티어</label>
                <select title="티어" id = "tier">
                    <option value="1">아이언</option>
                    <option value="2">브론즈</option>
                    <option value="3">실버</option>
                    <option value="4">골드</option>
                    <option value="5">플래티넘</option>
                    <option value="6">다이아몬드</option>
                    <option value="7">초월자</option>
                    <option value="8">불멸</option>
                    <option value="9">레디언트</option>
                </select>
            </div>
            <div>
                <label for="activity" class="m-text mb20">음성채팅</label>
                <select title="음성채팅" id = "chat">
                    <option value="1">사용</option>
                    <option value="2">미사용</option>
                </select>
            </div>
            <div>
                <label for="act" class="m-text">적극성</label>
                <select title="적극성" id="act">
                    <option value="1">적극적</option>
                    <option value="2">소극적</option>
                </select>
            </div>
        </div>
                
        <div class="mb40 tac">
            <input class="my-btn blue-white" id="doSave" type="button" value="매칭시작" onclick="window.doUpdate()"/> 
            <input class="my-btn red-white"  id="moveToList" type="button" value="돌아가기" onclick="closeTabClick()"/> 
        </div>
  
</body>
</html>