<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	#login-form input{margin : 5px;}
	
</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>

	<div class="outer">
	<br><br><br><br><br>
	<h2 align="center"> 로그인 </h2>
	<form id = "login-form" action="/loginPage.me" method="post">
	
		<table align="center">
			<tr>
				<td><input type="text" name="memberId" placeholder="아이디" required></td>
			</tr>
			<tr>
				<td><input type="password" name="memberPwd" placeholder="비밀번호" required></td>
				<td></td>
			</tr>
		</table>
		<br><br>
		<div align="center">
		<button type="submit" class="btn btn-outline-dark">로그인</button>
		&nbsp;/&nbsp;
		<button type="button" class="btn btn-outline-warning" onclick="findid();" >아이디찾기</button>
		&nbsp;/&nbsp;
		<button type="button" class="btn btn-outline-warning" onclick="findpwd();" >비밀번호찾기</button>
		</div>
		
	</form>
	<script>
	 function findid(){
         location.href = "/findid.mem"
      }
	 function findpwd(){
         location.href = "/findpwd.mem"
      }
	</script>
	</div>
	
	

</body>
</html>