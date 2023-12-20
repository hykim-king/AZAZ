<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<link type="text/css" rel="stylesheet" href="../resources/css/user_infoselect.css" />
<link type="text/css" rel="stylesheet" href="../resources/css/reset.css" />
<title>CONCHAT</title>
<script type="text/javascript">
function closeTabClick() {
    window.close();
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
                        <h1 class="sub-section-title">계정 관리</h1>
                    </div>

                    <!-- 정보 수정 -->
                    <div id="btn-box">
                        <div class="btn-box  mb15">
                            <input class="my-btn blue-white" type="button" value=" 비밀변호 변경"      id = "singUp" onclick = "moveToChangePw()"/>
                            <input class="my-btn red-white" type="button" value="  회원탈퇴" id = "singUp" onclick = "moveToWithdraw()"/>
                        </div>
                        <div class="btn-box  mb15">
                            <input class="my-btn blue-white" type="button" value="  롤 닉네임 수정  "     id = "singUp" onclick = "moveToChangeLol();"/>
                            <input class="my-btn blue-white" type="button" value=" 롤토체스 닉네임 수정"     id = "singUp" onclick = "moveToChangeLolche();" />
                        </div>
                        <div class="btn-box  mb15">
                        <input class="my-btn blue-white" type="button" value=" 발로란트 닉네임 수정"      id = "singUp" onclick = "moveToChangeVal();"/>
                            <input class="my-btn red-white" type="button" value="       돌아가기       "  id = "singUp" onclick = "closeTabClick()"/>
                        </div>
                    </div>
                        
                </div>
            </div>      
        </div>
    </div>
    
<script type = "text/javascript">

    
    
    function moveToChangeVal(){
        console.log('----------------------------');
        console.log('moveToChangeVal');
        console.log('----------------------------');  
        
        // 적절한 방법으로 폼을 가져와야 합니다. 여기서는 document에 직접 접근합니다.
        let frm = document.createElement("form");
        frm.method = "GET"; // 또는 "GET", 필요에 따라 변경할 수 있습니다.
        frm.action = "/ehr/account/moveToChangeVal.do";
    
        document.body.appendChild(frm);
        frm.submit();
    }
    
    function moveToChangeLolche(){
        console.log('----------------------------');
        console.log('moveToChangeLolche');
        console.log('----------------------------');  
        
        // 적절한 방법으로 폼을 가져와야 합니다. 여기서는 document에 직접 접근합니다.
        let frm = document.createElement("form");
        frm.method = "GET"; // 또는 "GET", 필요에 따라 변경할 수 있습니다.
        frm.action = "/ehr/account/moveToChangeLolche.do";
    
        document.body.appendChild(frm);
        frm.submit();
    }
    
    function moveToChangeLol(){
        console.log('----------------------------');
        console.log('moveToChangeLol');
        console.log('----------------------------');  
        
        // 적절한 방법으로 폼을 가져와야 합니다. 여기서는 document에 직접 접근합니다.
        let frm = document.createElement("form");
        frm.method = "GET"; // 또는 "GET", 필요에 따라 변경할 수 있습니다.
        frm.action = "/ehr/account/moveToChangeLol.do";
    
        document.body.appendChild(frm);
        frm.submit();
    }

    function moveToChangePw(){
        console.log('----------------------------');
        console.log('changePw');
        console.log('----------------------------');  
        
        // 적절한 방법으로 폼을 가져와야 합니다. 여기서는 document에 직접 접근합니다.
        let frm = document.createElement("form");
        frm.method = "GET"; // 또는 "GET", 필요에 따라 변경할 수 있습니다.
        frm.action = "/ehr/account/moveToChangePw.do";

        document.body.appendChild(frm);
        frm.submit();
    }
    
    function moveToWithdraw(){
        console.log('----------------------------');
        console.log('withdraw');
        console.log('----------------------------');  
        
        // 적절한 방법으로 폼을 가져와야 합니다. 여기서는 document에 직접 접근합니다.
        let frm = document.createElement("form");
        frm.method = "GET"; // 또는 "GET", 필요에 따라 변경할 수 있습니다.
        frm.action = "/ehr/account/moveToWithdraw.do";

        document.body.appendChild(frm);
        frm.submit();
    }
    
    function moveToMain(){
        console.log("----------------------------");
        console.log("-------moveToMain-----------");
        console.log("----------------------------");
        
        window.location.href = "/ehr/user/moveToMain.do";
    }
</script>
</html>