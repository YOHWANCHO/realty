<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>윤리경영 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 홍보센터 &gt; <strong>윤리경영</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_pr.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>윤리경영</h2></div>
		<div class="ethics_box">
			<h3>한화63시티 윤리경영</h3>
			<p class="mt10">㈜한화63시티는 신의와 공정성을 기업경영의 덕목으로 삼고 경제활동을 비롯한 <br />모든 사회활동에서 법규와 사회규범을 준수하며, 시장 경제 질서를 존중하고 <br />불공정한 거래를 배격하는 건실한 기업활동에 최선을 다한다.</p>
			<p>㈜한화63시티는 한화인의 덕목인 신용과 의리를 바탕으로 고객에게 최상의<br />상품 및 서비스를 제공하며, 자율과 창의를 존중하는 열린 경영의 실천을 통해 <br />최대의 가치를 창출한다.</p>
			<p>이에 모든 임직원의 올바른 <strong class="color_org">行動</strong>과 <strong class="color_org">價値判斷</strong>의 <strong class="color_org">基準</strong>이 <br />되는 윤리강령을 제정하여, 이를 적극 실천하고 제반 <strong class="color_org">法規</strong>를 준수함으로써 <br />고객만족과 <strong class="color_org">企業價値</strong> 극대화를 위해 최선의 노력을 다할 것을 다짐한다.</p>
			<h3>윤리헌장</h3>
			<p class="mt10">한화63시티 윤리헌장 입니다. <br />자세히 보기를 누르시면 자세한 내용을 확인하실 수 있습니다.</p>
			<a href="javascript:;" onclick="MYAPP.NewWindow.init('pop_ethics', '', '1130', '836', 'yes');" class="btn_m1">윤리헌장 자세히 보기</a>

		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(3, 3, 0);
	});
</script>
</body>
</html>