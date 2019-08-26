<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" type="text/css" href="/resources/eng/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/js/booklet/jquery.booklet.latest.css" />
<script src="/resources/js/jquery-1.11.2.min.js"></script>
<script src="/resources/js/booklet/jquery.easing.1.3.js"></script>
<script src="/resources/js/booklet/jquery.booklet.latest.min.js"></script>
<title>e-brochure | Hanwha 63 City</title>
</head>
<body>
	<div class="booklet">
		<div><img src="/resources/eng/img/ebook/book1.jpg" alt="" /></div>
		<div><img src="/resources/eng/img/ebook/book2.jpg" alt="" /></div>
		<div><img src="/resources/eng/img/ebook/book3.jpg" alt="" /></div>
		<div><img src="/resources/eng/img/ebook/book4.jpg" alt="" /></div>
		<div><img src="/resources/eng/img/ebook/book5.jpg" alt="" /></div>
		<div><img src="/resources/eng/img/ebook/book6.jpg" alt="" /></div>
		<div><img src="/resources/eng/img/ebook/book7.jpg" alt="" /></div>
		<div><img src="/resources/eng/img/ebook/book8.jpg" alt="" /></div>
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
				nextControlText: '<a herf="javascript:;">Next</a>',
				previousControlText: '<a herf="javascript:;">Prev</a>',
				nextControlTitle: 'Next',
				previousControlTitle: 'Prev'
			});
		});
	</script>
</body>
</html>