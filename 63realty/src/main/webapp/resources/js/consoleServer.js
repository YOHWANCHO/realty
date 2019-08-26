;var _imgFile = ['PNG','JPG','JPEG','BMP','GIF'];
var _movFile = ['MP4','MP3'];
var _pdfFile = ['PDF'];
var _fileMaxSize  = 500 * 1024 * 1024;

function onPaging(fm, index){
		if( index != null)
		{
			fm.pageIndex.value= index;
			fm.submit();	
		}
	}
/* 필수항목 체크 */
function checkValue(obj, msg) {
	if (obj.val() == '') {
		alert(msg);
		obj.focus();
		return true;
	} else
		return false;
}

//maxlength 만큼만 입력
function inputLengthCheck(eventInput) {
	var inputText = $(eventInput).val();
	var inputMaxLength = $(eventInput).prop("maxlength");
	var j = 0;
	var count = 0;
	for (var i = 0; i < inputText.length; i++) {
		val = escape(inputText.charAt(i)).length;
		if (val == 6) {
			j++;
			j++; //한글이 3byte일 경우에는 두번 증가한다.
		}
		j++;
		if (j <= inputMaxLength) {
			count++;
		}
	}
	if (j > inputMaxLength) {
		$(eventInput).val(inputText.substr(0, count));
	}
}


//숫자만 입력
function onlyNumber(event){
	
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9 ){
		return;
	}else{
		return false;
	}
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

function phoneFomatter(num,type){
    
    var formatNum = '';
    
    if(num.length==11){
        if(type==0){
            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-****-$3');
        }else{
            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
        }
    }else if(num.length==8){
        formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
    }else{
        if(num.indexOf('02')==0){
            if(type==0){
                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-****-$3');
            }else{
                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
            }
        }else{
            if(type==0){
                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-***-$3');
            }else{
                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
            }
        }
    }
    return formatNum;
}

function chkPw(pw){
	var check = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{3,16}$/;
	if (!check.test(pw)) {
	    return false;
	} else {
	    return true
	}
}

function selecBbldDivision(obj){
	var param = $(obj).val();
	
	if(param == ""){
		$("#bldDivision").empty();
		$("#bldDivision").html("<option value=''>빌딩명 선택</option>");
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

//관리자 리스트
function findAdminList(index){
	var searchType = $("#searchType").val();
	var searchText = $("#searchText").val();
	var index = index;
	$.ajax({
		url:'/ajax/findAdminList',
		dataType:'html',
		type:'POST',
		data : 
		{
			searchType : searchType,
			searchText : searchText,
			pageIndex : index
		},
		success:function(result){
			$("#ajaxSearchTable").empty();
			$("#ajaxSearchTable").html(result);
		},
		error:function(request,status,error){
			alert("에러");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

//관리자정보
function findAdminOne(admID){
	$.ajax({
		url:'/ajax/findAdminOne',
		dataType:'json',
		type:'POST',
		data : 
		{
			admID : admID
		},
		success:function(result){			
			if(result.msg=="true"){
				$("#admID").text(result.result.admID);
				$("#admName").text(result.result.admName);
				$("#departmentName").text(result.result.departmentName);
				$("#email").text(result.result.email);
				$("#telnum").text(result.result.telnum);
				$("#mobilenum").text(result.result.mobilenum);
				popupOpen('#pop_menu');
			}else{
				alert(result.msg);
			}
		},
		error:function(request,status,error){
			alert("에러");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}


function selecBldInfoSeq(id,obj){
	var param1 = $("#"+id).val();
	var param2 = $(obj).val();
	
	$.ajax({
		url:'/ajax/findBLDInfo',
		dataType:'json',
		type:'POST',
		data : 
		{
			bldZone : param1,
			bldDivision : param2
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

function selecBldInfoSeqManager(id,obj){
	var param1 = $("#"+id).val();
	var param2 = $(obj).val();
	
	$.ajax({
		url:'/ajax/findBLDInfoForManager',
		dataType:'json',
		type:'POST',
		data : 
		{
			bldZone : param1,
			bldDivision : param2
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


function checkFile(){
	var msg="";
	//파일 확장자 비교
	$(".attachFile_").each(function(){
		var ext = $(this).val().split('.').pop().toUpperCase();
		if(ext != ""){
			if( $(this).data("file-type") == "img" ){		//이미지 확장자 비교
				if($.inArray(ext, _imgFile) == -1) {
					msg = "이미지 파일은 "+_imgFile+" 파일만 업로드 할수 있습니다.";
					return false;
				}
			}else if($(this).data("file-type") == "mov" ){		//동영상,음악 확장자 비교
				if($.inArray(ext, _movFile) == -1) {
					msg = "동영상 파일은 "+_movFile+" 파일만 업로드 할수 있습니다.";
					return false;
				}
			}else if($(this).data("file-type") == "pdf" ){		//pdf 확장자 비교
				if($.inArray(ext, _pdfFile) == -1) {
					msg = "PFD 파일만 업로드 할수 있습니다.";
					return false;
				}
			}
		}
	});
	
	return msg;
}

function fileCancle(obj){	
	$.each($(obj).parent().find("input"),function(e){		
		$(this).val("");
	});
}

//첨부파일 삭제
function deleteBuildingFile(filePath,bldInfoFileSeq,obj){
	if(!confirm("삭제하시겠습니까?")){
		return;
	}
	$.ajax({
		url:'/ajax/deleteBuildingFile',
		dataType:'json',
		type:'POST',
		data : 
		{
			filePath : filePath,
			bldInfoFileSeq : bldInfoFileSeq
		},
		success:function(result){
			alert(result.msg);
			if(result.result=="Y"){				
				$(obj).parent().parent().find("input").each(function(){
					$(this).val("");
				});
				$(obj).parent().prev().css("display","");
				$(obj).parent().remove();				
			}
		},
		error:function(request,status,error){
			alert("에러");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}

	});
}
	
//첨부파일 삭제
	function deleteOneFile(filePath,boardID,fileFormName,obj){
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		$.ajax({
			url:'/ajax/deleteOneFile',
			dataType:'json',
			type:'POST',
			data : 
			{
				filePath : filePath,
				boardID : boardID,
				fileFormName:fileFormName
			},
			success:function(result){
				alert(result.msg);
				if(result.result=="Y"){				
					$(obj).parent().parent().find("input").each(function(){
						$(this).val("");
					});
					$(obj).parent().prev().css("display","");
					$(obj).parent().remove();			
					$("#tdText").text("업로드 된 첨부파일이 없습니다.");
				}
			},
			error:function(request,status,error){
				alert("에러");
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
}
	//첨부파일 삭제
	function deleteMainBoardFile(filePath,mainBoardFileSeq,obj){
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		$.ajax({
			url:'/ajax/deleteMainBoardFileSeq',
			dataType:'json',
			type:'POST',
			data : 
			{
				filePath : filePath,
				mainBoardFileSeq : mainBoardFileSeq
			},
			success:function(result){
				alert(result.msg);
				if(result.result=="Y"){				
					$(obj).parent().parent().find("input").each(function(){
						$(this).val("");
					});
					$(obj).parent().prev().css("display","");
					$(obj).parent().remove();				
				}
			},
			error:function(request,status,error){
				alert("에러");
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}

		});
	}
	
	//첨부파일 삭제
	function deleteCustVoiceFile(filePath,custVoiceSeq,custVoiceType,obj){
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		$.ajax({
			url:'/ajax/deleteCustVoiceFile',
			dataType:'json',
			type:'POST',
			data : 
			{
				filePath : filePath,
				custVoiceType : custVoiceType,
				custVoiceSeq : custVoiceSeq
			},
			success:function(result){
				alert(result.msg);
				if(result.result=="Y"){				
					$(obj).parent().parent().find("input").each(function(){
						$(this).val("");
					});
					$(obj).parent().prev().css("display","");
					$(obj).parent().remove();				
				}
			},
			error:function(request,status,error){
				alert("에러");
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});
	}

	//목록으로 가기 버튼
	function goList(url){		
		var indexUrl;
		if(url.lastIndexOf("_modify")>-1){
			indexUrl = url.lastIndexOf("_modify");
		}else if(url.lastIndexOf("_write")>-1){
			indexUrl = url.lastIndexOf("_write");
		}else if(url.lastIndexOf("_view")>-1){
			indexUrl = url.lastIndexOf("_view");
		}		
		url = url.substring(0,indexUrl);
		location.href = url;
	}
	
	
	function deleteMainBoardText(mainBoardSeq,url){
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		
		if(url.lastIndexOf("_modify")>-1){
			var indexUrl = url.lastIndexOf("_modify");
		}else if(url.lastIndexOf("_view")>-1){
			var indexUrl = url.lastIndexOf("_view");
		}
						
		url = url.substring(0,indexUrl);
		location.href = url+"_delete?mainBoardSeq="+mainBoardSeq;		
	}
	
	function deleteAdminMember(admID){
		if(!confirm("삭제하시겠습니까?")){
			return;
		}		
		location.href = "/console/superAdmin/console_delete/"+admID;		
	}
	
	function deleteBldManager(bldManagerSeq){
		if(!confirm("삭제하시겠습니까?")){
			return;
		}		
		location.href = "/console/superAdmin/manager_delete/"+bldManagerSeq;		
	}
	
	function deleteBuilding(bldInfoSeq){
		if(!confirm("삭제하시겠습니까?")){
			return;
		}		
		location.href = "/console/contents/building_delete/"+bldInfoSeq;		
	}
	
	function goBoardView(url){
		var f = $('form[name=searchForm]');
		f.attr("method","get");
		f.attr("action",url);
		f.submit();
	}
	
	function deleteGreehHouseYear(grYear){
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		location.href = "/console/contents/greenhouse_delete?grYear="+grYear;		
	}
	
	function deleteBalanceYear(blYear,url){
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		
		if(url.lastIndexOf("_modify")>-1){
			var indexUrl = url.lastIndexOf("_modify");
		}else if(url.lastIndexOf("_view")>-1){
			var indexUrl = url.lastIndexOf("_view");
		}
		
		url = url.substring(0,indexUrl);
		location.href = url+"_delete?blYear="+blYear;		
	}
	
	