<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>
<title>상품 상세 정보</title>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="contatiner">
	<div class="row nb-3">
		<div class="col-12">
			<h1>상품 상세 정보</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-3">
			<%@ include file="../common/category.jsp" %>
		</div>
		<div class="col-9">
			<table class="table">
				<colgroup>
					<col width="15%"/>
					<col width="35%"/>
					<col width="15%"/>
					<col width="35%"/>
				</colgroup>
				<tbody>
					<tr>
						<th>상품이름</th>
						<td>${product.name }</td>
						<th>번호</th>
						<td>${product.no }</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>${product.category.name }</td>
						<th>제조회사</th>
						<td>${product.company.name }</td>
					</tr>
					<tr>
						<th>가격</th>
						<td><fmt:formatNumber value="${product.price }"/> 원</td>
						<th>상태</th>
						<td>${product.status }</td>
					</tr>
					<tr>
						<th>수정일자</th>
						<td><fmt:formatDate value="${product.updatedDate }" pattern="yyyy-MM-dd" /></td>
						<th>등록일자</th>
						<td><fmt:formatDate value="${product.createdDate }" pattern="yyyy-MM-dd" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>