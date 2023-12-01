<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 작성</title>
<style>
#content-area{
    margin-top: 20px;
    background-color: beige;
    padding-top: 10px;
}

#content-area > *{
    margin-top: 20px;
}

#boardTitle{
    width: 90%;
    height: 50px;
}

#boardContent{
    width: 90%;
    height: 560px;
    margin-top: 10px;
}

#btn-area > button{
    margin-right: 60px;
    margin-bottom: 20px;
    margin-top: 10px;
}
</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>

    <div class="page" id="content">
        <div id="blank-area"></div>
        <div class="page" id="content-area" align="center">
            <form action="fUpdate.bo" method="post">
                <div id="enroll">
                    <input type="text" placeholder="제목을 입력하세요" name="boardTitle" id="boardTitle" value="${b.boardTitle}" required/>
                    <textarea style="resize:none;" name="boardContent" id="boardContent" required placeholder="내용을 입력하세요" >${ b.boardContent }</textarea>
                    <input type="hidden" name="boardNo" value="${ b.boardNo }"/>
                </div>

                <div id="btn-area" align="right">
                    <button type="submit">수정하기</button>
                    <button type="reset">이전으로</button>
                </div>

            </form>
        </div>
        <div class="page">02</div>
        <div class="page">03</div>
     </div> 
</body>
</html>