<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점심 뭐먹지</title>
</head>
<body>
	<form method = "post" action = "register_rest.jsp">
		맛집이름: <input type = "text" name ="rest_name">
		주소입력: <input type ="text" name = "address">
		<input type ="submit" value = "맛집등록">
	</form>
	
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7afa81dd64fc9dd5e00fa18dfd8e7f83"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(37.542168, 126.841328),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
		
		var marker = new daum.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);

		
		
	</script>
	
	
	
</body>
</html>



<div id="map" style="width: 500px; height: 400px;"></div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8a71bac8c67272654bea6640c6356142"></script>

	주소 :<input type ="text" id = "address">
	<button type ="button" onclick= "move()">지도 보기</button>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	function move() {
		address = $("#address").val();
		
		$.ajax({
			url : 'https://dapi.kakao.com/v2/local/search/address.json',
			type : 'get',
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Authorization",
						"KakaoAK c2964a2e8e13d5005a372fd223360446");
			},
			data : {
				"query" : address
			},
			success : function(result) {
				documents = result.documents;
				doc = documents[0];
				road_address = doc.road_address;
				x = road_address.x;
				y = road_address.y;
				console.log(x, y);
				map(y,x);
				//				$("body").append(result);
				//					
			}
		});
	}

	//주소를 입력
	//버튼을 누르면 주소를 위도 경도 변환 api로 넘겨줌
	//응답결과(JSON)를 분석해서 위도 경도로 입력해줌
	function map(y, x) {
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new daum.maps.LatLng(y, x), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(y, x); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
		
		
	}
</script>



