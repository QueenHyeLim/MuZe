<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diary.jsp</title>

<style>
   /*------------ DIARY 영역 --------------*/
    #diary-area{
        width: 100%;
        height:1380px;
        border-radius: 17cqmin;
        background-color: rgba(128, 128, 128, 0.506);
        border : 1px solid rgb(152, 29, 38);
    }
    #diaryName{	
        text-align: center;
        margin-top: 80px;
        color : #fff;
    }
    #diaryName:hover{
        cursor: pointer;
        color:rgb(152, 29, 38);
    }
    .diary-body{
        width: 100%;
    }
    #diary-header{
    	width:100%;
    	height:100px;
    }
    #modal-content{
        margin: auto;
        text-align: center;
    }
    #diaryContent{
        width: 100%;
        height: 400px;
        resize: none;
    } 
    .modal-title{
    	margin-top:20px;
    }
    #diaryName-input{
    	width:100%;
    }
	.modal-content{
		color : black;
	}
	/*------ slider toggle area --------*/
	/* The switch - the box around the slider */
	.switch {
	  position: relative;
	  display: inline-block;
	  width: 50px;
	  height: 30px;
	}
	.slider {
	  position: absolute;
	  cursor: pointer;
	  top: 0;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  background-color: #ccc;
	  -webkit-transition: .4s;
	  transition: .4s;
	}
	
	.slider:before {
	  position: absolute;
	  content: "";
	  height: 20px;
	  width: 20px;
	  left: 4px;
	  bottom: 4px;
	  background-color: white;
	  -webkit-transition: .4s;
	  transition: .4s;
	}
	
	input:checked + .slider {
	  background-color: #2196F3;
	}
	
	input:focus + .slider {
	  box-shadow: 0 0 1px #2196F3;
	}
	
	input:checked + .slider:before {
	  -webkit-transform: translateX(26px);
	  -ms-transform: translateX(26px);
	  transform: translateX(26px);
	}
	.slider.round {
	  border-radius: 20px;
	}
	
	.slider.round:before {
	  border-radius: 50%;
	}
	.event-image {
	  width : 100px;
	  height : 100px;
	  display: block;
	  margin : auto;
	}
	.diaryImage-area{
		width : 100%;
		height : 400px;
	}
	#diaryImg{
		background-size: cover;	
		width : 100%;
		height : 100%;
	}
	#schedule-input{
		width : 100%;
		margin-top : 20px;
	}
	.td-area-size{
		widht : 100px;
		height : 100px;
	}
	#btn-area{
		text-align : center;
	}
	#updateBtn-area{
		width : 50%;
		display :inline-block;
		float : right;
		
	}
	#deleteBtn-area{
		width :50%;
		display :inline-block;
	}
	#updateDiary{
		width : 100%;
	}
	#deleteDiary{
		width : 100%;
	}
	#updateImage-area{
		width : 200px;
		height : 200px;
		border : 1px solid black;
		margin-right : 40px;
	}
	#updateformImg{
		width : 100%;
		height : 100%;
		background-size : contain;
	}
	#updateformContent{
		width : 100%;
		height : 300px;
		resize : none;
	}
</style>
</head>
<body>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<jsp:include page="../common/navibar.jsp"/>
<c:if test="${not empty sessionScope.loginUser}">
<script>
    // div날짜를 클릭했을떄 해당 날짜의 값을 뽑는 함수(insert하기 위해)
    document.addEventListener('DOMContentLoaded', function() {
        var today = new Date(); // 현재 날짜
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	  initialView: 'dayGridMonth',
        	  headerToolbar: {
        	    left: 'prev,next today',
        	    center: 'title',
        	    right: 'dayGridMonth,listWeek'
        	  },
            timeZone: 'GMT+9',
            dragScroll : true,
            navLinks: false, 
            editable: false,
            selectable: true,
    		// 화면에 들어왔을떄 보여질수 있게 select diary 
            events: [
            	<c:forEach var="di" items="${diaryList}">
            	{
            		id : '${di.diaryNo}',
            		title : '${di.diaryTitle}',
            		start : '${di.diaryDate}',
            		end : '${di.diaryDate}',
            		//borderColor : 'rgb(152, 29, 38)',
            		backgroundColor : 'rgb(152, 29, 38)',
            		color : 'black',
		            extendedProps: {
	            		imageUrl : '${di.modifiedName}'
		            },
            	},
            	</c:forEach>
            	<c:forEach var="sc" items="${scheduleList}">
            	{
            		id : '${sc.scheduleNo}',
            		title : '${sc.scTime} [' + '${sc.scTitle} ]',
            		start : '${sc.scDate}',
            		end : '${sc.scDate}',
            		backgroundColor : 'green',
            		color : 'black',
            		groupId : '999'
            	},
            	</c:forEach>
            ],
          	eventContent: function (arg) {
          		var eventTitle = arg.event.title;
          		var result = '';
          		var html = '';
          		// 제목의 length가 긴 경우를 위해 잘라서 넣기
          		var htmlTag = '<b>' + arg.timeText + '</b class="eventTitle-area">';
          		if(eventTitle.length > 10){
       				html += htmlTag + eventTitle.slice(0, 8) + '...';
          		}
          		else{
          			html += htmlTag + eventTitle;
          		}
	            if (arg.event.extendedProps.imageUrl) {
	              html += '<img src="' + arg.event.extendedProps.imageUrl + '" class="event-image" />';
	            }
            return { html: html };
          },
            // 클릭한 해당 날짜의 값을 뽑아주는 이벤트 
            dateClick: function(date) {
            	console.log("date : " ,date);
                $('#diaryDate').val(date.dateStr);
                Swal.fire({
              	  title: date.dateStr + "날에 작성할 <br> 다이어리 / 일정 중 고르시오.",
              	  showDenyButton: true,
              	  showCancelButton: true,
              	  color : 'black',
              	  background : 'rgba(152, 29, 37, 0.74)',
              	  confirmButtonText: "다이어리",
              	  confirmButtonColor : 'rgb(38, 59, 38)',
              	  denyButtonText: "일정",
                  denyButtonColor : 'rgb(38, 59, 38)'
              	}).then((result) => {
              	  if (result.isConfirmed) {
              		// result.isConfirmed : 다이어리를 작성할수 있는 모달창뜸
                        $('#myModal-form').modal('show');
              	  } else if (result.isDenied) {
              		// result.isDenied : 일정 작성 모달창 뜸
              		$('#schedule-modal').modal('show');
              	  	$('.schedule-modal-title').html(date.dateStr + ' DAY SCHEDULE');
              	  	$('#scDate').val(date.dateStr);
              	  }
              });
            },
            // 이벤트 클릭시 다이어리 내용을 볼수 있는 이벤트
            eventClick : function(info) {
            	// id가 999인건 일정 정보 아닌것은 다이어리
            	if(info.event.groupId != '999'){
	            	$('#modal-content').modal('show');
	            	$('#replyDiaryTitle').text(info.event.title);
	            	$('#updateformTitle').val(info.event.title);
	            	$('#deleteDiary').on('click', () => {
	            		location.href = 'deleteDiary.di?dNo=' + info.event.id;
	            	});
	            	$('#updateDiary').on('click', () => {
	            		$('#modal-content').modal('hide');
	            		$('#update-form').modal('show');
	            	});
	               	$.ajax({
	               		url : 'diaryDetail.di',
	               		type : 'POST',
	               		data : {
	               			diaryNo : info.event.id,
	               			diaryTitle : info.event.title
	               		},
	               		success : result => {
	               			// 응답 화면
	               			$('#replyDiaryDate').text(result.diaryDate);
	               			$('#replyDiaryContent').text(result.diaryContent);
	               			// 수정 화면
	               			$('#updateformContent').val(result.diaryContent);
	               			$('#updateDiaryNo').val(result.diaryNo);
	               			if(result.modifiedName != null){
	               				console.log("modifi : ", result.modifiedName);
	               				console.log("attNO : " , result.attNo)
	               				$('#diaryImg').attr('src', result.modifiedName);
	               				$('#updateformImg').attr('src', result.modifiedName);
	               				$('#modifiedName').val(result.modifiedName);
	               			}
	               			else{
	               				$('.diaryImage-area').hide();
	               				$('#updateImage-area').hide();
	               			}
	               		},
	               		error : () => {
	               			alert('실패');
	               		}
	            	});
            	}
               	else{
               		// 일정 detail modal 보여주기
               		$('#replySchedule-modal').modal('show');
           			$('#replySchedule-content').text(info.event.title);
           			$('#scDate-area').text(info.event.scDate);
           			// 삭제 버튼을 눌렀을때 loaction이동
           			$('#deleteScBtn').on('click' ,function(){
           				location.href = 'deleteSchedule.sc?sNo=' + info.event.id;
           			})
               	}
            }
        });
        calendar.render();
    });
    
    // diaryName을 클릭했을때 update diaryName (default : YOU ARE MY DIARY)
    function changeDiaryName(){
    	$('#modal-diaryName').modal('show');
    };
    
 	// 일정 버튼을 클릭했을 때 나오는 시간 값 뽑아내기
    $(()=>{
    	const $allDay = $('#allDay-checkbox'); // 하루종일  00:00 toggle
    	const $time = $('#schedule-time');     // 시간 달력 input="time"
    	const $timeCheck = $('#time-check');   // check my time(일정 시간 확인 버튼)
    	const $showTime = $('#show-time');     // 일정 시간 : (show time)
    	const $submit = $('#schedule-submit'); // 등록(submit)버튼
    	
    	
    	// 아무 값도 없을때 default값을 disabled true값으로 만들어 준다
    	$submit.prop('disabled',true);
    	$time.val('');
		$allDay.val('');
		
    	// check my time 일정 시간 확인 버튼
    	$timeCheck.on('click',()=>{
    		
    		$allDay.val('00:00'); // 클릭 시 allDay value값을 넣어줌
    		
    		if($allDay[0].checked == true && $time[0].value == ''){ 
    			// allDay가 check가 되어있으며 시간 달력에 값이 없으면 allDay의 value값을 알려줌
    			$showTime.text($allDay[0].value);
    			$submit.prop('disabled',false);
    		}
    		else if($allDay[0].checked == false && $time[0].value == ''){
    			// allDay가 check가 안되어있고 시간 달력에 값이 없으면 '일정 시간 을 입력해주세요'알림이 뜸
    			$showTime.text('일정 시간 을 입력해주세요');
    			$submit.prop('disabled',true);
    		}
    		else if($allDay[0].checked == true && $time[0].value != ''){
    			// allDay가 check되어있고 시간 달력에 값이 넣어져있을때 값이 초기화 되며 '일정 시간 을 하나만 넣어주세요'알림이 뜸
    			$showTime.text('일정 시간 을 하나만 넣어주세요');
    			$allDay.prop('checked', false);
    			$time.val('');
    			$allDay.val('');
    			$submit.prop('disabled',true);
    		}
    		else{
    			// 시간 달력에 값이 있으면 그 해당 일정 시간 value값을 알려줌
    			$showTime.text($time[0].value);
    			$submit.prop('disabled',false);
    			$('#hiddenTime').val($showTime[0].innerText);
    		}
    	});
    	
    	// 두가지의 time의 value가 있을때 submit button을 disabled
    	if($allDay[0].checked == true && $time[0].value != ''){
    		$submit.prop('disabled',true);
    	}
    	
    });
 	// 일정 값 뽑는 함수
 	function scheduelBtn(){
 		$('#hiddenTime').val($('#show-time')[0].innerText);
 	}
 	
 	// 캘린더 td사이즈 스크립트
 	$(() => {
 		$('tbody[role="rowgroup"] td').css({
 			'width' : '100px',
 			'height' : '100px'
 		});
 	});
 	
 	
	$(() => { // 파일 input script
	 	$("#diary-file").on('change',function(){
		  var fileName = $("#diary-file").val();
		  $(".upload-name").val(fileName);
		});
 	});
 	
 	function fileUploadClick(){
		$('#diary-file').click();
	}
</script>
<!--------------------------------------달력--------------------------------------------->
<div class="page" id="content">
    <div id="blank-area"></div>
    <div id="diary-area">
        <div style="height:120px;">
            <h3 id="diaryName" onclick="changeDiaryName();">${diaryName}</h3>
        </div>
        <div class="page">
            <div id="calendar"></div>
            <!-- Cloudflare Pages Analytics -->
            <script defer src='https://static.cloudflareinsights.com/beacon.min.js' data-cf-beacon='{"token": "dc4641f860664c6e824b093274f50291"}'></script>
            <!-- Cloudflare Pages Analytics -->
        </div>
    </div>
</div> 
   
<!-------------------------------다이어리 네임 작성 모달창------------------------------------>
<!-- The Modal -->
<form action="name.di" method="get">
   <div class="modal fade" id="modal-diaryName">
       <div class="modal-dialog modal-dialog-centered">
       <div class="modal-content">
       	<input id="hiddenUserNo" type="hidden" name="userNo" value="${sessionScope.loginUser.userNo}"/>
           <!-- Modal Header -->
           <div class="modal-header" id="diary-header">
           <h4 class="modal-title" style="color:black">CHANGE YOUR DIARY NAME</h4>
           <button type="button" class="close" data-dismiss="modal">&times;</button>
           </div>
           <!-- Modal body -->
           <div class="modal-body">
           <input id="diaryName-input" type="text" name="diaryName" placeholder="나만의 다이어리 네임을 만들어주세요" required>
           </div>
           
           <!-- Modal footer -->
           <div class="modal-footer">
           <button type="submit" class="btn btn-secondary">change</button>
           </div>
       </div>
       </div>
   </div>
</form>
   
<!-------------------------------다이어리 작성을 위한 모달창------------------------------------>
<form action="insert.di" method="post" enctype="multipart/form-data">
    <div class="modal fade" id="myModal-form">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
            <!-- USER_NO HIDDEN / DIARY_DATE HIDDEN -->
            <input type="hidden" name="diaryUser" value="${sessionScope.loginUser.userNo}"/>
			<input type="hidden" name="diaryDate" id="diaryDate"/>
                <!-- Modal Header -->
                <div class="modal-header" style="text-align: center;" id="diary-header">
                    <h4 class="modal-title" style="color:black">WRITE YOUR MUZE ON YOUR DIARY</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                                              제목 <br>
                    <input type="text" placeholder="제목을 입력해세요..." name="diaryTitle" id="diaryTitle" class="diary-body" required> 
                    <br><br>
                    <div class="filebox">
					    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
					    <label for="file" id="file-box" onclick="fileUploadClick();">파일찾기</label> 
                   		<input type="file" name="upfile" id="diary-file"> 
					</div>
                    <br><br>
                   	 내용 <br>
                    <textarea name="diaryContent" id="diaryContent" cols="30" rows="10" class="diary-body" placeholder="내용을 입력하세요..." required></textarea>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-secondary">upload</button>
                </div>
            </div>
        </div>
    </div>	
</form>
<!---------------------------------다이어리 작성 확인 모달창------------------------------------>
<div class="modal fade" id="modal-content">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
        <!-- USER_NO HIDDEN / DIARY_DATE HIDDEN -->
		<input type="hidden" name="diaryDate" id="diaryDate"/>
            <!-- Modal Header -->
            <div class="modal-header" style="text-align: center;" id="diary-header" >
                <h4 class="modal-title" id="replyDiaryTitle"></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <br><br>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <p id="replyDiaryDate" style="text-align:right;"></p>
	            <div class="diary-body">
	            	<span id="replyDiaryContent"></span>
	            </div>
	            <div class="diaryImage-area" style="border:1px solid black">
	            	<img src="" id="diaryImg"/>
	            </div>
            </div>
            <div id="btn-area">
            <div id="updateBtn-area">
	            <button type="submit" class="btn btn-outline-danger" id="updateDiary">수정</button>
            </div>
            <div id="deleteBtn-area">
	            <button type="button" class="btn btn-outline-danger" id="deleteDiary">삭제</button>
            </div>
            </div>
        </div>
    </div>
</div>
<!---------------------------------다이어리 수정 모달창------------------------------------>
<form action="updateDiary.di" method="post" enctype="multipart/form-data">
    <div class="modal fade" id="update-form">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
            <!-- USER_NO HIDDEN / DIARY_DATE HIDDEN -->
			<input type="hidden" name="diaryNo" id="updateDiaryNo"/>
			<input type="hidden" name="modifiedName" id="modifiedName"/>
                <!-- Modal Header -->
                <div class="modal-header" style="text-align: center;" id="diary-header">
                    <h4 class="modal-title" style="color:black">WRITE YOUR MUZE ON YOUR DIARY</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                                              제목 <br>
                    <input type="text" placeholder="제목을 입력해세요..." name="diaryTitle" id="updateformTitle" class="diary-body" required> 
                   	<br/><br/>
                   	<!-- 
                    <div class="filebox">
					    <input class="upload-name" value="첨부파일" placeholder="첨부파일" >
					    <label for="file" id="file-box"  onclick="fileUploadClick();">파일찾기</label> 
					</div>
                   	 -->
                   		<input type="file" name="upfile" id="diary-file"> <br/><br/>
                    <div id="updateImage-area">
                    	<img src="" id="updateformImg"/>
                    </div>
                    <br>
                   	 내용 <br>
                    <textarea name="diaryContent" id="updateformContent" cols="30" rows="10" class="diary-body" placeholder="내용을 입력하세요..." required></textarea>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-secondary">upload</button>
                </div>
            </div>
        </div>
    </div>	
</form>
<!-- -----------------------------------일정 작성 모달창 ----------------------------------------- -->
<form action="schedule.sc" method="post">
<input type="hidden" name="scDate" id="scDate">
<!-- The Modal -->
<div class="modal" id="schedule-modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">	
        <h4 class="schedule-modal-title"></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <br><br>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
      	<input type="hidden" name="scTime" id="hiddenTime">
       	일정 시간 : <b id="show-time"></b><br>
        <input type="time" id="schedule-time">
        <button type="button" class="btn btn-light" id="time-check">check my time</button><br>	
        All Day :
		<label class="switch" id="allDay">
		  &nbsp;<input type="checkbox" id="allDay-checkbox">
		  <span class="slider round"></span>
		</label>
		<div>
			<input type="text" name="scTitle" id="schedule-input" placeholder="일정 내용을 적어주세요." required>
		</div>	
        <p>*check my time버튼 확인 후 submit버튼을 눌러주시기 바랍니다.</p>
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="submit" class="btn btn-outline-danger" id="schedule-submit" onclick="scheduelBtn();">submit</button>
      </div>
    </div>
  </div>
</div>
</form>
<!-- ---------------------------------------일정 확인 모달창 -------------------------------------------- -->
<div class="modal fade" id="replySchedule-modal">
  <div class="modal-dialog">
    <div class="modal-content">

	  <button style="margin-left:450px; margin-top:10px;" type="button" class="close" data-dismiss="modal">&times;</button>
	  <p id="scDate-area"></p>
      <div class="modal-body">
      	<h5>● 일정</h5>
        <h5 id="replySchedule-content"></h5>
      </div>
      <br>
   	<button  class="btn btn-outline-danger" id="deleteScBtn">삭제</button>
      
      <!-- Modal footer
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
       -->
      
    </div>
  </div>
</div>
</c:if>
</body>
</html>