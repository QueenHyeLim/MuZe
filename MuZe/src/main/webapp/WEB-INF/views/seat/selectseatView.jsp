<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your My MuZe 뮤지컬 좌석선택</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<style>
    .seat-field{
        width : 1302px;
        height : 1000px;
    }

    .select-show{
        width : 100%;
        height : 200px;
    }

    .seat-list{
        width : 100%;
        height : 800px;
    }

    .seat-table{
        width : 100%;
        height : 550px;
    }
    
    td{
        width: 10px;
        height: 10px;
        color: #fff;
    }
	
	.select-title{
		color : #fff;
	}
	
	.select-date {
		color : #fff;
	}
	
    #red{
        background-color: red;
    }
    
    .seat-line{
    	width : 10px;
    	height : 10px;
    }
</style>


</head>
<body>
	<jsp:include page="../common/navibar.jsp" />
	<div class="page" id="content">
		<div id="blank-area"></div>
		<div class="page" id="d">
			<div class="seatfield">
        <div class="select-show">
            <div class="select-title">${ musInfo.musTitle }</div>
            <div class="select-date">${ selectdate }</div>
        </div>
        <div class="seat-list">
            <table class="seat-table" border="20">
                <tr class="seat-row-vip" id="A" value="vip">
                    <td class="seat-line" value="A1" >A1</td>
                    <td class="seat-line" value="A2" >A2</td>
                    <td class="seat-line" value="A3" >A3</td>
                    <td class="seat-line" value="A4" >A4</td>
                    <td class="seat-line" value="A5" >A5</td>
                    <td class="seat-line" value="A6" >A6</td>
                    <td class="seat-line" value="A7" >A7</td>
                    <td class="seat-line" value="A8" >A8</td>
                    <td class="seat-line" value="A9" >A9</td>
                    <td class="seat-line" value="A10">A10</td>
                    <td class="seat-line" value="A11">A11</td>
                    <td class="seat-line" value="A12">A12</td>
                    <td class="seat-line" value="A13">A13</td>
                    <td class="seat-line" value="A14">A14</td>
                    <td class="seat-line" value="A15">A15</td>
                    <td class="seat-line" value="A16">A16</td>
                    <td class="seat-line" value="A17">A17</td>
                    <td class="seat-line" value="A18">A18</td>
                </tr> 
                <tr class="seat-row-vip" id="B">
                    <td class="seat-line" value="B1" >B1</td>
                    <td class="seat-line" value="B2" >B2</td>
                    <td class="seat-line" value="B3" >B3</td>
                    <td class="seat-line" value="B4" >B4</td>
                    <td class="seat-line" value="B5" >B5</td>
                    <td class="seat-line" value="B6" >B6</td>
                    <td class="seat-line" value="B7" >B7</td>
                    <td class="seat-line" value="B8" >B8</td>
                    <td class="seat-line" value="B9" >B9</td>
                    <td class="seat-line" value="B10">B10</td>
                    <td class="seat-line" value="B11">B11</td>
                    <td class="seat-line" value="B12">B12</td>
                    <td class="seat-line" value="B13">B13</td>
                    <td class="seat-line" value="B14">B14</td>
                    <td class="seat-line" value="B15">B15</td>
                    <td class="seat-line" value="B16">B16</td>
                    <td class="seat-line" value="B17">B17</td>
                    <td class="seat-line" value="B18">B18</td>
                </tr>
                <tr class="seat-row-vip" id="C">
                    <td class="seat-line" value="C1" >C1</td>
                    <td class="seat-line" value="C2" >C2</td>
                    <td class="seat-line" value="C3" >C3</td>
                    <td class="seat-line" value="C4" >C4</td>
                    <td class="seat-line" value="C5" >C5</td>
                    <td class="seat-line" value="C6" >C6</td>
                    <td class="seat-line" value="C7" >C7</td>
                    <td class="seat-line" value="C8" >C8</td>
                    <td class="seat-line" value="C9" >C9</td>
                    <td class="seat-line" value="C10">C10</td>
                    <td class="seat-line" value="C11">C11</td>
                    <td class="seat-line" value="C12">C12</td>
                    <td class="seat-line" value="C13">C13</td>
                    <td class="seat-line" value="C14">C14</td>
                    <td class="seat-line" value="C15">C15</td>
                    <td class="seat-line" value="C16">C16</td>
                    <td class="seat-line" value="C17">C17</td>
                    <td class="seat-line" value="C18">C18</td>
                </tr>
                <tr class="seat-row" id="D">
                    <td class="seat-line" value="D1" >D1</td>
                    <td class="seat-line" value="D2" >D2</td>
                    <td class="seat-line" value="D3" >D3</td>
                    <td class="seat-line" value="D4" >D4</td>
                    <td class="seat-line" value="D5" >D5</td>
                    <td class="seat-line" value="D6" >D6</td>
                    <td class="seat-line" value="D7" >D7</td>
                    <td class="seat-line" value="D8" >D8</td>
                    <td class="seat-line" value="D9" >D9</td>
                    <td class="seat-line" value="D10">D10</td>
                    <td class="seat-line" value="D11">D11</td>
                    <td class="seat-line" value="D12">D12</td>
                    <td class="seat-line" value="D13">D13</td>
                    <td class="seat-line" value="D14">D14</td>
                    <td class="seat-line" value="D15">D15</td>
                    <td class="seat-line" value="D16">D16</td>
                    <td class="seat-line" value="D17">D17</td>
                    <td class="seat-line" value="D18">D18</td>
                </tr>
                <tr class="seat-row" id="E">
                    <td class="seat-line" value="E1" >E1</td>
                    <td class="seat-line" value="E2" >E2</td>
                    <td class="seat-line" value="E3" >E3</td>
                    <td class="seat-line" value="E4" >E4</td>
                    <td class="seat-line" value="E5" >E5</td>
                    <td class="seat-line" value="E6" >E6</td>
                    <td class="seat-line" value="E7" >E7</td>
                    <td class="seat-line" value="E8" >E8</td>
                    <td class="seat-line" value="E9" >E9</td>
                    <td class="seat-line" value="E10">E10</td>
                    <td class="seat-line" value="E11">E11</td>
                    <td class="seat-line" value="E12">E12</td>
                    <td class="seat-line" value="E13">E13</td>
                    <td class="seat-line" value="E14">E14</td>
                    <td class="seat-line" value="E15">E15</td>
                    <td class="seat-line" value="E16">E16</td>
                    <td class="seat-line" value="E17">E17</td>
                    <td class="seat-line" value="E18">E18</td>
                </tr>
                <tr class="seat-row" id="F">
                    <td class="seat-line" value="F1" >F1</td>
                    <td class="seat-line" value="F2" >F2</td>
                    <td class="seat-line" value="F3" >F3</td>
                    <td class="seat-line" value="F4" >F4</td>
                    <td class="seat-line" value="F5" >F5</td>
                    <td class="seat-line" value="F6" >F6</td>
                    <td class="seat-line" value="F7" >F7</td>
                    <td class="seat-line" value="F8" >F8</td>
                    <td class="seat-line" value="F9" >F9</td>
                    <td class="seat-line" value="F10">F10</td>
                    <td class="seat-line" value="F11">F11</td>
                    <td class="seat-line" value="F12">F12</td>
                    <td class="seat-line" value="F13">F13</td>
                    <td class="seat-line" value="F14">F14</td>
                    <td class="seat-line" value="F15">F15</td>
                    <td class="seat-line" value="F16">F16</td>
                    <td class="seat-line" value="F17">F17</td>
                    <td class="seat-line" value="F18">F18</td>
                </tr>
                <tr class="seat-row" id="G">
                    <td class="seat-line" value="G1" >G1</td>
                    <td class="seat-line" value="G2" >G2</td>
                    <td class="seat-line" value="G3" >G3</td>
                    <td class="seat-line" value="G4" >G4</td>
                    <td class="seat-line" value="G5" >G5</td>
                    <td class="seat-line" value="G6" >G6</td>
                    <td class="seat-line" value="G7" >G7</td>
                    <td class="seat-line" value="G8" >G8</td>
                    <td class="seat-line" value="G9" >G9</td>
                    <td class="seat-line" value="G10">G10</td>
                    <td class="seat-line" value="G11">G11</td>
                    <td class="seat-line" value="G12">G12</td>
                    <td class="seat-line" value="G13">G13</td>
                    <td class="seat-line" value="G14">G14</td>
                    <td class="seat-line" value="G15">G15</td>
                    <td class="seat-line" value="G16">G16</td>
                    <td class="seat-line" value="G17">G17</td>
                    <td class="seat-line" value="G18">G18</td>
                </tr>
                <tr class="seat-row" id="H">
                    <td class="seat-line" value="H1" >H1</td>
                    <td class="seat-line" value="H2" >H2</td>
                    <td class="seat-line" value="H3" >H3</td>
                    <td class="seat-line" value="H4" >H4</td>
                    <td class="seat-line" value="H5" >H5</td>
                    <td class="seat-line" value="H6" >H6</td>
                    <td class="seat-line" value="H7" >H7</td>
                    <td class="seat-line" value="H8" >H8</td>
                    <td class="seat-line" value="H9" >H9</td>
                    <td class="seat-line" value="H10">H10</td>
                    <td class="seat-line" value="H11">H11</td>
                    <td class="seat-line" value="H12">H12</td>
                    <td class="seat-line" value="H13">H13</td>
                    <td class="seat-line" value="H14">H14</td>
                    <td class="seat-line" value="H15">H15</td>
                    <td class="seat-line" value="H16">H16</td>
                    <td class="seat-line" value="H17">H17</td>
                    <td class="seat-line" value="H18">H18</td>
                </tr>
                <tr class="seat-row" id="I">
                    <td class="seat-line" value="I1" >I1</td>
                    <td class="seat-line" value="I2" >I2</td>
                    <td class="seat-line" value="I3" >I3</td>
                    <td class="seat-line" value="I4" >I4</td>
                    <td class="seat-line" value="I5" >I5</td>
                    <td class="seat-line" value="I6" >I6</td>
                    <td class="seat-line" value="I7" >I7</td>
                    <td class="seat-line" value="I8" >I8</td>
                    <td class="seat-line" value="I9" >I9</td>
                    <td class="seat-line" value="I10">I10</td>
                    <td class="seat-line" value="I11">I11</td>
                    <td class="seat-line" value="I12">I12</td>
                    <td class="seat-line" value="I13">I13</td>
                    <td class="seat-line" value="I14">I14</td>
                    <td class="seat-line" value="I15">I15</td>
                    <td class="seat-line" value="I16">I16</td>
                    <td class="seat-line" value="I17">I17</td>
                    <td class="seat-line" value="I18">I18</td>
                </tr>
                <tr class="seat-row" id="J">
                    <td class="seat-line" value="J1" >J1</td>
                    <td class="seat-line" value="J2" >J2</td>
                    <td class="seat-line" value="J3" >J3</td>
                    <td class="seat-line" value="J4" >J4</td>
                    <td class="seat-line" value="J5" >J5</td>
                    <td class="seat-line" value="J6" >J6</td>
                    <td class="seat-line" value="J7" >J7</td>
                    <td class="seat-line" value="J8" >J8</td>
                    <td class="seat-line" value="J9" >J9</td>
                    <td class="seat-line" value="J10">J10</td>
                    <td class="seat-line" value="J11">J11</td>
                    <td class="seat-line" value="J12">J12</td>
                    <td class="seat-line" value="J13">J13</td>
                    <td class="seat-line" value="J14">J14</td>
                    <td class="seat-line" value="J15">J15</td>
                    <td class="seat-line" value="J16">J16</td>
                    <td class="seat-line" value="J17">J17</td>
                    <td class="seat-line" value="J18">J18</td>
                </tr>
                <tr class="seat-row" id="K">
                    <td class="seat-line" value="K1" >K1</td>
                    <td class="seat-line" value="K2" >K2</td>
                    <td class="seat-line" value="K3" >K3</td>
                    <td class="seat-line" value="K4" >K4</td>
                    <td class="seat-line" value="K5" >K5</td>
                    <td class="seat-line" value="K6" >K6</td>
                    <td class="seat-line" value="K7" >K7</td>
                    <td class="seat-line" value="K8" >K8</td>
                    <td class="seat-line" value="K9" >K9</td>
                    <td class="seat-line" value="K10">K10</td>
                    <td class="seat-line" value="K11">K11</td>
                    <td class="seat-line" value="K12">K12</td>
                    <td class="seat-line" value="K13">K13</td>
                    <td class="seat-line" value="K14">K14</td>
                    <td class="seat-line" value="K15">K15</td>
                    <td class="seat-line" value="K16">K16</td>
                    <td class="seat-line" value="K17">K17</td>
                    <td class="seat-line" value="K18">K18</td>
                </tr>
            </table>
        </div>


    </div>
	
		</div>
	</div>
	
<script>
	$(()=>{
		$.ajax({
			url : 'disabled.st',
			data : {
				musId : '${ musInfo.musId }',
				selectDate : '${ selectdate }'
			},
			success : data => {
				console.log(data);
			},
			error : () => {
				
			}
		});
	});

</script>
</body>
</html>