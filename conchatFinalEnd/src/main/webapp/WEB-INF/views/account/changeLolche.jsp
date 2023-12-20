<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">                                       
<link type="text/css" rel="stylesheet" href="../resources/css/edit.css" />
<link type="text/css" rel="stylesheet" href="../resources/css/reset.css" />
<style>
   
</style>
<title>changeTft</title>
<script src="/ehr/resources/js/jquery-3.7.1.js"></script>
<script src="/ehr/resources/js/eUtill.js"></script>
<script >

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

    function changeLolche(){
        console.log('----------------------------');
        console.log('changeLolche');
        console.log('----------------------------');
        
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
            console.log("changePw 로직을 실행합니다.");

            if (eUtil.isEmpty($("#id").val())) {
                alert('아이디를 입력하세요.');
                return $.Deferred().reject("Invalid Input");
            }
            
            if (eUtil.isEmpty($("#pw").val())) {
                alert('현재 비밀번호를 입력하세요.');
                return $.Deferred().reject("Invalid Input");
            }
            
            if (eUtil.isEmpty($("#lolchenick").val())) {
                alert('변경할 닉네임을 입력하세요.');
                return $.Deferred().reject("Invalid Input");
            }

            // confirm
            if (!confirm("변경 하시겠습니까?")) {
                return $.Deferred().reject("User Cancel");
            }
            
            return $.ajax({
                type: "POST",
                url: "/ehr/account/changeLolche.do",
                async: true,
                dataType: "json", // 반환 데이터 타입을 json으로 설정
                data: {
                    lolchenick: document.querySelector("#lolchenick").value,
                    id: document.querySelector("#id").value
                }
            });
        })
        .done(function (data) {
            console.log("doMatch success data:" + data);
            if (!confirm("정상적으로 변경 되었습니다.")) {
                moveToMain();
            }
            else moveToMain();
        })
        .fail(function (error) {
            console.log("doUpdate error:" + error);
            // 에러 처리 추가
        });
    }
    
    function moveToMain(){
        console.log("----------------------------");
        console.log("-------moveToMain-----------");
        console.log("----------------------------");
        
        window.location.href = "/ehr/user/moveToMain.do";
    }
    
    function moveToAccount_setup(){
        console.log('----------------------------');
        console.log('moveToAccount_setup');
        console.log('----------------------------'); 
        
        let frm = document.createElement("form");
        frm.method = "GET"; // 또는 "GET", 필요에 따라 변경할 수 있습니다.
        frm.action = "/ehr/account/moveToAccount_setup.do";

        document.body.appendChild(frm);
        frm.submit();
    }
    
    
</script>
</head>
<body class="body-bgcolor-set">
    <div class="pw-edit">
            
            <div class="inner-box">
                <div class="contents-box">
                    <!-- 마이 페이지 메뉴 -->


                    <div class="line-bottom"></div>
                    <div class="line-bottom">
                        <h1 class="sub-section-title">롤토체스 닉네임 수정</h1>
                    </div>

                    <!-- 정보 수정 -->
                    <div class="table-indent ">
                        <form class="pw-edit-form ">
                            <table>
                                <tr>
                                    <th>닉네임</th>
                                    <td>
                                        <input type="text" placeholder="아이디를 입력하세요" title="id"
                                        name="id" id="id">
                                    </td>
                                </tr>
                                <tr>
                                    <th>비밀번호</th>
                                    <td>
                                        <input type="text" placeholder="비밀번호를 입력하세요" title="pw"
                                        name="pw" id="pw">
                                    </td>
                                </tr>
                                <tr>
                                    <th>변경할 닉네임</th>
                                    <td>
                                        <input type="text"   placeholder="변경할 닉네임을 입력하세요" title="lolchenick"
                                        name="lolchenick" id="lolchenick">
                                    </td>
                                </tr>                               
                                <tr>
                                    <td colspan="3" class="tac">
                                        <input class="my-btn blue-white mb20" type="button" value="변경하기" id="doSave"     onclick="window.changeLolche()">                                               
                                        <input class="my-btn red-white mb20" type="button" value="돌아가기"  id="moveToAccount_setup" onclick="window.moveToAccount_setup()">                                            
                                    </td>
                                </tr>
                            </table>    
                        </form>
                    </div>  
                </div>
            </div>      
        </div>
    </div>

</body>
</html>