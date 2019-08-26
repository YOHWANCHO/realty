$(document).ready(function(){	
	$('.comment-write').on('keyup',function(){
		if($(this).val().length>300){
			$(this).val($(this).val().substring(0, 300));
		}
		$('.comment-count').html($(this).val().length);
	});
});

function onPaging(fm, index){
	if( index != null)
	{
		fm.pageIndex.value= index;
		fm.submit();	
	}
}

function goBoardView(url){
	var f = $('form[name=searchForm]');
	f.attr("method","post");
	f.attr("action",url);
	f.submit();
}

function ajaxPopupOpen(){
	var flag=$("#_ajax_property_popup").html();
	if(flag!=""){
		popupOpen("#_ajax_property_popup");
	}else{
		var url="";
		
		if (document.location.protocol == 'http:') {
			url='/ajaxHttp/getPropertyHtml';
	    }else{
	    	url='/ajax/getPropertyHtml';
	    }
		
		$.ajax({
			url:url,
			dataType:'html',
			type:'POST',
			data : 
			{
				
			},
			success:function(result){				
				$("#_ajax_property_popup").html(result);
				popupOpen("#_ajax_property_popup");
			},
			error:function(request,status,error){
				alert("에러");
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
	}
	
}

function ajaxFindPopupOpen(frm, pageIndex, bldZone){
	
	var pBldZone="";
	var pSearchText = "";
	var pPageIndex = 0;
	if(frm == ""){
		pBldZone = bldZone;
	}else{
		pSearchText = frm.searchText.value;
		pBldZone = frm.bldZone.value;
		pPageIndex = pageIndex;
	}
	
	var flag=$("#_ajax_property_popup").html();
	
	var url="";
	
	if (document.location.protocol == 'http:') {
		url='/ajaxHttp/getPropertyHtml';
    }else{
    	url='/ajax/getPropertyHtml';
    }
	
	$.ajax({
		url:url,
		dataType:'html',
		type:'POST',
		data : 
		{
			bldZone : pBldZone				
			,searchText : pSearchText
			,pageIndex : pPageIndex
		},
		success:function(result){
			$("#_ajax_property_popup").html(result);
			popupOpen("#_ajax_property_popup");
		},
		error:function(request,status,error){
			alert("에러");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function selecBbldDivision(obj){
	var param = $(obj).val();
	if(param==""){
		$("#bldDivision").empty();
		$("#bldDivision").html("<option value=''>빌딩구분</option>");
		$("#bldInfoSeq").empty();
		$("#bldInfoSeq").html("<option value=''>빌딩명 선택</option>");
		return;
	}
	$.ajax({
		url:'/ajax/findBLDDivision',
		dataType:'json',
		type:'POST',
		data : 
		{
			bldCodeSeq : param
		},
		success:function(result){
			
			var HTML = "<option value=''>빌딩구분</option>";			
	        
			for(var i in result.list) {
				HTML += "<option value='"+result.list[i].bldCodeSeq+"'>"+result.list[i].codeName+"</option>";
	        }						
			
			$("#bldDivision").empty();
			$("#bldDivision").html(HTML);
			$("#bldInfoSeq").empty();
			$("#bldInfoSeq").html("<option value=''>빌딩명 선택</option>");
		},
		error:function(request,status,error){
			alert("에러");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function selecBldInfoSeq(id,obj,bldFlagMg, bldFlagCu){
	var param1 = $("#"+id).val();
	var param2 = $(obj).val();
	
	$.ajax({
		url:'/ajax/findBLDInfo',
		dataType:'json',
		type:'POST',
		data : 
		{
			bldZone : param1,
			bldDivision : param2,
			bldFlagCu : bldFlagCu
		},
		success:function(result){
			
			var HTML = "<option value=''>빌딩명 선택</option>";			
			
			for(var i in result.list) {
				HTML += "<option value='"+result.list[i].bldCodeSeq+"'>"+result.list[i].codeName+"</option>";
			}
			
			$("#bldInfoSeq").empty();
			$("#bldInfoSeq").html(HTML);
		},
		error:function(request,status,error){
			alert("에러");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}



//이메일 체크
function checkEmail(emailAddr){
		
	var regExp = /^[0-9a-zA-Z]([-_]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;		
	// 검증에 사용할 정규식 변수 regExp에 저장
	if (emailAddr.match(regExp) != null) {
		var isGood = true;
	}else {
		var isGood = false;
	}
	return isGood;
}

//핸드폰 체크
function checkPhoneNum(num){
	
	var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	// 검증에 사용할 정규식 변수 regExp에 저장
	if (num.match(regExp) != null) {
		var isGood = true;
	}else {
		var isGood = false;
	}
	return isGood;
}

function readerEmailMethod(f) {	
	if (f.writerEmail3.value == 'D'){		 // 직접입력이면.
		f.writerEmail2.value = "";
	}else{
		f.writerEmail2.value = f.writerEmail3.value;
	}
}

function submitReader(frm,gubn){
	
	if(gubn == "Y"){
		if(!frm.chkRadioReder.checked){
			alert("약관에 동의하여 주세요.");
			frm.chkRadioReder.focus();
			return;
		}
	}
	
	if(frm.readerName.value == ""){
		alert("성명을 입력해 주세요.");
		frm.readerName.focus();
		return;
	}
	if(gubn == "Y"){
		if(frm.readerTeam.value == ""){
			alert("소속을 입력해 주세요.");
			frm.readerTeam.focus();
			return;
		}
	}
	if(frm.writerEmail1.value == ""){
		alert("이메일을 입력해 주세요.");
		frm.writerEmail1.focus();
		return;
	}	
	if(frm.writerEmail2.value == ""){
		alert("이메일을 입력해 주세요.");
		frm.writerEmail2.focus();
		return;
	}	
	var email = frm.writerEmail1.value+"@"+frm.writerEmail2.value; 
	if(!checkEmail(email)){
		alert("이메일 형식이 아닙니다.");
		return;
	}
	
	if(gubn == "Y"){
		if(frm.readerPhone2.value == ""){
			alert("연락처를 입력해 주세요.");
			frm.readerPhone2.focus();
			return;
		}	
		if(frm.readerPhone3.value == ""){
			alert("연락처를 입력해 주세요.");
			frm.readerPhone3.focus();
			return;
		}
	}
	var readerName = frm.readerName.value;
	if(gubn == "Y"){
		var readerTeam = frm.readerTeam.value;
		var readerPhone = frm.readerPhone1.value+frm.readerPhone2.value+frm.readerPhone3.value;		
	}
		
	if(gubn == ""){
		alert("정상적인 접근이 아닙니다.");
		return;
	}
	
	$.ajax({
		url:'/ajaxUser/registCancelReder',
		dataType:'json',
		type:'POST',
		data : 
		{
			userFlag : gubn,
			readerName : readerName,
			cancelName : readerName,
			readerTeam : readerTeam,
			readerPhone : readerPhone,
			email : email,
		},
		success:function(data){			
			if(data.result == "REG"){
				alert("구독 등록 되었습니다.");
				frm.readerName.value = "";
				frm.readerTeam.value = "";
				frm.readerPhone1.value = "010";
				frm.readerPhone2.value = "";
				frm.readerPhone3.value = "";
				frm.writerEmail1.value = "";
				frm.writerEmail2.value = "";
				frm.writerEmail3.value = "D";
				$.magnificPopup.close();
			}else if(data.result == "DUP"){
				alert("이미 구독 등록된 이메일 입니다.");
				
			}else if(data.result == "UP"){
				alert("구독 취소 되었습니다.");
				frm.readerName.value = "";
				frm.writerEmail1.value = "";
				frm.writerEmail2.value = "";
				frm.writerEmail3.value = "D";
				$.magnificPopup.close();
			}else if(data.result == "NOUP"){
				alert("구독 등록된 이메일이 없습니다.\n이메일을 확인해 주세요.");
				
			}else{
				alert("잘못된 접근입니다.");
			}
		},
		error:function(request,status,error){
			alert("에러");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}