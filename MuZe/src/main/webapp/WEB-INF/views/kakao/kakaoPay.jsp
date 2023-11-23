<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MUZE 카카오페이</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	
	<h1>MUZE 카카오페이 결제</h1>
	
	<a id="kaka-pay">
		<img src="resources/images/kakao_pay.png" />
	</a>
	
	<script>
		$(() => {
			
			//d1e312a7f32f5f7b5f297a111ae6429f
			$('#kakao-pay').click(() => {
				location.href = 'https://kapi.kakao.com/v1/payment/ready';
				/*+ '/KakaoAK' + '/d1e312a7f32f5f7b5f297a111ae6429f' + '/'*/
			});
		})
		
	</script>
</body>
</html>