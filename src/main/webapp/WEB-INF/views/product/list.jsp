<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>
<title>bootstrap</title>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h1>상품 등록</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-3">
			<div class="card">
				<div class="card-header">상품 카테고리</div>
				<div class="list-group list-group-flush">
					<c:forEach var="category" items="${productCategories}">
						<a href="/product/list?catNo=${category.no }" class="list-group-item list-group-item-action">
							${category.name }
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="col-9">
			<table class="table">
				<colgroup>
					<col width="10">
					<col width="45">
					<col width="15">
					<col width="15">
					<col width="15">
				</colgroup>
				<thead>
					<tr>
						<th>순번</th>
						<th>상품이름</th>
						<th>제조회사</th>
						<th>가격</th>
						<th>순번</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty products }">
							<tr>
								<td colspan="5" class="text-center">상품정보가 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="product" items="${products}">
								<tr>
									<td></td>
									<td><a href="detail?no=${product.no}">${product.name }</a></td>
									<td>${product.company.name }</td>
									<td><fmt:formatNumber value="${product.price }"/></td>
									<td>${product.status }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
</div>
</body>
</html>