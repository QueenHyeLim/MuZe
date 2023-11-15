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
	
	
	
</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp" />
	<div class="page" id="content">
	<div id="blank-area"></div>
	  <div class="page" id="d">
	  	<div class="preview">
        <div class="pre-nav">
            <select>
                <option value="">HOT 뮤지컬</option>
                <option value="">인기 연극</option>
                <option value=""></option>
            </select>
        </div>
        <div class="pre-list">
            <div class="pre-show">
                <div class="pre-rank">
                    <div id="pre-rank_1">1</div>
                </div>
                <div class="pre-con">
                    <div class="pre_con_1">
                        <img src="resources/image/뮤지컬레미제라블.png" alt="뮤지컬레미제라블">
                    </div>
                    <div class="pre_con_2">
                        뮤지컬<레미제라블>
                    </div>
                    <div class="pre_con_3">
                        블루스퀘어 신한카드홀
                    </div>
                    <div class="pre_con_4">
                        2023.11.30 ~ 2024.3.10
                    </div>
                </div>
                <div class="pre-res">
                    <a href="#" name="musId" value="">예약하기</a>
                </div>
            </div>
            <!--
            <div class="pre-show">

            </div>
            <div class="pre-show">

            </div>-->
        </div>

    </div>
	  
	  
	  </div>
	</div> 
	
		
</body>
</html>