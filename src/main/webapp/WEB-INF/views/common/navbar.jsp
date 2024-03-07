<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="tags.jsp" %>
<nav class="navbar navbar-expand-sm bg-light">
	<div class="container">
		<ul class="navbar-nav me-auto">
			<li class="nav-item">
				<a class="nav-link" href="/">홈</a>
			</li>
		</ul>
		
		<sec:csrfInput/>
		
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
				<span class="navbar-text me-3">
					<strong><sec:authentication property="principal.name"/></strong>님 환영합니다.
				</span>
				<li class="nav-item">
					<a class="nav-link" href="/logout" onclick="logout(event)">로그아웃</a>
				</li>
			</sec:authorize>
		</ul>
	</div>
</nav>

<%--
	스프링 시큐리티에서 로그아웃 요청은 POST 방식으로 요청해야 한다.
	스프링 시큐리티에서 POST 요청을 보낼 때는 CSRF토큰을 같이 보내야 한다.
	따라서, 로그아웃 링크를 클릭하면, POST 방식으로 폼이 제출되게 해야 한다.
 --%>
<form id="form-logout" method="post" action="logout"><sec:csrfInput/></form>
<script>
	function logout(event){
		event.preventDefault();
		document.getElementById("form-logout").submit();
	}
</script>