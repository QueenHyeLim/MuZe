<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        .modal-content{
        	width: 300%;
        }
        .modal-dialog {
		    margin-left: 600px;
		    margin-top: 100px;
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
                    <!--
                    <label for="userGrade"> &nbsp; userGrade : </label>
                    <input type="text" class="form-control" id="userGrade" value="${ sessionScope.loginUser.userGrade }" name="userGrade" readonly> <br>
                     -->
                </div>
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">탈퇴하기</button>
                </div>
		    </form>
		</div>
	</div>
	
	<!-- 회원탈퇴 버튼 클릭 시 보여질 Modal -->
    <div class="modal fade" id="deleteForm">
        <div class="modal-dialog modal-sm">
            <div class="modal-content" align="center">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">정말로 계정을 삭제하시겠습니까?</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <form action="delete.me" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div align="center">
                            회원 탈퇴 처리 후에는 회원님의 개인정보를 복구할 수 없습니다. <br>
                            정말로 탈퇴 하시겠습니까? <br>
                        </div>
                        <br>
                            <label for="userPwd" class="mr-sm-2">Password : </label>
                            <input type="text" class="form-control mb-2 mr-sm-2" placeholder="탈퇴하시려면 비밀번호를 입력해주세요." id="userPwd" name="userPwd"> <br>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">탈퇴하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>