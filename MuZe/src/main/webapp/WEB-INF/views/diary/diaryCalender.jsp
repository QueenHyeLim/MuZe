<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diary.jsp</title>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
</style>
</head>
<body>
<jsp:include page="../common/navibar.jsp"/>
<c:if test="${not empty sessionScope.loginUser}">
<script>

    // div날짜를 클릭했을떄 해당 날짜의 값을 뽑는 함수(insert하기 위해)
    document.addEventListener('DOMContentLoaded', function() {
        var today = new Date(); // 현재 날짜
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            timeZone: 'GMT+9',
            initialView: 'dayGridMonth',
            dragScroll : false,
            editable: false,
            selectable: true,
    		// 화면에 들어왔을떄 보여질수 있게 select diary 
            events: [
            	<c:forEach var="di" items="${list}">
            	{
            		title : '${di.diaryTitle}',
            		start : '${di.diaryDate}',
            		backgroundColor : 'rgb(152, 29, 38)',
            		color : 'black	'
            	},
            	</c:forEach>
            ],	
            // 클릭한 해당 날짜의 값을 뽑아주는 이벤트 
            dateClick: function(date) {
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
                        $('#myModal').modal('show');
              	  }
              	});
            },
            // 이벤트 클릭시 다이어리 내용을 볼수 있는 이벤트
            eventClick : function(info) {
            	console.log(info);
            	$('#modal-content').modal('show');
            },
        });
        calendar.render();
    });

    
    // diaryName을 클릭했을때 update diaryName (default : YOU ARE MY DIARY)
    function changeDiaryName(){
    	$('#modal-diaryName').modal('show');
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
       	<input type="hidden" name="userNo" value="${sessionScope.loginUser.userNo}"/>
           <!-- Modal Header -->
           <div class="modal-header" id="diary-header">
           <h4 class="modal-title">CHANGE YOUR DIARY NAME</h4>
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
                    <input type="file" name="upfile" id="diary-file"> 
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
        <input type="hidden" name="diaryUser" />
		<input type="hidden" name="diaryDate" id="diaryDate"/>
            <!-- Modal Header -->
            <div class="modal-header" style="text-align: center;" id="diary-header">
                <h4 class="modal-title" id="diaryName-area"></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                                          제목 <br>
                <div id="diaryTitle" class="diary-body"> 
                	<h4 name="diaryTitle"></h4>
                </div>
                <br><br>
                <br><br>
               	 내용 <br>
                <div class="diary-body">
                	<span name="diaryContent" id="diaryContent">
                	</span>
                </div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="submit" class="btn btn-secondary">upload</button>
            </div>
            
        </div>
    </div>
</div>
</c:if>
</body>
</html>