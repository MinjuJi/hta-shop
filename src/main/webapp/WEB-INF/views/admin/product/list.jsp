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
					<col width="35%">
					<col width="10%">
					<col width="20%">
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
				<tbody>
					<c:forEach var="product" items="${products }" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td>${product.category.name }</td>
							<td>${product.name }</td>
							<td>${product.company.no }</td>
							<td><fmt:formatNumber value="${product.price }"/> 원</td>
							<td><button class="btn btn-outline-primary btn-sm" onclick="showProductInfo(${product.no})">상세보기</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<!-- 부트스트랩 팝업 -->
<div class="modal" tabindex="-1" id="modal-product-info">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">사용자 상세정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table class="table">
					<tbody>
						<tr>
							<th>번호</th>
							<td><span id="product-no"></span></td>
							<th>이름</th>
							<td><span id="product-name"></span></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><span id="product-price"></span></td>
							<th>제조회사</th>
							<td><span id="company-name"></span></td>
						</tr>
						<tr>
							<th>설명</th>
							<td colspan="3"><span id="product-description"></span></td>
						</tr>
						<tr>
							<th>재고</th>
							<td><span id="product-stock"></span></td>
							<th>상태</th>
							<td><span id="product-status"></span></td>
						</tr>
						<tr>
							<th>분류</th>
							<td><span id="product-category"></span></td>
							<th>등록일</th>
							<td><span id="product-created-date"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	// 부트스트랩 모달(팝업창) 객체를 생성한다.
	const myModal = new bootstrap.Modal(document.getElementById('modal-product-info'));
	
	function showProductInfo(no) {
		
		let xhr = new XMLHttpRequest();							// 1. 서버와 HTTP 통신을 하는 XMLHttpRequest 객체를 생성한다.
		xhr.onreadystatechange = function() {					// 2. xhr객체의 readyState값이 변경될 때 마다 실행되는 이벤트핸들러 함수를 등록한다.
			
			if (xhr.readyState == 4 && xhr.status == 200) {		// 5. readyState=4:응답이 왔다. status=200:성공 
				let text = xhr.responseText;					// 6. xhr의 responseText  프로퍼티에서 텍스트응답데이터를 조회한다.
				let product = JSON.parse(text);					// 7. product = {no:1001, name:"TV", price:10000, ...}
				console.log(product)
				
				document.getElementById("product-no").textContent = product.no;
				document.getElementById("product-name").textContent = product.name;
				document.getElementById("product-price").textContent = product.price.toLocaleString();	// toLocaleString(): 회계형식으로 표현
				document.getElementById("company-name").textContent = product.company.name;
				document.getElementById("product-description").textContent = product.description;
				document.getElementById("product-stock").textContent = product.stock;
				document.getElementById("product-status").textContent = product.status;
				document.getElementById("product-category").textContent = product.category.name;
				document.getElementById("product-created-date").textContent = product.createdDate;
				
				myModal.show();
			}
		}
		
		xhr.open("GET", "/admin/products/" + no);				// 3. xhr객체를 초기화한다. 요청방식, 요청URL을 지정한다.
		xhr.send(null);											// 4. 서버로 요청을 보낸다.
		
	}
</script>
</body>
</html>