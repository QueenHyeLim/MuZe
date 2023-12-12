<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#height{
		height:100vh;
	}
	.background-video{
        width: 100%;
        height: 100vh;
        background-color: rgba(0, 0, 0, 0.176);
    }
    .back-video{
        position: absolute;
        right: 0;
        bottom: 0;
        z-index: -1; 
    }
    @media (min-aspect-ratio: 16/9) {
        .back-video{
            width: 100%;
            height: auto;
        }                
    }
    @media (max-aspect-ratio: 16/9) {
        .back-video{
            width: auto;
            height: 100%;
        }                
    }
</style>
</head>
<body>
	<div id="include-navibar">
	<jsp:include page="WEB-INF/views/common/navibar.jsp"/>
	</div>
	<script>
		$('include-navibar').hide();
	</script>
	<div class="page" id="content">
	<div id="preview-rank">
		<div></div>
		<div></div>
		<div></div>
		<div></div>
	</div>
	  	<div class="background-video">
            <video autoplay loop muted plays-inline class="back-video">
                <source src="resources/video/yourmymuze.mp4" type="video/mp4">
            </video>
        </div>
	</div> 
</body>
</html> 