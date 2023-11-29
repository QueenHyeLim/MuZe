<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*작성하기 버튼*/
.page > a {
    margin-top: 10px;
}

/* 목록 영역*/
#list-area {
	margin-top : 20px;
}

table{
	width : 1300px;
    color : white;
}

/*페이징바 영역*/
.paging-part {
	margin: auto;
	width: 300px;
	padding-top: 30px;
}
</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>
	
    <div class="page" id="content">
        <div id="blank-area"></div>
        
        <div class="page" align="right">
        	<c:if test="${ !empty sessionScope.loginUser }">
        		<a class="btn btn-primary" href="dealInsertForm.bo">작성하기</a>
        	</c:if>
        </div>
        
        <div class="page" id="list-area">

            <table border="1" align="center" id="dealBoard">
                <thead>
                    <tr align="center">
						<th>작품 제목</th>
                        <th>좌석 정보</th>
                        <th>작성자</th>
                        <th>티켓 수량</th>
                        <th>장당 가격</th>
                    </tr>
                </thead>
                
                <tbody>
                	<c:choose>
                		<c:when test="${ !empty list}">
                			<c:forEach items="${ list }" var="d">
                				<tr align="center">
									<td style="display: none;" class="dealNo">${d.dealNo}</td>
									<td>${d.showTitle}</td> 
                					<td>
										${ d.seatFloor } / ${ d.seatRank } / ${ d.seatArea } / ${ d.seatCol } 
										<c:if test="{!empty d.seatDes}">
										/ ${ d.seatDes }
										</c:if>
									</td>
                					<td>${ d.userId }</td>
                					<td>${ d.ticketMany }</td>
                					<td>${ d.ticketPrice }</td>
                				</tr>
                			</c:forEach>
                		</c:when>
                		
                		<c:otherwise>
                			<td colspan="5" align="center">게시글이 존재하지 않습니다.</td>
                		</c:otherwise>
                	</c:choose>
                	
                </tbody>
            </table>

        </div>

        <div class="page">
        	<div class="paging-part">
        		<ul class="pagination">
        			<c:choose>
        				<c:when test="${pi.currentPage eq 1}">
        					<li class="page-item disabled"><a class="page-link" href="dealList.bo?cPage=${p}">&lt;</a>
        				</c:when>
        				<c:otherwise>
        					<li class="page-item"><a class="page-link" href="dealList.bo?cPage=${$pi.currentPage-1}">&lt;</a></li>
        				</c:otherwise>
        			</c:choose>
        			
        			<c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
        				<li class="page-item"><a class="page-link" href="dealList.bo?cPage=${p}">${p}</a><li>
        			</c:forEach>
        			
        			<li class="page-item"><a class="page-link" href="dealList.bo?cPage=${$pi.currentPage+1}">&gt;</a></li>
        		</ul>
        	</div>
        </div>

	</div>

	<script>
		$(() => {
			$('#dealBoard > tbody > tr').click(function(){
				location.href = 'dealDetail.bo?dealNo=' + $(this).children('.dealNo').text();

			})
		})
	</script>
	
</body>
</html>