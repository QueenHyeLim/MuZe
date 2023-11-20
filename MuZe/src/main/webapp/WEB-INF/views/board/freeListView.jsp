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


</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>

    <div class="page" id="content">
        <div id="blank-area"></div>
        
        <div class="page" align="right">
        	<a class="btn btn-primary" href="fboardWrite.bo">작성하기</a>
        </div>
        
        <div class="page" id="list-area">

            <table border="1" align="center">
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
                	<tr align="center">
                		<td>2</td>
                		<td>샤롯데 주변 맛집 추천</td>
                		<td>user06</td>
                		<td>14</td>
                		<td>2023-11-20</td>
                	</tr>

                    <tr align="center">
                		<td>1</td>
                		<td>샤롯데 주변 맛집 추천</td>
                		<td>user06</td>
                		<td>14</td>
                		<td>2023-11-20</td>
                	</tr>
                </tbody>
            </table>

        </div>
        
        <div class="page" align="center">
            <button class="btn btn-primary">페이징바 영역</button>
        </div>
     </div> 
</body>
</html>