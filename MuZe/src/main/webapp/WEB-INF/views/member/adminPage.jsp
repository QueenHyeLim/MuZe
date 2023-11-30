<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
body {
  margin: 0;
}

 #sidenavibar {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 10%;
  background-color: black;
  position: fixed;
  height: 100%;
  overflow: auto;
}

li a {
  display: block;
  color: white;
  padding: 8px 16px;
  text-decoration: none;
}

 li a:hover {
 	text-decoration: none;
 	color: white;
 }


</style>
</head>
<body>

	<c:if test="${ not empty alertDeleteMemberMsg }">
		<script>
			alert('${alertDeleteMemberMsg}');
		</script>
		<c:remove var="alertDeleteMemberMsg" scope="session"/>
	</c:if>

<ul id="sidenavibar">
  <br><br><br><br><br>
  <li><a href="http://localhost:8001/muze/">홈 화면</a></li>
  <br><br>
  <li><a href="work.me">작품 추가 및 관리</a></li>
  <br><br>
  <li><a href="community.me">커뮤니티 관리</a></li>
  <br><br>
  <li><a href="memberList.me">회원 관리</a></li>
  <br><br>
  <li><a href="chatbot.me">챗봇 관리</a></li>
</ul>

<div style="margin-left:20%;padding:1px 16px;height:1000px;">

</body>
</html>