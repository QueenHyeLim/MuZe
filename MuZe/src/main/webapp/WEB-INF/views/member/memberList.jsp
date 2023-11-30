<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
    	h2 {
    		margin-left:100px;
    	}
        .content {
            
            width:80%;
            margin-top:-60px;
        }
        .innerOuter {
            
            width:80%;
            margin-right:auto;
            padding:5% 10%;
            background-color:white;
        }
        

        #boardList {text-align:center;}
        #boardList>tbody>tr:hover {cursor:pointer;}

        #pagingArea {width:fit-content; margin:auto;}
        
        .pagination {
		    margin-right: 100px;
		}
		.userGrade {
	    	margin-left : 870px;
		}
        
        #searchForm {
            width:80%;
            margin-left:500px;
        }
        #searchForm>* {
            float:left;
            margin:5px;
        }
        
        .select {width:20%;}
        .text {width:53%;}
        .searchBtn {width:20%;}
    </style>
</head>
<body>

	<jsp:include page="../member/adminPage.jsp"/>

	<div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2 align="center">회원 관리</h2>
            <br>
            
            <div id="search-area">
            <form id="searchForm" action="search.me" method="get" align="center">
            	<input type="hidden" name="currentPage" value="1">
                <div class="select">
                    <select class="custom-select" name="condition">
                        <option value="name">사용자명</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword" value="${ keyword }">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>
            </div>
		
			<c:if test="${ not empty condition }">
			<script>
				$(function(){
					$('#search-area-option[value=${condition}]').attr('selected', true);
				});
			</script>
		</c:if>
            
            
			
		</div>
            
        
            <table id="memberList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>아이디</th>
                        <th>사용자명</th>
                        <th>이메일</th>
                        <th>전화번호</th>
                        <th>가입일</th>
                        <th>회원 등급</th>
                		<th>회원 탈퇴</th>
                    </tr>
                </thead>
                <tbody>
                
                	<c:forEach items="${ list }" var="m">
                		<tr>
                			<td class="mno">${ m.userNo }</td>
                			<td>${ m.userId }</td>
                			<td>${ m.userName }</td>
                			<td>${ m.email }</td>
                			<td>${ m.phone }</td>
                			<td>${ m.enrollDate }</td>
                			<td>${ m.userGrade }</td>
                			<td><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">탈퇴시키기</button></td>
                		</tr>
                	</c:forEach>
                    
                </tbody>
            </table>
            
            <div id="pagingArea">
                <ul class="pagination">
                
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                    	</c:when>
                    	<c:when test="${ requestScope.pi.currentPage ne 1 }">
                    		<li class="page-item"><a class="page-link" href="search.me?currentPage=${requestScope.pi.currentPage-1}&condition=${condition}&keyword=${keyword}" aria-label="Previous">&laquo;</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="memberList.me?cPage=${pi.currentPage-1}" aria-label="Previous">&laquo;</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach begin="${ requestScope.pi.startPage }" end="${ requestScope.pi.endPage }" var="p">
                    	<c:choose>
                    		<c:when test="${ empty condition }">
                    			<li class="page-item"><a class="page-link" href="memberList.me?cPage=${p}">${p}</a></li>
                    		</c:when>
                    		<c:otherwise>
                    			<li class="page-item"><a class="page-link" href="search.me?currentPage=${p}&condition=${condition}&keyword=${keyword}">${ p }</a></li>
                    		</c:otherwise>
                    	</c:choose>
                   	</c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
                    	</c:when>
                    	<c:when test="${ requestScope.pi.currentPage ne requestScope.pi.maxPage }">
                    		<li class="page-item"><a class="page-link" href="search.me?currentPage=${requestScope.pi.currentPage+1}&condition=${condition}&keyword=${keyword}" aria-label="Next">&raquo;</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="memberList.me?cPage=${pi.currentPage+1}" aria-label="Next">&raquo;</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                </ul>
            </div>

    </div>
    
    <div class="modal fade" id="deleteForm">
    <div class="modal-dialog modal-sm">
        <div class="modal-content" align="center">

            <div class="modal-header">
                <h4 class="modal-title">정말로 계정을 <br>
                            탈퇴시키겠습니까?</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <form action="deleteMemberById.me" method="post">
                <div class="modal-body">
                    <div align="center">
                        <!-- 사용자로부터 삭제할 회원의 ID를 입력받는 입력란 -->
                        <label for="userId">회원 ID:</label>
                        <input type="text" id="userId" name="userId" required>
                    </div>
                    <br>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer" align="center">
                    <button type="submit" class="btn btn-danger">탈퇴시키기</button>
                </div>
            </form>
        </div>
    </div>
</div>
	

</body>
</html>