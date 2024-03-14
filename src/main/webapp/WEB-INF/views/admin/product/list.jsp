<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>
<title>상품 관리</title>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h1>상품 관리</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-3">
			<div class="card">
				<div class="card-header">관리자 메뉴</div>
				<div class="list-group list-group-flush">
					<a href="/admin/user/list" class="list-group-item list-group-item-action">사용자 관리</a>
					<a href="/admin/product/list" class="list-group-item list-group-item-action active">상품 관리</a>
					<a href="" class="list-group-item list-group-item-action">주문 관리</a>
					<a href="" class="list-group-item list-group-item-action">결재 관리</a>
					<a href="" class="list-group-item list-group-item-action">공지사항 관리</a>
				</div>
			</div>
		</div>
		<div class="col-9">
			<h3>상품 목록 <a href="create" class="btn btn-primary btn-sm float-end">신규 상품 등록</a></h3>
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="15%">
					<col width="45%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>순번</th>
						<th>카테고리</th>
						<th>상품이름</th>
						<th>제조사</th>
						<th>가격</th>
						<th></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>