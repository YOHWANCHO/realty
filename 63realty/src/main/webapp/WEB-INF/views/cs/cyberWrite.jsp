<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/top.jsp"%>
<title>사이버 신문고 | 한화63시티</title>
</head>
<body>
<%@ include file="/WEB-INF/views/inc/header.jsp"%>
<div class="location">
	<div class="path"><img src="/resources/img/ico_home.png" alt="" /> Home &gt; 고객지원 &gt; <strong>사이버 신문고</strong></div>
</div>
<div class="container_in">
	<%@ include file="/WEB-INF/views/inc/lnb_cs.jsp"%>
	<div id="contents" class="contents">
		<div class="title_box"><h2>사이버 신문고</h2></div>
		<div class="pos_box">
			<h3 class="tit_black">개인정보수집동의</h3>
			<a href="javascript:;" onclick="MYAPP.Popup('pop_safety');" class="btn_safety"><img src="/resources/img/btn_safety.gif" alt="제보자 보호안내" /></a>
		</div>
		<div class="terms_box">
			<div class="privacy_box">
				<h4>1. 수집하는 개인정보 항목 및 수집 방법</h4>
				<p>회사는 사이버신문고 운영을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p>
				<div class="table_info">
					<table>
						<colgroup>
							<col style="width:30%;" />
							<col style="width:30%;" />
							<col style="width:40%;" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">수집경로</th>
								<th scope="col">필수항목</th>
								<th scope="col">선택항목</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>홈페이지</td>
								<td>성명, 이메일</td>
								<td>소속, 연락처</td>
							</tr>
						</tbody>
					</table>
				</div>
				<p>자동수집항목 : IP주소, 이용내용의 기록<br />- 부당한 방법으로 타인명의를 사용하는 경우에 대비하기 위해 정보이용내역 등을 자동수집 합니다.</p>
			
				<h4>2. 개인정보의 수집 및 이용목적</h4>
				<p>회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</p>
				<div class="table_info">
					<table>
						<colgroup>
							<col style="width:100%;" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">이용목적</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>사이버신문고 접수 및 처리, 현황 관리</td>
							</tr>
						</tbody>
					</table>
				</div>

				<h4>3. 개인정보의 보유 및 이용기간</h4>
				<p>원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. <br />단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.</p>
				<div class="table_info">
					<table>
						<colgroup>
							<col style="width:25%;" />
							<col style="width:75%;" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">보존 항목</th>
								<td class="al">성명, 소속, 이메일, 연락처</td>
							</tr>
							<tr>
								<th scope="row">보존 근거</th>
								<td class="al">소비자의 불만 또는 분쟁 처리에 관한 기록 : 3년<br />개별적으로 이용자의 동의를 받은 경우 : 파기 요청 시까지</td>
							</tr>
						</tbody>
					</table>
				</div>

				<h4>4. 개인정보의 파기절차 및 방법</h4>
				<p>원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 개인정보를 지체 없이 파기합니다.<br />파기절차 및 방법은 다음과 같습니다.</p>
				<div class="table_info">
					<table>
						<colgroup>
							<col style="width:25%;" />
							<col style="width:75%;" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">파기절차</th>
								<td class="al">사용자가 제공한 정보는 목적 달성 후 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다.</td>
							</tr>
							<tr>
								<th scope="row">파기방법</th>
								<td class="al">전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.<br />종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.</td>
							</tr>
						</tbody>
					</table>
				</div>

				<h4>5. 동의를 거부할 권리가 있다는 사실 밑 동의 거부에 따른 불이익 내용(개인정보보호법 제16조)</h4>
				<p>사이버신문고 이용 시 수집하는 필요한 최소한의 정보 외의 개인정보 수집에 동의를 거부할 권리가 있으며 최소한의 개인정보 수집동의 거부 시에는 사이버신문고 이용에 제한이 됩니다.</p>
			</div>
		</div>
		<p class="terms_check">
			<span class="txt">위 내용에 동의하십니까?</span>
			<span class="radio_style"><input type="radio" name="termsCheck" id="termsYes" class="form_chk" /> <label for="termsYes">동의함</label></span>
			<span class="radio_style"><input type="radio" name="termsCheck" id="termsNo" class="form_chk" /> <label for="termsNo">동의안함</label></span>
		</p>

		<h3 class="tit_black">신고자</h3>
		<!-- 입력폼 -->
		<form name="writeForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="writerEmail">
		<input type="hidden" name="writerPhone">
		<div class="table_form">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:13%;" />
					<col style="width:87%;" />
				</colgroup>
				<tbody>
					<tr>
							<th scope="row"><label for="title"><span class="required_txt">필수입력 사항</span> 제목</label></th>
							<td><input type="text" id="title" class="form_input" name="mailTitle"/></td>
						</tr>
						<tr>
							<th scope="row">신고대상</th>
							<td>
								<span class="form_txt ml0"><label for="gubun1">소속</label></span>
								<input type="text" id="gubun1" class="form_input" style="width:145px;" name="corrTeam"/>
								<span class="form_txt"><label for="gubun2">직급</label></span>
								<input type="text" id="gubun2" class="form_input" style="width:95px;" name="corrPosition"/>
								<span class="form_txt"><label for="gubun3">성명</label></span>
								<input type="text" id="gubun3" class="form_input" style="width:115px;" name="corrName"/>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="textarea1"><span class="required_txt">필수입력 사항</span> 신고내용</label></th>
							<td>
								<textarea cols="2" rows="2" id="textarea1" class="form_textarea" style="height:90px;" name="corrContents" placeholder="상담내용 작성시 ‘신고내용’란에 개인정보(주민등록번호, 휴대폰번호 등)는 입력하지 마십시오." title="상담내용 작성시 ‘신고내용’란에 개인정보(주민등록번호, 휴대폰번호 등)는 입력하지 마십시오."></textarea>
								<!-- <p class="txt_byte"><span>0</span>/1000자</p> 2017-12-14 글자수 제한 주석처리 -->
							</td>
						</tr>
						<tr>
							<th scope="row">첨부파일</th>
							<td>
								<div class="file_box">
									<input type="text" value="" readonly class="form_input" style="width:65%;" title="첨부파일" />
									<span class="btn_file">
										<button class="btn_s1">찾아보기</button>
										<input type="file" onchange="$(this).parent().siblings('.form_input').val($(this).val());" title="첨부파일 찾아보기" name="inputFile0"/>
									</span>
									<button type="button" onclick="AddThis($(this).parent());" class="btn_s1 add">추가</button>
									<button type="button" onclick="RemoveThis($(this).parent());" class="btn_s1 delete">삭제</button>
								</div>
								<p class="form_txt2">* 파일용량은 10MB이하만 가능</p>
								<p class="form_txt2 mt0">* 파일명은 영문만 가능 (한글, 특수기호 불가)</p>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="name"><span class="required_txt">필수입력 사항</span> 성명</label></th>
							<td><input type="text" id="name" class="form_input" style="width:115px;" name="writerName"/></td>
						</tr>
						<tr>
							<th scope="row"><label for="dep">소속</label></th>
							<td><input type="text" id="dep" class="form_input" style="width:220px;" name="writerTeam"/></td>
						</tr>
						<tr>
							<th scope="row"><label for="mail"><span class="required_txt">필수입력 사항</span> 이메일</label></th>
							<td>
								<input type="text" id="mail" class="form_input" style="width:115px;" name="writerEmail1"/>
								<span class="form_span">@</span>
								<input type="text" class="form_input" style="width:180px;" title="이메일 도메인 입력" name="writerEmail2"/>
								<select class="form_select" style="width:145px; margin-left:7px;" title="이메일 도메인 선택" name="writerEmail3" onchange='EmailMethod();'>												
									<option value="D">직접입력</option>
									<option value="gmail.com">구글(G메일)</option>
									<option value="naver.com">네이버</option>
									<option value="hanmail.net">다음(한메일)</option>
									<option value="hotmail.com">핫메일</option>
									<option value="nate.com">네이트</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="tel">연락처</label></th>
							<td>
								<select id="tel" class="form_select" style="width:70px;" name="writerPhone1">
									<option value="">선택</option>
									<option value="010" selected="selected">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
								<span class="form_span">-</span>
								<input type="tel" class="form_input" maxlength="4" style="width:70px; ime-mode:disabled;" onkeypress="javascript:GetKey();" name="writerPhone2"/>
								<span class="form_span">-</span>
								<input type="tel" class="form_input" maxlength="4" style="width:70px; ime-mode:disabled;" onkeypress="javascript:GetKey();" name="writerPhone3"/>
							</td>
						</tr>
				</tbody>
			</table>
		</div>
		</form>
		<!-- //입력폼 -->
		<div class="cyber_txt">
			<p>제보해주신 사항은 비밀이 보장됩니다.</p>
		</div>

		<div class="btn_right">
			<a href="javascript:;" onclick="submitAction();" class="btn_m1"><span id="btnText">신고접수</span></a>
			<a href="/" class="btn_m2">취소</a>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
<script>
	$(function(){
		MYAPP.Menu.init(5, 5, 0);
	});

	//전화번호 숫자만
	function GetKey(){
		if (event.keyCode >= 48 && event.keyCode <= 57) {
			event.returnValue = true;
		}else {
			event.returnValue = false;
		}
	}

	//첨부파일 추가, 삭제
	function AddThis(obj) {
		var fileBox = $(obj).parent().children("div.file_box");
		if (fileBox.length > 2) {
			alert("파일 첨부는 3개까지만 가능합니다.");
			return;
		}//
		$(obj).parent().find(".file_box").last().after('<div class="file_box"><input type="text" value="" readonly class="form_input" style="width:65%;" title="첨부파일" /> <span class="btn_file"><button class="btn_s1">찾아보기</button><input type="file" name="inputFile'+fileBox.length+'" onchange="$(this).parent().siblings(\'.form_input\').val($(this).val());" title="첨부파일 찾아보기" /></span></div>');
	}
	function RemoveThis(obj){
		if($(obj).parent().children("div.file_box").length > 1){
			$(obj).parent().children("div.file_box").last().remove();
		}
	}
	
	function EmailMethod() {
		var f = document.writeForm;
		if (f.writerEmail3.value == 'D'){		 // 직접입력이면.
			f.writerEmail2.value = "";
		}else{
			f.writerEmail2.value = f.writerEmail3.value;
		}
	}
	
	function submitAction(){
		var f = document.writeForm;
		
		if(!$("#termsYes").is(':checked')){
			alert("개인정보수집을 동의해 주세요.");
			$("#termsYes").focus();
			return;
		}
		
		if (f.mailTitle.value == ''){
			alert('제목을 입력해 주세요.');
			f.mailTitle.focus();
			return;
		}
		
		if (f.corrContents.value == ''){
			alert('신고내용을 입력해 주세요.');
			f.corrContents.focus();
			return;
		}
		
		if(f.writerName.value == ""){
			alert("성명을 입력해 주세요.");
			f.writerName.focus();
			return;
		}
		
// 		if(f.writerTeam.value == ""){
// 			alert("소속을 입력해 주세요.");
// 			f.writerTeam.focus();
// 			return;
// 		}		
		
		if(f.writerEmail1.value == ""){
			alert("이메일을 입력해 주세요.");
			f.writerEmail1.focus();
			return;
		}
		
		if(f.writerEmail2.value == ""){
			alert("이메일을 입력해 주세요.");
			f.writerEmail2.focus();
			return;
		}
		
		if(f.writerEmail1.value != ""){
			f.writerEmail.value = f.writerEmail1.value+"@"+f.writerEmail2.value;
		}
		
		if(!checkEmail(f.writerEmail.value)){
			alert("이메일 형식이 잘 못 되었습니다.");
			f.writerEmail1.focus();
			return;
		}		

		if(f.writerPhone2.value != ""){
			f.writerPhone.value = f.writerPhone1.value+"-"+f.writerPhone2.value+"-"+f.writerPhone3.value;;	
		}
		
		if($("#btnText").text()=="등록중"){
			return;
		}
		$("#btnText").text("등록중");
		
		f.action = "/cs/cyber_writeAction";
		f.submit();
		
	}
	
</script>
</body>
</html>