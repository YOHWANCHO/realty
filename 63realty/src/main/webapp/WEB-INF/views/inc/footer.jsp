<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	</div>
	<!-- //container -->

	<!-- footer -->
	<footer id="footer">
		<div class="footer_in">
			<address><span>서울시 영등포구 63로 50 한화금융센터63</span> <span>사업자등록번호 116-81-13925</span> <span>대표번호 789-6363</span></address>
			<p class="copyright">COPYRIGHT &copy; 2018 Hanwha63City ALL RIGHTS RESERVED</p>
			<a href="javascript:;" onclick="MYAPP.NewWindow.init('/inc/pop_privacy', 'privacy', '700', '500', 'yes');" class="footer_btn">개인정보처리방침</a>
			<a href="javascript:;" onclick="MYAPP.Tab.init('#subscribe_tab');popupOpen('#subscribe_popup')" class="footer_btn btn_subscribe">구독하기</a>
			<div class="family_site">
				<a href="javascript:;" class="family_open">FAMILY SITE</a>
				<ul class="family_list">
					<li><a href="http://www.63.co.kr" target="_blank">63빌딩</a></li>
					<li><a href="http://www.63restaurant.co.kr" target="_blank">63레스토랑</a></li>
					<li><a href="http://www.63convention.co.kr" target="_blank">63컨벤션&amp;웨딩</a></li>
					<li><a href="http://www.63wotc.co.kr" target="_blank">워킹온더클라우드</a></li>
					<li><a href="http://www.63buffet.co.kr" target="_blank">63뷔페 파빌리온</a></li>
					<li><a href="http://www.hanwharesort.co.kr" target="_blank">한화리조트</a></li>
					<li><a href="http://www.aquazium.co.kr" target="_blank">아쿠아리움 개발</a></li>
					<li><a href="http://www.hmbrc.co.kr" target="_blank">해양생물연구센터</a></li>
					<li><a href="http://cips.63city.co.kr" target="_blank">IPS</a></li>
					<li><a href="http://www.hanwha.co.kr" target="_blank">한화그룹사이트</a></li>
				</ul>
			</div>
		</div>
	</footer>
	<!-- //footer -->
	
	<!-- 구독하기 팝업 -->
	<div id="subscribe_popup" class="layer_popup mfp-hide">
		<h3 class="popup_title"><span class="color_org">부동산 자료</span> 구독하기</h3>
		<div class="tabmenu" id="subscribe_tab">
			<ul>
				<li class="on"><a href="#subscribe_con1">구독하기</a></li>
				<li><a href="#subscribe_con2">구독 취소하기</a></li>
			</ul>
		</div>
		<!-- 구독하기 탭 -->
		<form name="readerRegistForm">
			<div class="tab_con" id="subscribe_con1">
				<h4>부동산 자료 구독 수신동의</h4>
				<p class="txt1">㈜한화63시티에서 고객님께 다양한 부동산 소식과 정보를 보내드리고자합니다. <br />수신을 원하신다면 아래의 이메일 수신동의 절차에 참여해주시기 바랍니다.</p>
				<div class="terms_box">
					약관
				</div>
				<p class="terms_check"><label><input type="checkbox" name="chkRadioReder"  class="form_chk" /> <span>본 약관에 동의하고 부동산자료를 구독하겠습니다. <em class="color_org"> (필수)</em></span></label></p>
				<div class="table_form">
					<table>
						<caption></caption>
						<colgroup>
							<col style="width:13%;" />
							<col style="width:37%;" />
							<col style="width:13%;" />
							<col style="width:37%;" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="subs_name"><span class="required_txt">필수입력 사항</span> 성명</label></th>
								<td>
									<input type="text" id="subs_name" class="form_input" style="width:99%;" placeholder="성명을 입력해주세요." name="readerName"/>
								</td>
								<th scope="row"><label for="subs_dept"><span class="required_txt">필수입력 사항</span> 소속</label></th>
								<td>
									<input type="text" id="subs_dept" class="form_input" style="width:99%;" placeholder="소속을 입력해주세요."  name="readerTeam"/>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="required_txt">필수입력 사항</span> 이메일</th>
								<td colspan="3">
									<input type="text" class="form_input" style="width:145px;" placeholder="메일ID를 입력해주세요." title="메일ID를 입력해주세요." name="writerEmail1"/>
									<span class="form_span">@</span>
									<input type="text" class="form_input" style="width:180px;" placeholder="메일 도메인을 입력해주세요." title="메일 도메인을 입력해주세요." name="writerEmail2"/>
									<select class="form_select" style="width:145px; margin-left:7px;" title="메일 도메인을 선택해주세요." name="writerEmail3" onchange='readerEmailMethod(document.readerRegistForm);'>
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
								<th scope="row"><label for="subs_tel"><span class="required_txt">필수입력 사항</span> 연락처</label></th>
								<td colspan="3">
									<select id="subs_tel" class="form_select" style="width:70px;"  name="readerPhone1">
										<option value="010" selected="selected">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
									<span class="form_span">-</span>
									<input type="tel" class="form_input" maxlength="4" style="width:70px; ime-mode:disabled;" onkeypress="MYAPP.NumKey();" name="readerPhone2"/>
									<span class="form_span">-</span>
									<input type="tel" class="form_input" maxlength="4" style="width:70px; ime-mode:disabled;" onkeypress="MYAPP.NumKey();" name="readerPhone3"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
	
				<ul class="txt_note v2">
					<li>고객님의 이메일 주소를 정확히 입력해주시기 바랍니다.</li>
					<li>기존 구독 고객님 중 구독을 취소하고 싶으신 경우, 상단의 구독 취소하기를 확인하세요.</li>
				</ul>
				<div class="btn_center">
					<a href="javascript:submitReader(document.readerRegistForm,'Y');" class="btn_m1">등록하기</a>
				</div>
			</div>
		</form>
		<!-- //구독하기 탭 -->

		<!-- 구독 취소하기 탭 -->
		<form name="readerCancelForm">
			<div class="tab_con" id="subscribe_con2">
				<h4>부동산 자료 구독 취소</h4>
				<p class="txt1">부동산 자료 구독을 취소하시려면 이메일을 입력해주세요. <br />관리자가 확인 후 이메일리스트는 파기처리됩니다.</p>
				<div class="table_form">
					<table>
						<caption></caption>
						<colgroup>
							<col style="width:13%;" />
							<col style="width:87%;" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="subs_name2"><span class="required_txt">필수입력 사항</span> 성명</label></th>
								<td>
									<input type="text" id="subs_name2" class="form_input" style="width:223px;" placeholder="성명을 입력해주세요." name="readerName"/>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="required_txt">필수입력 사항</span> 이메일</th>
								<td>
									<input type="text" class="form_input" style="width:145px;" placeholder="메일ID를 입력해주세요." title="메일ID를 입력해주세요." name="writerEmail1"/>
									<span class="form_span">@</span>
									<input type="text" class="form_input" style="width:170px;" placeholder="메일 도메인을 입력해주세요." title="메일 도메인을 입력해주세요." name="writerEmail2"/>
									<select class="form_select" style="width:145px; margin-left:7px;" title="메일 도메인을 선택해주세요." name="writerEmail3" onchange='readerEmailMethod(document.readerCancelForm);'>
										<option value="D">직접입력</option>
										<option value="gmail.com">구글(G메일)</option>
										<option value="naver.com">네이버</option>
										<option value="hanmail.net">다음(한메일)</option>
										<option value="hotmail.com">핫메일</option>
										<option value="nate.com">네이트</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<ul class="txt_note v2">
					<li>부동산 자료를 구독받는 고객님의 이메일 주소를 정확히 입력해주시기 바랍니다.</li>
				</ul>
				<div class="btn_center">
					<a href="javascript:submitReader(document.readerCancelForm,'N');" class="btn_m1">등록하기</a>
				</div>
			</div>
		</form>
		<!-- //구독 취소하기 탭 -->
		<a href="javascript:;" class="popup_close mfp-close">닫기</a>
	</div>
	<!-- //구독하기 팝업 -->
</div>
<!-- //wrap -->

<script src="/resources/js/front.js"></script>
<script>
	//빌딩관리 팝업
	function popupOpen(target){
		$.magnificPopup.open({
			items: {
				src: target
			},
			showCloseBtn:false,
			closeOnBgClick:false,
			mainClass: 'mfp-fade',
			removalDelay: 300
		});
	}
</script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-112323130-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-112323130-1');
</script>
