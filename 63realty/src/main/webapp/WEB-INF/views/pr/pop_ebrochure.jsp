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
<title>e-브로셔 | 한화63시티</title>
</head>
<body>
	<div class="booklet">
		<div><img src="/resources/img/ebook/book1.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book2.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book3.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book4.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book5.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book6.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book7.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book8.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book9.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book10.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book11.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book12.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book15.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book16.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book17.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book18.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book19.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book20.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book21.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book22.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book23.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book24.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book25.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book26.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book27.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book28.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book29.jpg" alt="" /></div>
		<div><img src="/resources/img/ebook/book30.jpg" alt="" /></div>
	</div>

	<script>
		$(function(){
			$( '.booklet' ).booklet( {
				width: 1100,
				height: 675,
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