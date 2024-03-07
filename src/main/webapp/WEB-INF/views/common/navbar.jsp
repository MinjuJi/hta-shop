<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="tags.jsp" %>
<nav class="navbar navbar-expand-sm bg-light">
	<div class="container">
		<ul class="navbar-nav me-auto">
			<li class="nav-item">
				<a class="nav-link" href="/">홈</a>
			</li>
		</ul>
		<ul class="navbar-nav">
			<sec:authorize access="isAnonymous()">
				<li class="nav-item">
					<a class="nav-link" href="/login">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/register">회원가입</a>
				</li>
			</sec:authorize>
			
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item">
					<a class="nav-link" href="/logout">로그아웃</a>
				</li>
			</sec:authorize>
		</ul>
	</div>
</nav>