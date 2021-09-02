<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/main/script.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/loginStyle.css" />
<!-- 아이디 비밀번호 찾는  -->
<script type="text/javascript">
	
	function find_m_id(){
		var url="${pageContext.request.contextPath}/member/find_m_id";
		window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=470, height=250");
	}
	
	function find_m_pw(){
		var url="${pageContext.request.contextPath}/member/find_m_pw";
		window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=470, height=300");
	}

</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 네이버 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<!-- 카카오 로그인 --> 
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

</head>
<body onload="bodyOnload()">
<!-- 	<form action="userLoginPro.do" method="post"> -->
  	<%@ include file="/WEB-INF/views/main/header1.jsp"%>
		<div class="auth_page">
			<div class="login_section">
	<form action="${pageContext.request.contextPath}/member/login" method="post">
				<div class="auth_title">로그인</div>
				<div class="auth_input_section">
					<div class="input_item">
						<input type="text" name="m_id" placeholder="아이디" required="required">
					</div>
					<div class="input_item">
						<input type="password" name="m_pw" placeholder="비밀번호" required="required">
					</div>
					<div class="input_item2">
						<div class="save_id">
							<input type="checkbox" id="remember_m_id" name="remember_m_id"/>아이디저장
						</div>
						<div class="search_info">
<%-- 							<a href="${pageContext.request.contextPath}/member/find_m_id">아이디 찾기</a>  --%>
							<a onclick="find_m_id()">아이디 찾기</a> 
<!-- 							<a href=findUserPwForm.do>비밀번호 찾기</a> -->
							<a onclick="find_m_pw()">비밀번호 찾기</a>
						</div>
					</div>
					<div class="input_item">
						<button class="default_bt login_bt" type="submit" id="">로그인</button>
					</div>
				</div>
				</form>
			</div>
					<div style="padding-top: 10px">
						
<!-- 						<a href="https://kauth.kakao.com/oauth/authorize?client_id=142ce1de0bd727a3968c1ff08bfca9be&redirect_uri=http://localhost:8181/springProject01/member/kakaoCallback&response_type=code"> -->
							<div  onclick="kakaoCallBack()">
							<img src="${pageContext.request.contextPath}/img/kakaoBtn.png" id="kakao_btn">
							</div>
<!-- 						</a> -->
					
					<script type="text/javascript">
						function kakaoCallBack(){
							var url="https://kauth.kakao.com/oauth/authorize?client_id=142ce1de0bd727a3968c1ff08bfca9be&redirect_uri=http://localhost:8181/springProject01/member/kakaoCallback&response_type=code";
							window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=470, height=300");
						}
					</script>
										
						<div onclick="document.getElementById('naver_id_login_anchor').click();">
							<img src="${pageContext.request.contextPath}/img/btnG_완성형.png" id="naver_id_login2">
						</div>
					</div>
					<div id="naver_id_login" style="display: none;">
					</div>
					
					<script type="text/javascript">
					  	var naver_id_login = new naver_id_login("6afzdjusqprAB9msW6OV", "http://localhost:8181/springProject01/member/naverCallback");
					  	var state = naver_id_login.getUniqState();
					  	naver_id_login.setButton("white", 2,40);
					  	naver_id_login.setDomain("http://localhost:8181/springProject01/member/login");
					  	naver_id_login.setState(state);
					  	naver_id_login.setPopup();
					  	naver_id_login.init_naver_id_login();
					</script>
		</div>

</body>
	
</html>