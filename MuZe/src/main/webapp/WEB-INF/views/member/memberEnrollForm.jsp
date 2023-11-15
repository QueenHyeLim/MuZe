<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>

	<style>
        .content {
            width:80%; 
            margin:auto;
        }
        .innerOuter {
            
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
    </style>
	
</head>
<body>

	<jsp:include page="../common/navibar.jsp"/>
	<br><br><br><br><br><br><br>
	<div class="content">
        <br><br>
        <div class="innerOuter">
            <h2 align="center">회원가입</h2>
            <br>

            <form action="insert.me" method="post" id="enroll-form">
                <div class="form-group">
                    <label for="userId">* 아이디</label>							
                    <input type="text" class="form-control" id="userId" placeholder="아이디" name="userId" required> <br>
                    <div id="checkResult" style="font-size:0.7em; display:none;"></div>

                    <label for="userPwd">* 비밀번호</label>
                    <input type="password" class="form-control" id="userPwd" placeholder="비밀번호" name="userPwd" required> <br>

                    <label for="userName">* 이름</label>
                    <input type="text" class="form-control" id="userName" placeholder="이름" name="userName" required> <br>

                    <label for="email"> &nbsp; 이메일</label>
                    <input type="text" class="form-control" id="email" placeholder="이메일" name="email"> <br>

                    <label for="phone"> &nbsp; 전화번호</label>
                    <input type="tel" class="form-control" id="phone" placeholder="전화번호" name="phone"> <br>
                    
                </div> 
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="disabled btn btn-primary">회원가입</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>

</body>
</html>