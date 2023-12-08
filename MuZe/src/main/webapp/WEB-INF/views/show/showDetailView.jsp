<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품 상세보기</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
#information {
	background-color : beige;
}

.poster > img{
	width : 250px;
	height : 350px;
	padding: 10px;
}

.info > div{
	float : left;
}

#list {
	list-style : none;
}

.poster {
	margin-bottom: 10px;
}

.des {
	padding : 10px;
}

.bookmark{
	margin-bottom: 10px;
	padding-left: 10px;
}

.page {
	padding-top: 10px;
}

#styurl{
	margin-top: 10px;
}

#information > h4{
	padding-top: 10px;
	padding-left: 10px;
}
</style>
</head>
<body>
<jsp:include page="../common/navibar.jsp"/>

<div class="page" id="content">

<div id="blank-area"></div>
 
<div class="page" id="information">
	<h4>${ prfnm }</h4>
	<hr>
	<!-- -----------------------공연 포스터------------------------ -->
	<div class="info">
		<div class="poster">
			<img src="${ poster }">
		</div>
		<!-- -----------------------북마크----------------------------- -->		
		<c:if test="${not empty sessionScope.loginUser}">
		<div class="bookmark">
			<i class="fa-regular fa-bookmark fa-lg" id="unbooked" onclick="unbookedClick();"></i>
			<i class="fa-solid fa-bookmark" style="color: #981d26;" id="booked" onclick="bookedClick();"></i>
		</div>
		<script>
			let $musId = ${mt20id};
			$(() => {
				$.ajax({
					url : 'select.bk',
					type : 'GET',
					data : { musId : $musId },
					success : result => {
						if(result > 0){
							$('#booked').show();
							$('#unbooked').hide();
						}
						else{
							$('#unbooked').show();
							$('#booked').hide();
						}
					},
					error : () => {
						alert('bookmark불러오기 실패');
					}
				})
			});
			function unbookedClick(){
				$.ajax({
					url : 'insert.bk',
					type : 'POST',
					data : { musId : $musId },
					success : result => {
						$('#unbooked').hide();
						$('#booked').show();
					},
					error : () => {
						alert('bookmark를 실패하였습니다.');
					}
				});
			};
			function bookedClick(){
				$.ajax({
					url : 'delete.bk',
					type : 'POST',
					data : { musId : $musId },
					success : result => {
						$('#booked').hide();
						$('#unbooked').show();
					},
					error : () => {
						alert('bookmark를 실패하였습니다.');
					}
				});
			}
		</script>
		</c:if>
		<!-- ------------------------공연 정보------------------------- -->
		<div class="des">
			<ul id="list">
				<li>
					공연명 : ${ prfnm }
				</li>
				
				<li>
					공연 기간 : ${ prfpdfrom } ~ ${ prfpdto }
				</li>
				
				<li>
					공연 시간 : ${ dtguidance }
				</li>
				
				<li>
					공연장 : ${ fcltynm }
				</li>
				<li>
					장르 : ${ genrenm }
				</li>
				
				<li>
					제작진 : 
					<c:choose>
						<c:when test="${prfcrew != ' '}">
							${ prfcrew }
						</c:when>
						<c:otherwise>
							해당 정보 없음
						</c:otherwise>
					</c:choose>
				</li>
				<li>
					출연진 : 
					<c:choose>
						<c:when test="${prfcast != ' '}">
							${ prfcast }
						</c:when>
						<c:otherwise>
							해당 정보 없음
						</c:otherwise>
					</c:choose>
				</li>
				<li>
					런타임 : ${ prfruntime }
				</li>
				<li>
					관람 연령 : ${ prfage }
				</li>
				<li>
					제작사 : 
					<c:choose >
						<c:when test="${entrpsnm != ' '}">
							${ entrpsnm }
						</c:when>
						<c:otherwise>
							해당 정보 없음
						</c:otherwise>
					</c:choose>
				</li>
				<li>
					티켓 가격 : ${ pcseguidance }
				</li>
			</ul>
			</div>
		<br clear="both"/>
	</div> 
</div>
<!-- -----------------뮤지컬 상세 이미지----------------------- -->
<div class="page" id="styurl" align="center">
	<img src="${ styurl }">
</div>
</div> 

<script>
console.log($('#styrul').val());
</script>

</body>
</html>