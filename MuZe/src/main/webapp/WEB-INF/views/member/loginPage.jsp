<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	#login-form input{
		margin : 5px;
		width:400px;
		height:50px;
	}
	.signIn_btn{
		width:400px;
		height:50px;
		background-color:skyblue;
		color:white;
		border: 1px solid skyblue;
	}
	
	
</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>
	<br><br><br><br><br>
	<div class="outer">
	<br><br><br><br><br>
	<h2 align="center"> 로그인 </h2>
	<form id = "login-form" action="login.me" method="post">
	
		<table align="center">
			<tr>
				<td><input type="text" id="userId" name="userId" placeholder="아이디" required></td>
			</tr>
			<tr>
				<td><input type="password" id="userPwd"  name="userPwd" placeholder="비밀번호" required></td>
			</tr>
		</table>
		<br><br>
		<div align="center">
		<button class ="signIn_btn" type="submit">로그인</button>
		</div>
		<br>
		<div align="center">
		<a href="enrollForm.me">회원가입</a>
		</div>
		
	</form>
	
	</div>
	

</body>
</html>