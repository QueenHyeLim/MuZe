<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY MUZE CHATBOT MUZEBOT</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
	#chatbox {
	    height: 300px;
	    border: 1px solid #ccc;
	    overflow-y: scroll;
	    padding: 10px;
	}
	.chatbot-header{
	    height : 100px;
	    width : 1302px;
	}
	
	#muze-chatbot{
	    font-size: 50px;
	    padding: 10px;
	    text-align: center;
	    vertical-align: 20px;
	    color : #fff;
	}
	img{
	    height : 100px;
	}
	
	#userInput {
	    width: 80%;
	    padding: 5px;
	}
	
	#sendButton {
	    padding: 5px;
	}
	
	#chatlog{
		color : #fff;
	}
</style>
</head>
<body>
<jsp:include page="../common/navibar.jsp" />
	<div class="page" id="content">
	<div id="blank-area"></div>
	 	<div class="page" id="d">
	 		<div class="chat-heaer"><img src="https://cdn2.iconfinder.com/data/icons/artificial-intelligence-173/128/chatbot-AI-chat_bubble-chat-robotics-robot-communication-256.png" alt="마이뮤즈챗봇"><span id="muze-chatbot">MY MUZE 챗봇</span></div>
    	<div id="chatbox">
        	<div id="chatlog"></div>
   		</div>

	    <div>
	        <input type="text" id="userInput" placeholder="메시지를 입력하세요..." required>
	        <button id="sendButton">전송</button>
	    </div>
	 	
	 	
	 	</div>
	</div>
	
	
	<script>
	 $(() => {
        $('#sendButton').on('click', function() {
            var userMessage = $('#userInput').val();
            appendToChatLog('사용자: ' + userMessage);
			
            // 사용자 입력값이 비어 있는 경우
            if (!userMessage.trim()) {
               	// 기본 응답 사용
                appendToChatLog('챗봇: 죄송합니다. 정보가 없습니다. 추천 키워드: 안녕, muze, 취소, 티켓');
                // 입력 필드를 비우고 placeholder를 표시
                $('#userInput').val('').attr('placeholder', '메시지를 입력하세요...');
                return; 				// 빈 입력값이므로 더 이상 진행하지 않음
            }
            
            // Ajax를 사용하여 서버로 메시지 전송
            $.ajax({
                url: 'message.ch',
                type: 'POST',
                data: { userMessage: userMessage },
                success: function(data) {
                	// 서버에서 받은 응답을 채팅 로그에 추가
                    if (data !== null) {
                        appendToChatLog('챗봇: ' + data.responseCon);
                    }
                    else {
                    	// 서버 응답이 null인 경우 기본 응답 사용
                        appendToChatLog('챗봇: 죄송합니다. 정보가 없습니다. 추천 키워드: 안녕, muze, 취소, 티켓');
                    }
                	// 입력 필드를 비우고 placeholder를 표시
                    $('#userInput').val('').attr('placeholder', '메시지를 입력하세요...');
                },
                error: function() {
                    console.log('챗봇 응답 실패');
                }
            });
        });
    });

    function appendToChatLog(message) {
        $('#chatlog').append('<p>' + message + '</p>');
    }
	</script>
	
</body>
</html>