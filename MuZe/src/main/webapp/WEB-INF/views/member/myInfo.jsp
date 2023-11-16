<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        .content {
            width:80%; 
            margin:auto;
        }
        .innerOuter {
            width:80%;
            margin-top:50px;
            padding:5% 10%;
            background-color:white;
        }
        div a {
  	  		text-decoration: none;
  	  		background-color:red;
		    color: white;
		    text-align: center;
  		}
  		div a:hover {
  			text-decoration: none;
  	  		background-color:red;
		    color: white;
		    text-align: center;
  		}
    </style>
</head>
<body>
	<jsp:include page="../member/myPage.jsp"/>
	
	<div class="content">
        <br><br>
        <div class="innerOuter">
            <h2 align="center">회원 정보</h2>
            <br>

            <form action="update.me" method="post">
                <div class="form-group">
                    <label for="userId">* ID : </label>
                    <input type="text" class="form-control" id="userId" value="${ sessionScope.loginUser.userId }" name="userId" readonly> <br>

                    <label for="userName">* Name : </label>
                    <input type="text" class="form-control" id="userName" value="${ sessionScope.loginUser.userName }" name="userName" required> <br>

                    <label for="phone"> &nbsp; Phone : </label>
                    <input type="tel" class="form-control" id="phone" value="${ sessionScope.loginUser.phone }" name="phone"> <br>
                    
                    <label for="email"> &nbsp; Email : </label>
                    <input type="text" class="form-control" id="email" value="${ sessionScope.loginUser.email }" name="email"> <br>

                    
                </div>
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <a href="delete.me">탈퇴하기</a>
                </div>
		    </form>
		</div>
	</div>
</body>
</html>