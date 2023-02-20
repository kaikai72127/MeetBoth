<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-hant-TW">
<head>
<!-- 引入共同的headMVC -->
<jsp:include page="/WEB-INF/html/fragment/headMVC.jsp" />

<link rel="canonical"
	href="https://www.letswrite.tw/google-map-api-place-api/">
<link rel="canonical"
	href="https://www.letswrite.tw/google-map-api-marker-custom/">
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->



</head>
<style>
.container {
	padding-top: 30px;
	padding-bottom: 30px;
}

#map {
	background: #CCC;
}

ul {
	padding-top: 16px;
}

.media img {
	max-width: 64px;
}

.media h5, p {
	font-size: 14px;
}

.mdeia p {
	margin-bottom: 6px;
}

.media h6 {
	font-size: 12px;
	color: #CCC;
}

.fixed-bottom {
	position: fixed;
	left: 16px;
	bottom: 0;
	max-width: 320px;
}

.btn {
	margin-top: 6px;
	margin-bottom: 6px;
	font-size: 14px;
}

.btn+.btn {
	margin-left: 6px;
}

.btn {
	font-family: "微軟正黑體";
}
</style>

<!--BOBY-->
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="main">
			<!-- header -->
			<!-- 引入共同的topMVC -->
			<jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" />

			<!-- Google Tag Manager (noscript)-->
			<noscript>
				<iframe
					src="https://www.googletagmanager.com/ns.html?id=GTM-PGQ9WQT"
					height="0" width="0" style="display: none; visibility: hidden"></iframe>
			</noscript>


			<div id="app" class="container">

				<!-- 搜尋框 -->
				<div class="row">
					<div class="col google-map">
						<h5>Search：</h5>
						<div class="form-group">
							<input type="text" class="form-control  input-lg" ref="site"
								v-model="site">
						</div>
					</div>
				</div>

				<!-- 放google map的div -->
				<div class="row">
					<div class="col">
						<div id="map" class="embed-responsive embed-responsive-16by9"></div>
					</div>
				</div>

				<!-- <div class="row">
            <div class="col">
                <button type="button" class="btn btn-outline-secondary" v-for="f in features"
                    @click="openInfoWindows(f.properties.id)">
                    {{ f.properties.name }}
                </button>
            </div>
        </div> -->




				<!-- 放google map的div
        <div class="row">
            <div class="col google-map">
                <h5>Google Map：</h5>
                <div id="map" class="embed-responsive embed-responsive-16by9"></div>
            </div>
        </div> -->

				<!-- <hr> -->

				<!-- 放評論摘要的div
        <div class="row" v-if="place != null">
            <div class="col" v-if="place.reviews != null">
                <h5>評論：</h5>
                <div class="row" v-for="p in place.reviews">
                    <div class="col">
                        <ul class="list-unstyled">
                            <li class="media">
                                <img :src="p.profile_photo_url" class="mr-3">
                                <div class="media-body">
                                    <h5 class="mt-0 mb-1">
                                        <a target="_blank" :href="p.author_url">{{ p.author_name }}</a>
                                    </h5>
                                    <p>{{ p.text }}</p>
                                    <h6>{{ p.relative_time_description }}</h6>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div> -->

			</div>
			<!-- 將 YOUR_API_KEY 替換成你的 API Key 即可 -->
			<jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />
		</div>
	</main>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBqv3UCHAPGEKO_TA9vZzEghUQSme859hE&libraries=places"
		async defer></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.10/vue.min.js"></script>

	<!-- map -->
	<script>
	var markers = [];
    var position = [
        { label: '小羽', lat: 24.984518300257314, lng: 121.21822892704178, loc: '桃園市中壢區' },  
        { label: '小李', lat: 24.9899477702909, lng: 121.22167595465892, loc: '桃園市中壢區' }, 
        { label: '彬彬', lat: 24.98540500292972, lng:  121.22019377000503, loc: '桃園市中壢區' }, 
        { label: '昆君', lat: 24.985125429803908, lng: 121.22416926814918, loc: '桃園市中壢區' },  
        { label: '苓苓', lat: 24.989076071946243, lng: 121.22322104116847, loc: '桃園市中壢區' },  
        { label: '阿泰', lat: 24.982205535100352, lng: 121.22226572582218, loc: '桃園市中壢區' },  
        { label: '玄月', lat: 24.985125429875538, lng: 121.22419072536358, loc: '桃園市中壢區' },   
        { label: '琪琪', lat: 24.987699874631147, lng: 121.2278072523502, loc: '桃園市中壢區' },   
        { label: 'Gary', lat: 24.989136596408823, lng: 121.22800314070597, loc: '桃園市中壢區' },   
        { label: '傳奇老婆婆', lat: 24.986889025538797, lng: 121.23015315235011, loc: '桃園市中壢區' }    
    ];
	const googleMap = new Vue({
        el: '#app',
        data: {
            map: null,
            autocomplete: null,
            site: '', // place API要綁定的搜尋框
            place: null, // 存place確定後回傳的資料
            features: [], // 存入每一個地點
            infowindowAll: {} // 存入每一個marker上的info windows
        },
        methods: {
            // init google map
            initMap() {
                // 預設顯示的地點：聖德
                let location = {
                    lat: 24.985064755434966, // 經度
                    lng: 121.2224708104762 // 緯度
                };
                 
                // 建立地圖
                this.map = new google.maps.Map(document.getElementById('map'), {
                    center: location,
                    zoom: 16,
                    mapTypeId: 'terrain'
                });
                for (var i = 0; i < position.length; i++) {
                	
                	var contentString= '<div style="color:#DC5345;"><strong>'+position[i].label+'</strong></div><div>'+position[i].loc+'</div>';

                    markers[i] = new google.maps.Marker({
                        position: {
                            lat: position[i].lat,
                            lng: position[i].lng
                        },
                        map: this.map,
//                         label: position[i].label,
                        icon:"/MeetBoth/html/images/favicon.png"

                        
                        
                        
//                      // info window 
//                         let infowindow = new google.maps.InfoWindow({
//                             content: `<h6>${r.properties.name} <hr>${r.properties.site}</h6>` // 支援html

//                         });
                        

                        });
                        
                 // info window `<h6>${position[i].label}</h6>`
                    let infowindow = new google.maps.InfoWindow({
                        content: contentString,
                        maxWidth:250
                    });
                 
                    infowindow.open(this.map, markers[i]);
                    
                 // 監聽 marker click 事件
//                  markers.addListener('click', e => {
//                      // 如果目前有開啟中的訊息視窗，先將其關閉 
//                      if (this.infowindow) this.infowindow.close();
//                      // 顯示被點擊地標的訊息視窗
//                      infowindow.open(this.map, marker);
//                      // 存入目前開啟的訊息視窗
//                      this.infowindow = infowindow;};

                   

                    
                };



//                 // 放置多個marker
//                 fetch('./map.geojson')
//                     .then(results => results.json())
//                     .then(result => {
//                         this.features = result.features;
//                         Array.prototype.forEach.call(this.features, r => {
//                             let latLng = new google.maps.LatLng(r.geometry.coordinates[0], r.geometry.coordinates[1]);
//                             let marker = new google.maps.Marker({
//                                 position: latLng,
//                                 map: this.map,
//                             });

//                             // info window
//                             let infowindow = new google.maps.InfoWindow({
//                                 content: `<h6>${r.properties.name} <hr>${r.properties.site}</h6>` // 支援html

//                             });

//                             // 監聽 marker click 事件
//                             marker.addListener('click', e => {
//                                 // 如果目前有開啟中的訊息視窗，先將其關閉 
//                                 if (this.infowindow) this.infowindow.close();
//                                 // 顯示被點擊地標的訊息視窗
//                                 infowindow.open(this.map, marker);
//                                 // 存入目前開啟的訊息視窗
//                                 this.infowindow = infowindow;
//                             });

//                             // 加一個open的method，就可由外部按鈕開啟
//                             this.infowindowAll[r.properties.id] = {
//                                 open: function () {
//                                     infowindow.open(this.map, marker);
//                                 }
//                             };

//                         });

//                     });
            },
            // 地址自動完成 + 地圖的中心移到輸入結果的地址上
            siteAuto() {

                let options = {
                    componentRestrictions: { country: 'tw' } // 限制在台灣範圍
                };
                this.autocomplete = new google.maps.places.Autocomplete(this.$refs.site, options);
                this.autocomplete.addListener('place_changed', () => {
                    this.place = this.autocomplete.getPlace();
                    if (this.place.geometry) {
                        let searchCenter = this.place.geometry.location;
                        this.map.panTo(searchCenter); // panTo是平滑移動、setCenter是直接改變地圖中心

                        // 放置標記
                        let marker = new google.maps.Marker({
                            position: searchCenter,
                            icon:"/MeetBoth/html/images/meatball-map1.png",
                            map: this.map,
                            animation: google.maps.Animation.DROP,
                            draggable:true
                        });

                        // info window
                        let infowindow = new google.maps.InfoWindow({
                            content: this.place.formatted_address
                        });
                       
                        
                     // 監聽 marker click 事件
                        marker.addListener('click', e => {
                            // 如果目前有開啟中的訊息視窗，先將其關閉 
                            if (this.infowindow) this.infowindow.close();
                            // 顯示被點擊地標的訊息視窗
                            infowindow.open(this.map, marker);
                            // 存入目前開啟的訊息視窗
                            this.infowindow = infowindow;
                        });

                    }
                });
            }


        },
        mounted() {
            window.addEventListener('load', () => {

                this.initMap();
                this.siteAuto();

            });
        }
    })
    </script>
</body>
</html>