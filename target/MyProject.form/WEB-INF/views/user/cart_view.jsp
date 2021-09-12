<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/layout/nav.jsp"></jsp:include>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">First</th>
				<th scope="col">Last</th>
				<th scope="col">Handle</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${cart.cartItems}" var="cartItem">
				<tr>
					<th scope="row">1</th>
					<td>${ cartItem.productName}</td>
					<td>${ cartItem.quanlity}</td>
					<td>${ cartItem.priceUnit}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<form method="POST" action="/cart/finish">
		<c:choose>
			<c:when test="${isLogined }">
				<div class="mb-3">
					<label for="customerName" class="form-label">Tên của bạn </label> <input
						type="text" class="form-control" id="customerName"
						name="customerName"
						readonly value="${userLogined.username }">

				</div>
				<div class="mb-3">
					<label for="customerAddress" class="form-label">Địa chỉ</label> <input
						type="text" class="form-control" id="customerAddress"
						name="customerAddress"
						placeholder="nhap dia chi nhan">

				</div>
				<div class="mb-3">
					<label for="customerEmail" class="form-label">Email</label> <input
						type="email" class="form-control" id="customerEmail"
						readonly value="${userLogined.email }">
				</div>
			</c:when>
			<c:otherwise>
				<div class="mb-3">
					<label for="customerName" class="form-label">Tên của bạn </label> <input
						type="text" class="form-control" id="customerName"
						name="customerName"
						>

				</div>
				<div class="mb-3">
					<label for="customerAddress" class="form-label">Địa chỉ</label> <input
						type="text" class="form-control" id="customerAddress"
						name="customerAddress"
						placeholder="nhap dia chi nhan">

				</div>
				<div class="mb-3">
					<label for="customerEmail" class="form-label">Email</label> <input
						type="email" class="form-control" id="customerEmail"
						>
				</div>
			</c:otherwise>
		</c:choose>


		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</body>
</html>