<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diary.jsp</title>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
<style>
   /*------------ DIARY 영역 --------------*/
    #diary-area{
        width: 100%;
        height:1350px;
        border-radius: 17cqmin;
        background-color: rgba(128, 128, 128, 0.506);
    }
    #diaryName{
        text-align: center;
        margin-top: 80px;
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


<script>
    // div날짜를 클릭했을떄 해당 날짜의 값을 뽑는 함수(insert하기 위해)
    document.addEventListener('DOMContentLoaded', function() {
        var today = new Date(); // 현재 날짜
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            timeZone: 'GMT+9',
            initialView: 'dayGridMonth',
            events: '/api/demo-feeds/events.json',
            editable: true,
            selectable: true,
            select: function(info) {
                // console.log(events);

                // 선택한 날짜값 뽑고 true값일때 모달창을 띄워 다이어리를 작성할 수 있음
                var result = confirm(info.startStr+'일 의 다이어리를 작성하시겠습니까?');

                if(result == true){
                    // true값이 들어온 경우 다이어리를 작성할수 있는 모달창(form)이 뜸
                    $('#myModal').modal('show');
                }
            }
        });
        calendar.render();
    });
    
    
    // 화면에 들어왔을떄 보여질수 있게 diaryName select ajax
    $(()=>{
        $.ajax({
            url : 'selectName.di',
            success : name => {
                console.log(name);
                $('#diaryName').html(name);
            }
        })
    })
    
    // diaryName을 클릭했을때 update diaryName (default : YOU ARE MY DIARY)
    function changeDiaryName(){
    	$('#modal-diaryName').modal('show');
        $.ajax({
            url : 'name.di',
            success : name => {
                console.log(name);
                $('#diaryName').html(name);
            }
        })
    }

    
</script>


 <!--------------------------------------달력--------------------------------------------->
    <div class="page" id="content">
        <div id="blank-area"></div>
        <div id="diary-area" style="border:1px solid black">
            <div style="height:120px;">
                <h3 id="diaryName" onclick="changeDiaryName();">YOU ARE MY DIARY</p>
            </div>
            <div class="page">
                <div id="calendar"></div>
                <!-- Cloudflare Pages Analytics -->
                <script defer src='https://static.cloudflareinsights.com/beacon.min.js' data-cf-beacon='{"token": "dc4641f860664c6e824b093274f50291"}'></script>
                <!-- Cloudflare Pages Analytics -->
            </div>
        </div>
    </div> 
    
    
<!-------------------------------다이어리 작성을 위한 모달창------------------------------------>
	<form action="insert.di" method="post">
	    <div class="modal fade" id="myModal">
	        <div class="modal-dialog modal-lg">
	            <div class="modal-content">
	                <!-- Modal Header -->
	                <div class="modal-header" style="text-align: center;" id="diary-header">
	                    <h4 class="modal-title">WRITE YOUR MUZE ON YOUR DIARY</h4>
	                    <button type="button" class="close" data-dismiss="modal">&times;</button>
	                </div>
	                <!-- Modal body -->
	                <div class="modal-body">
	                                              제목 <br>
	                    <input type="text" placeholder="제목을 입력해세요..." name="diaryTitle" id="diaryTitle" class="diary-body"> 
	                    <br><br>
	                    <input type="file" name="upfile" id="diary-file"> 
	                    <br><br>
	                   	 내용 <br>
	                    <textarea name="diaryContent" id="diaryContent" cols="30" rows="10" class="diary-body" placeholder="내용을 입력하세요..."></textarea>
	                </div>
	                <!-- Modal footer -->
	                <div class="modal-footer">
	                    <button type="submit" class="btn btn-secondary" data-dismiss="modal">upload</button>
	                </div>
	                
	            </div>
	        </div>
	    </div>
	</form>


	<!-------------------------------다이어리 네임 작성 모달창------------------------------------>
    <!-- The Modal -->
    <div class="modal fade" id="modal-diaryName">
        <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
        
            <!-- Modal Header -->
            <div class="modal-header" id="diary-header">
            <h4 class="modal-title">CHANGE YOUR DIARY NAME</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">
            <input id="diaryName-input" type="text" name="diaryName" placeholder="나만의 다이어리 네임을 만들어주세요">
            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="submit" class="btn btn-secondary" data-dismiss="modal">change</button>
            </div>
            
        </div>
        </div>
    </div>


</body>
</html>