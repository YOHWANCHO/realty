<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>한화63시티 관리자</title>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
    <link rel="stylesheet" type="text/css" href="/resources/console/css/common.css" />

<c:if test="${param.error eq 1}">
<script type="text/javascript">
	alert( "로그인 실패");
</script>
</c:if>

<script type="text/javascript">
	function onAdminLogin(fm){
		if(fm.admID.value == "" || fm.admID.value == null){
			alert("ID를 입력해 주십시오.");
			return false;
		}
		if(fm.admPW.value == "" || fm.admPW.value == null){
			alert("비밀번호를 입력해 주십시오.");
			return false;
		}
	}
</script>
</head>
<body>
<!-- login -->
<div class="login_wrap">
	<div class="login_layout">
		<div class="login">
			<h1><img src="/resources/console/img/logo_login.png" alt="" /></h1>
			<h2>운영자 로그인</h2>
			<p class="txt">비밀번호는 외부에 노출되지 않도록 주의하시기 바랍니다.</p>
			<div class="login_form">
				<form action="/console/loginAction" method="POST" onSubmit="return onAdminLogin(this)" name="login_form">
					<!-- 접속IP -->
					<p class="txt_ip">접속IP :${clientIp}</p>
					<!-- //접속IP -->
					<div>
						<span class="txt_id">아이디</span>
						<span class="inputBox"><input type="text" name="admID" value="" class="login_input" /></span>
					</div>
					<div>
						<span class="txt_pw">비밀번호</span>
						<span class="inputBox"><input type="password" name="admPW" value="" class="login_input" /></span>
					</div>
					<button class="btn_login">로그인</button>
				</form>
			</div>
			<p class="copyright">COPYRIGHT© 2017 Hanhwa63City ALL RIGHTS RESERVED.</p>
		</div>
	</div>
</div>
<!-- //login -->
</body>
</html>