<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/eng/inc/top.jsp"%>
<title>How to get here | Hanwha 63 City</title>
</head>
<body>
<%@ include file="/WEB-INF/views/eng/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/eng/img/ico_home.png" alt="" /> Home &gt; About Us &gt; <strong>How to get here</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/eng/inc/lnb_about.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>How to get here</h2></div>

		<div class="ac"><img src="/resources/eng/img/location_map.jpg" alt="" /></div>
		<div class="table_info mt30">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:18%;" />
					<col style="width:20%;" />
					<col style="width:62%;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">Devision</th>
						<th scope="col">Station name</th>
						<th scope="col">Where to ride</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">63 Building</th>
						<td>63 Building</td>
						<td class="al">East lobby</td>
					</tr>
					<tr>
						<th scope="row">Line No. 1</th>
						<td>Daebang Station</td>
						<td class="al">40m from Exit No. 6 toward Yeouido</td>
					</tr>
					<tr>
						<th scope="row" rowspan="2">Line No. 5</th>
						<td>Yeoeuinaru Station</td>
						<td class="al">Next to Building No. 6 of Sambu APT toward MBC from Exit No. 4</td>
					</tr>
					<tr>
						<td class="has_bl">Yeoeuido Station</td>
						<td class="al">A temporary bus stop about 20m from Exit No. 5 toward MBC</td>
					</tr>
					<tr>
						<th scope="row">Line No. 9</th>
						<td>Saetgang Station</td>
						<td class="al">10m from Exit No. 1 toward Yeouido Station</td>
					</tr>
				</tbody>
			</table>
		</div>
		<ul class="txt_note v2">
			<li>Weekdays and Saturdays :  11:30 ~ 17:30/21:00 ~ 23:00 Yeoeuido Loop [Via Line No. 5, Yeoeuido Station]</li>
			<li class="mt3">Holidays : 09:00 ~ 23:00 Yeoeuido Loop [Via Line No. 5, Yeoeuido Station]</li>
		</ul>
		<p class="color_brown mt3"><strong>* Shuttle bus services may be delayed due to traffic conditions.</strong></p>
	</div>
</div>
<%@ include file="/WEB-INF/views/eng/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(1, 6, 0);
	});
</script>
</body>
</html>