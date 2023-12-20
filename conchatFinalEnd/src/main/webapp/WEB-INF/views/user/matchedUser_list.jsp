<%@page import="com.pcwk.ehr.user.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
    UserVO dto = (UserVO)request.getAttribute("searchVO");

%>  
<!DOCTYPE html>
<html>
<head>
<style> 
    table, th, td {
      border:1px solid #ccc;
      border-collapse: collapse;
    }
  
    th, td {padding:10px 20px;}
    
    
    /* 정렬 */
    .txt-left{
        text-align: left;
    }
    
    .txt-center{
        text-align: center;
    }

    .txt-right{
        text-align: right;
    }
    
    
    .select {
        height: 30px;    
        vertical-align: middle;
        font-size: 12px;    
    }    
    .btn{
        height: 30px;    
        vertical-align: middle;
        font-size: 12px;
        background-color:skyblue;
        color:#ffffff;      
    }
    
    .input {
        height: 26.5px;
        vertical-align: middle;
        font-size: 12px;
    }
                
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/ehr/resources/js/jquery-3.7.1.js"></script>
<script src="/ehr/resources/js/eUtil.js"></script>

</head>
<body>
  <h2>매칭된 유저 정보</h2>
  <hr/>
    
   <div>
    <!-- table -->
    <table id="userTable">
        <thead>
        <tr>
            <th>아이디</th>
            <th>음성채팅 여부</th>
            <th>적극성</th>
            <th>티어</th>
            <th>팝스코어</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="vo" items="${list}">
            <tr>
                <td class="txt-left">${vo.id }</td> 
                <td class="txt-center">${vo.chat }</td>         
                <td class="txt-center">${vo.act }</td>
                <td class="txt-center">${vo.tier }</td>
                <td class="txt-center">${vo.pop_scr }</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <!--// table -------------------------------------------------------------->
   </div>
 <script type="text/javascript">
    
   //jquery:table 데이터 선택     
   $("#userTable>tbody").on("click","tr" , function(e){
       console.log('----------------------------');
       console.log('userTable>tbody');
       console.log('----------------------------');    
       
       let tdArray = $(this).children();//td
       
       let userId = tdArray.eq(1).text();
       console.log('userId:'+userId);
       
       window.location.href ="/ehr/user/doSelectOne.do?userId="+userId;
       
   });
</script>  
</body>
</html>