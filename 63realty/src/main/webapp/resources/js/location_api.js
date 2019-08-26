// 지도 여러개 만들기
var locationAPI = (function(){
		
	var _add = function( mapContainer, latLng ){
		makeMap(document.getElementById( mapContainer ), latLng);
	};
	
	function makeMap(pMapContainer, pLatLng){
		var mapContainer = pMapContainer,
			latLng = pLatLng,
			mapOption = {
			  center: new daum.maps.LatLng(latLng.x, latLng.y),	// 지도의 중심 좌표
			  level: 3// 지도의 확대 레벨
		  };
		  
		// 지도를 표시할 div와 지도 옵션으로 지도를 생성함
  		var map = new daum.maps.Map(mapContainer, mapOption);
		
		// 컨트롤 메뉴 생성
		var mapTypeControl = new daum.maps.MapTypeControl();
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
		
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(latLng.x, latLng.y); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	}
	
	return{
		add:_add
	}
})();