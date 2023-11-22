<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>

	<style>
        .content {
            width:70%; 
            margin:auto;
            color:black;
        }
        .innerOuter {
            
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
        .input-group input,
    	.input-group button {
        margin-right: 20px;
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
                    <div class="input-group">							
                    <input type="text" class="form-control" id="userId" placeholder="아이디" name="userId" required>
                    <button type="button" id="idCheck">중복 체크</button>
	                </div>
	                
                    <div id="checkResult" style="font-size:1em; display:none;"></div> <br>

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
    
    <script>
    	$(function (){
    		
    		const $idInput = $(".form-group #userId");
    		const $checkResult = $('#checkResult');
    		const $enrollFormSubmit = $('#enroll-form :submit');
    		const $idCheckButton = $('#idCheck');
    		
    			$idCheckButton.click(function () {
					const userIdValue = $idInput.val();
	                
	                if (!userIdValue) {
	                	$checkResult.show().css('color', 'red').text('아이디를 입력해주세요');
						$enrollFormSubmit.attr('disabled', true);
	                    return; 
	                }
	                
	                if (userIdValue.length < 5) {
	                	$checkResult.show().css('color', 'red').text('아이디를 5글자 이상 입력해주세요.');
						$enrollFormSubmit.attr('disabled', true);
	                	return;
	                }
	                
	                const regex = /^[a-zA-Z0-9]+$/;
	                if (!regex.test(userIdValue)) {
	                    $checkResult.show().css('color', 'red').text('영어와 숫자만 입력 가능합니다.');
	                    $enrollFormSubmit.attr('disabled', true);
	                    return;
	                }
    			
				if($idInput.val().length >= 5) {
					
					$.ajax({
						url : 'idCheck.me',
						data : {checkId : $idInput.val()},
						success : function(result){
							
							
							if(result.substr(4) === 'N'){ 
								$checkResult.show().css('color', 'red').text('중복된 아이디가 존재합니다. 다시 입력해 주세요.');
								$enrollFormSubmit.attr('disabled', true);
							}
							
							else { 
								$checkResult.show().css('color', 'lightgreen').text('사용 가능한 아이디 입니다.');
								$enrollFormSubmit.removeAttr('disabled');
							}
							
						},
						error : function(){
							console.log('아이디 중복체크 AJAX통신 실패~ ');
						}
					});
					
					
				}
				else {
					$checkResult.hide();
					$enrollFormSubmit.attr('disabled', true);
				}
    		});
    	});
    	
    
    </script>

</body>
</html>