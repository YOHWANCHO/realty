"use strict";
var IMGFILE_EXT = ['jpg','jpeg'];
var VIDEOFILE_EXT = ['mp4','mp3'];

function checkFile(obj,fileKind){	
	if( $(obj).val() != "" ){
		var ext = $(obj).val().split('.').pop().toLowerCase();		
		var arr_ext;
		var msg;
		if(fileKind=='img'){
			arr_ext = IMGFILE_EXT;			
		}else if(fileKind=='video'){
			arr_ext = VIDEOFILE_EXT;
		}
		if($.inArray(ext,arr_ext)<0){
			alert(arr_ext+" 파일만 업로드 가능합니다.");
			$(obj).val("");
		}
	}
}