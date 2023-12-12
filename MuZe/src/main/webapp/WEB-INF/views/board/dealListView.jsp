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

/*검색 영역*/
#searchPart {
	margin-top: 30px;
}

.search {
	display: inline-block;
	height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

.select{
	width: 100px;
}

.input {
	width: 500px;
}

#searchBtn{
	margin-bottom: 7px;
	background-color: rgba(152, 29, 37);
	border : rgba(152, 29, 37);
}

#insertBtn{
	background-color: rgba(152, 29, 37);
	border : rgba(152, 29, 37);
}


</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>
	
    <div class="page" id="content">
        <div id="blank-area"></div>
        
        <div class="page" align="right">
        	<c:if test="${ !empty sessionScope.loginUser }">
        		<a class="btn btn-primary" id="insertBtn" href="dealInsertForm.bo">작성하기</a>
        	</c:if>
        </div>
        
        <div class="page" id="searchPart" align="center">
			<form action="dealSearch.bo" method="get">
				<input type="hidden" name="currentPage" value="1">
				<select name="condition" class="search select">
					<option value="writer">작성자</option>				
					<option value="showTitle">작품명</option>
				</select>
				<input type="text" class="search input" name="keyword" value="${keyword}">
				<button type="submit" class="btn btn-primary" id="searchBtn">검색</button>
			</form>
		</div>
		
		<c:if test="${not empty condition }">
			<script>
				$(function(){
					$('#searchPart option[value=${condition}]')
						.attr('selected', true);
				});
			</script>
		</c:if>
        
        
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
                					<td>${ d.dealWriter }</td>
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
        					<li class="page-item"><a class="page-link" href="dealList.bo?cPage=${pi.currentPage-1}">&lt;</a></li>
        				</c:otherwise>
        			</c:choose>
        			
        			<c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
        				<li class="page-item"><a class="page-link" href="dealList.bo?cPage=${p}">${p}</a><li>
        			</c:forEach>
        			
        			<li class="page-item"><a class="page-link" href="dealList.bo?cPage=${pi.currentPage+1}">&gt;</a></li>
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