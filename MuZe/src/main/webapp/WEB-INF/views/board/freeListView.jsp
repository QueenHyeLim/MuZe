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
}

</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>

    <div class="page" id="content">
        <div id="blank-area"></div>
        
        <div class="page" align="right">
        	<c:if test="${ !empty sessionScope.loginUser }">
        		<a class="btn btn-primary" href="fboardWrite.bo">작성하기</a>
        	</c:if>
        </div>
		
		<div class="page" id="searchPart" align="center">
			<form action="fSearch.bo" method="get">
				<input type="hidden" name="currentPage" value="1">
				<select name="condition" class="search select">
					<option value="content">내용</option>
					<option value="writer">작성자</option>
					<option value="title">제목</option>
				</select>
				<input type="text" class="search input" name="keyword" value="${keyword}">
				<button type="submit" class="btn btn-primary" id="searchBtn">검색</button>
			</form>
		</div>
        
        <div class="page" id="list-area">

            <table border="1" align="center" id="fboardList">
                <thead>
                    <tr align="center">
                        <th>게시글 번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                
                <tbody>
                	<c:choose>
                		<c:when test="${ !empty list}">
                			<c:forEach items="${ list }" var="f">
                				<tr align="center">
                					<td class="fbno">${ f.boardNo }</td>
                					<td>${ f.boardTitle }</td>
                					<td>${ f.boardWriter }</td>
                					<td>${ f.count }</td>
                					<td>${ f.createDate }</td>
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
        
        <script>
        	$(()=>{
        		$('#fboardList > tbody > tr').click(function(){
        			location.href="fDetail.bo?fbno=" + $(this).children('.fbno').text();
        		})
        	})
        </script>
        
        <div class="page">
        	<div class="paging-part">
        		<ul class="pagination">
        			<c:choose>
        				<c:when test="${pi.currentPage eq 1}">
        					<li class="page-item disabled"><a class="page-link" href="fboardList.bo?cPage=${p}">&lt;</a>
        				</c:when>
        				<c:otherwise>
        					<li class="page-item"><a class="page-link" href="fboardList.bo?cPage=${$pi.currentPage-1}">&lt;</a></li>
        				</c:otherwise>
        			</c:choose>
        			
        			<c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
        				<li class="page-item"><a class="page-link" href="fboardList.bo?cPage=${p}">${p}</a><li>
        			</c:forEach>
        			
        			<li class="page-item"><a class="page-link" href="fboardList.bo?cPage=${$pi.currentPage+1}">&gt;</a></li>
        		</ul>
        	</div>
        </div>
     </div> 
</body>
</html>