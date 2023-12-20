<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/ehr/resources/favicon.ico">
<meta charset = "UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="/ehr/resources/css/font.css">
<link rel="stylesheet" href="/ehr/resources/css/style.css">
<style>
</style>
<script language="javascript">
            let myWindow;
            
            function openInfoPopup() {
                var width = 750;
                var height = 750;
                var left = (window.innerWidth - width) / 2;
                var top = (window.innerHeight - height) / 2;
                myWindow = window.open('../account/moveToAccount_setup.do', '_blank', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top + ', scrollbars=no');
            }
            
            function openRegPopup() {
                var width = 750;
                var height = 1200;
                var left = (window.innerWidth - width) / 2;
                var top = (window.innerHeight - height) / 2;
                myWindow = window.open('moveToReg.do', '_blank', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top + ', scrollbars=no');
            }
            function moveToLolPopup() {
                var width = 750;
                var height = 750;
                var left = (window.innerWidth - width) / 2;
                var top = (window.innerHeight - height) / 2;
                myWindow = window.open('../match/moveToLol_match.do', '_blank', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top + ', scrollbars=no');
            }
            function moveToLolchePopup() {
                var width = 750;
                var height = 750;
                var left = (window.innerWidth - width) / 2;
                var top = (window.innerHeight - height) / 2;
                myWindow =  window.open('../match/moveToLolche_match.do', '_blank', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top + ', scrollbars=no');
            }
            function moveToValPopup() {
                var width = 750;
                var height = 750;
                var left = (window.innerWidth - width) / 2;
                var top = (window.innerHeight - height) / 2;
                myWindow =  window.open('../match/moveToVal_match.do', '_blank', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top + ', scrollbars=no');
            }
</script>
<title>CONCHAT</title>
</head>
<body>
    <header>
            <nav>
                <div id="logo">
                    <a link href=""><img src="/ehr/resources/img/header/title.png" alt=""/></a>
                </div>
                <div id="icon">
                    <div id="info_b"><a href="#" onclick="openInfoPopup(); return false;">
                        <img src="/ehr/resources/img/header/info_off.png" alt="" class="img_a">
                        <img src="/ehr/resources/img/header/info_on.png" alt="" class="img_b">
                    </a></div>
                    <div id="reg_b"><a href="#" onclick="openRegPopup(); return false;">
                        <img src="/ehr/resources/img/header/reg_off.png" alt="" class="img_a">
                        <img src="/ehr/resources/img/header/reg_on.png" alt="" class="img_b">
                    </a></div>
                    <div id="login_b"><a href="#" onclick="openLoginPopup(); return false;">
                        <img src="/ehr/resources/img/header/login_off.png" alt="" class="img_a">
                        <img src="/ehr/resources/img/header/login_on.png" alt="" class="img_b">
                    </a></div>
                    
                </div>
            </nav>
        </header>
        <main>
            <section>
                <div id="sec_1_text">
                    <video id="video_Position" oncontextmenu="return false;" width="1920px" height="1080px" autoplay loop muted>
                        <source src="/ehr/resources/main.MOV">
                    </video>
                    <div id="back_bg"></div>
                    <div>
                        <img src="/ehr/resources/img/main_text.png" alt="main ment"/>
                        <p>일상을 떠나 새로운 친구들이 여기 있습니다! <br/>CONCHAT에서 친구를 찾아보세요!</p>
                    </div>
                 </div>
            </section>
        </main>
        <div id="con_1">
            <h2>게임친구는 CONCHAT에서</h2>
            <div id="con_1_main">
                <div id="con_1_1" onclick = "moveToLolPopup(); return false;">
                    <div class="con_1_b"></div>
                    <div class="con_1_f"><a link href="#"  >

                    </a></div>
                    <p>리그오브레전드</p>
                </div>
                <div id="con_1_2" onclick = "moveToLolchePopup(); return false;">
                    <div class="con_1_b"></div>
                    <div class="con_1_f"><a link href="">

                    </a></div>
                    <p>전략적팀전투</p>
                </div>
                <div id="con_1_3" onclick = "moveToValPopup(); return false;">
                    <div class="con_1_b"></div>
                    <div class="con_1_f"><a link href="">

                    </a></div>
                    <p>발로란트</p>
                </div>
            </div>
            <div id="con_1_bottom">
                <h2>시간은 내편이야! </br> 게임 클릭하면 매칭</h2>
                <div><img src="/ehr/resources/img/conmain/con1.png"></div>
            </div>
        </div>
        <div id="con_2">
            <div id="con_2_container">
                <div id="con_2_img">
                    <img src="/ehr/resources/img/conmain/con2.png">
                </div>
                <div id="con_2_t">
                    <h2>저희 매칭 시스템을 </br>소개합니다</h2>
                    <p>설문조사를 통한 자기와 가장 비슷한</br> 유저를 매칭해드립니다</br>
                        재미없게 혼자 게임하다 질린다구요?</br> 저희 CONCHAT과 함께라면</br>
                        게임친구도 만들고 티어도 올리고 일석이조!</br> 매칭 LES's GO!</p>
                </div>
            </div>
        </div>
        <div id="con_3">
            <div id="con_3_container">
                <div id="con_3_img">
                    <img src="/ehr/resources/img/conmain/con3.png">
                </div>
                <div id="con_3_t">
                    <h2>콘쳇의 팝콘점수를</br>활용하세요</h2>
                    <p>게임이 끝난 후 유저를 평가해주세요!</br>
                        여러분들이 남긴 평점을 통해 </br>
                        클린한 게임 환경이 만들어 집니다!</p>
                    <div id="pop_img1">
                        <div id="pop_profile"><img src="/ehr/resources/img/con_4/con_4_3.jpg"/></div>
                        <div id="pop_heart"><img src="/ehr/resources/img/con_4/hearthstone.png"/></div>
                        <div id="popcon"><img src="/ehr/resources/img/con_4/pop.png"/></div>
                        <div id="popcon_p"><h4>99.9</h4></div>
                    </div>
                    <div id="pop_img2">
                        <div id="pop_profile"><img src="/ehr/resources/img/con_4/con_4_2.jpg"/></div>
                        <div id="pop_heart"><img src="/ehr/resources/img/con_4/hearthstone.png"/></div>
                        <div id="popcon"><img src="/ehr/resources/img/con_4/pop.png"/></div>
                        <div id="popcon_p"><h4>99.9</h4></div>
                    </div>
                </div>
            </div>
        </div>
</body>
<script type = "text/javascript">

    function moveToReg(){
        console.log('----------------------------');
        console.log('moveToReg');
        console.log('----------------------------');  
        
        // 적절한 방법으로 폼을 가져와야 합니다. 여기서는 document에 직접 접근합니다.
        let frm = document.createElement("form");
        frm.method = "GET"; // 또는 "GET", 필요에 따라 변경할 수 있습니다.
        frm.action = "/ehr/user/moveToReg.do";

        document.body.appendChild(frm);
        frm.submit();
    }
    
    function moveToLol_match(){
        console.log('----------------------------');
        console.log('moveToLol_match');
        console.log('----------------------------');  
        
        // 적절한 방법으로 폼을 가져와야 합니다. 여기서는 document에 직접 접근합니다.
        let frm = document.createElement("form");
        frm.method = "GET"; // 또는 "GET", 필요에 따라 변경할 수 있습니다.
        frm.action = "/ehr/match/moveToLol_match.do";

        document.body.appendChild(frm);
        frm.submit();
    }
    
    function moveToLolche_match(){
        console.log('----------------------------');
        console.log('moveToLolche_match');
        console.log('----------------------------');  
        
        // 적절한 방법으로 폼을 가져와야 합니다. 여기서는 document에 직접 접근합니다.
        let frm = document.createElement("form");
        frm.method = "GET"; // 또는 "GET", 필요에 따라 변경할 수 있습니다.
        frm.action = "/ehr/match/moveToLolche_match.do";

        document.body.appendChild(frm);
        frm.submit();
    }
    
    function moveToVal_match(){
        console.log('----------------------------');
        console.log('moveToVal_match');
        console.log('----------------------------');  
        
        // 적절한 방법으로 폼을 가져와야 합니다. 여기서는 document에 직접 접근합니다.
        let frm = document.createElement("form");
        frm.method = "GET"; // 또는 "GET", 필요에 따라 변경할 수 있습니다.
        frm.action = "/ehr/match/moveToVal_match.do";

        document.body.appendChild(frm);
        frm.submit();
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
</html>