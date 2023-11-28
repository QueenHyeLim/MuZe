<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
</body>
</html>