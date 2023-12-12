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
 #preview-rank{
    	width : 1000px;
    	height : 400px;
    	float : right;
        position: fixed;
        right: 0;
        bottom: 0;
    }
    #rank_photo{
        box-sizing: border-box;
    	width : 20%;
    	height : 250px;
    	float : left;
        margin : 22px;
    }
    #image-poster{
    	border-radius: 2cqmin;
    	width : 200px;
    	height : 250px;
    }
    #logo-area{
    	position : fixed;
    	right : 0;
    	margin-top : 10%;
    	margin-right : 150px;
    	
    }
    #logo-image{
    	width : 480px;
    	height : 330px;
    }
</style>
</head>
<body>
	<jsp:include page="WEB-INF/views/common/navibar.jsp"/>
	<div class="page" id="content">
	<div id="logo-area">
		<img alt="" src="resources/images/yourmymuze-logo.png" id="logo-image">
	</div>
	<script>
		$(() => {
			$.ajax({
				url : 'search.rk',
				data : { rankCategory : 'popular'},
				success : (data) => {
					console.log(data);
					let value = '';
					for(let i= 0; i < 4; i++){
    					value +='<div id="rank_photo"><img src="' + data[i].poster + '" id="image-poster"></div>';
		    				  console.log(data[i].poster);
					}
					$('#preview-rank').html(value);
				},
				error : () => {
					console.log('실패');
				}
			})
		})
	</script>
	<div id="preview-rank"></div>
	  	<div class="background-video">
            <video autoplay loop muted plays-inline class="back-video">
                <source src="resources/video/yourmymuze.mp4" type="video/mp4">
            </video>
        </div>
	</div> 
</body>
</html> 