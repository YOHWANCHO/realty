<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/js/booklet/jquery.booklet.latest.css" />
<script src="/resources/js/jquery-1.11.2.min.js"></script>
<script src="/resources/js/booklet/jquery.easing.1.3.js"></script>
<script src="/resources/js/booklet/jquery.booklet.latest.min.js"></script>
<title>윤리헌장 | 한화63시티</title>
<style type="text/css">
.booklet.pop_ethics { margin-top:5px !important;}
.booklet.pop_ethics .b-tab { top:786px !important;}
</style>
</head>
<body>
	<div class="booklet pop_ethics">
		<div><img src="/resources/img/ebook_ethics/ethics-1.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook_ethics/ethics-2.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook_ethics/ethics-3.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook_ethics/ethics-4.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook_ethics/ethics-5.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook_ethics/ethics-6.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook_ethics/ethics-7.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook_ethics/ethics-8.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook_ethics/ethics-9.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook_ethics/ethics-10.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook_ethics/ethics-11.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook_ethics/ethics-12.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook_ethics/ethics-15.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook_ethics/ethics-16.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook_ethics/ethics-17.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook_ethics/ethics-18.jpg" alt="" /></div>
	</div>

	<script>
		$(function(){
			$( '.booklet' ).booklet( {
				width: 1100,
				height: 781,
				shadows: true,
				shadowTopFwdWidth: 300,
				shadowTopBackWidth: 300,
				tabs: true,
				manual: true,
				easing: 'easeInOutExpo',
				easeIn: 'easeInExpo',
				easeOut: 'easeOutExpo',
				hoverWidth: 100,
				pagePadding: 0,
				tabWidth: 70,
				tabHeight: 30,
				nextControlText: '<a herf="javascript:;">다음</a>',
				previousControlText: '<a herf="javascript:;">이전</a>',
				nextControlTitle: '다음 페이지',
				previousControlTitle: '이전 페이지'
			});
		});
	</script>
</body>
</html>