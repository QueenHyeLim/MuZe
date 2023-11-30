<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 뮤지컬 보기</title>
<style>
   .preview{
        width : 1302px;
        height : 100%;
        border : 1px solid red;
    }
    .pre-nav{
        width : 100%;
        height : 150px;
        border : 1px solid red;
    }
    select{
        width : 50%;
        height : 100%;
        border : 1px solid blue;
    }
    .pre-list{
        width : 100%;
        height : 650px;
    }
    .pre-show{
        width : 100%;
        height : 25%;
        border : 1px solid black;
    }
    .pre-show > div{
        float : left;
    }
    .pre-rank {
        height : 100%;
        width : 20%;
    }
    .pre-con {
        height : 100%;
        width : 70%;
    }
    .pre_con_1, .pre_con_2, .pre_con_3, .pre_con_4 {
        width : 25%;
        height : 100%;
    }
    .pre-con > div{
        float : left;
    }
    img{
        width : 100%;
        height : 100%;
    }
	div{
		color : white;
	}
	
	
</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp" />
	<div class="page" id="content">
	<div id="blank-area"></div>
	  <div class="page" id="d">
	  	<div class="preview">
        <div class="pre-nav">
      
	         <select id="genre" name="genre" >
	                <option value="1">HOT 뮤지컬</option>
	                <option value="2">인기 연극</option>
	         </select>
     
            
        </div>
        <div class="pre-list">
        	<c:forEach items="${ list }" var="s">
            <div class="pre-show">
                <div class="pre-rank">
                    <div id="pre-rank_1">${ s.rowNo }</div>
                </div>
                <div class="pre-con">
                    <div class="pre_con_1">
                        <img src="${ s.poster }" alt="뮤지컬포스터">
                    </div>
                    <div class="pre_con_2">
                        	${ s.musTitle }
                    </div>
                    <div class="pre_con_3">
                        	${ s.theaterName }
                    </div>
                    <div class="pre_con_4">
                        ${s.startDate } ~ ${ s.endDate }
                    </div>
                </div>
                <div class="pre-res">
                	<form action="detail.rs" method="POST">
	                		<input type="hidden" name="musId" value="${s.musId }">
	                		<button type="submit" id="resego">예약하기</button>
	                </form>
                
                <!--  
                	<c:choose>
                		<c:when test="${ not empty loginUser }">
	                	<form action="detail.rs" method="POST">
	                		<input type="hidden" name="musId" value="${s.musId }">
	                		<button type="submit" id="resego">예약하기</button>
	                	</form>
	                	</c:when>
	                	<c:otherwise>
	                		<script>
	                			$('#resego').click(function(){
	                				alert('로그인 후 이용할 수 있는 기능입니다');
	                			});
	                			//$('#resego').attr('disabled', true);
	                		</script>
	                	</c:otherwise>
                    </c:choose>
                    -->
                </div>
               
            </div>

        	</c:forEach>
        </div>

    </div>
	  
	  
	  </div>
	</div> 
	<script>
	
	console.log($('#genre').val());
	$(() => {
		console.log($('#genre').val());
		$('#genre').on('change', () => {
			$.ajax({
				url : 'search.mz',
				data : {genre : $('#genre').val()},
				success : (data) => {
					console.log(data);
					let value = '';
					for(let i in data){
						value += '<div class="pre-show">'
							   + '<div class="pre-rank">'
							   + '<div id="pre-rank_1">' + data[i].rowNo + '</div>'
							   + '</div>'
							   + '<div class="pre-con">' 
							   + '<div class="pre_con_1">'
							   + '<img src="' + data[i].poster + '" alt="뮤지컬포스터">' + '</div>'
							   + '<div class="pre_con_2">' + data[i].musTitle + '</div>'
							   + '<div class="pre_con_3">' + data[i].theaterName + '</div>'
							   + '<div class="pre_con_4">' + data[i].startDate + '~' + data[i].endDate + '</div>'
							   + '</div>'
							   + '<div class="pre-res">'
							   + '<form action="detail.rs" method="POST">' 
							   + '<input type="hidden" name="musId" value="' + data[i].musId + '">'
							   + '<button type="submit" id="resego">예약하기</button>'
							   + '</form>'
							   + '</div>'
							   + '</div>';
					}
					$('.pre-list').html(value);
				},
				fail : (data) => {
					console.log('연극조회실패');
				}
			});
		})	
	})
	
	
	
	
	</script>
</body>
</html>