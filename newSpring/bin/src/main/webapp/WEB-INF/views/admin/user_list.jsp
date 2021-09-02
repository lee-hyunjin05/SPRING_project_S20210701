<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>ADMIN Page</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="${pageContext.request.contextPath}/admin/admin_main">모꼬지 ADMIN</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading"></div>
						<div class="sb-sidenav-menu-heading">회원관리</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 회원 기능
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${pageContext.request.contextPath}/admin/user_list">회원 목록</a>
								<a class="nav-link" href="${pageContext.request.contextPath}/admin/masterauth">고수 인증</a> 
								<a class="nav-link" href="">회원 삭제</a>
							</nav>
						</div>

						<div class="sb-sidenav-menu-heading">기타 기능</div>
						<a class="nav-link" href="charts.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 신고 목록
						</a> <a class="nav-link" href="tables.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 고수 인증
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>ADMIN
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<p>[ 회원수 : ${total} 명 ]</p>
				<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
				<form method="post" action="${pageContext.request.contextPath}/admin/user_delete">
					<table class="table">
						<tr>
							<th>번호</th>
							<th>ID</th>
							<th>이름</th>
							<th>가입 날짜</th>
							<th>관심 분야</th>
						</tr>
						<c:forEach var="member" items="${user_list}">
							<tr>
								<td><input type="checkbox" value="${member.m_id}" name="m_idArray">${num}</td>
								<td>${member.m_id}</td>
								<td>${member.m_name}</td>
								<td>${member.m_regdate}</td>
								<td>${member.m_field}</td>
							</tr>
							<c:set var="num" value="${num - 1 }"></c:set>
						</c:forEach>
					</table>
					<input type="submit" value="회원 권한 해제">
				</form>

				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="${pageContext.request.contextPath}/admin/user_list?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<a href="${pageContext.request.contextPath}/admin/user_list?currentPage=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="${pageContext.request.contextPath}/admin/user_list?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
				</c:if>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2021</div>
						<div> <a href="#">Privacy Policy</a> &middot; <a href="#">Terms&amp; Conditions</a></div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/array.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/chart-area.js"></script>
	<script src="${pageContext.request.contextPath}/js/chart-bar.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/datatables2.js"></script>
</body>
</html>