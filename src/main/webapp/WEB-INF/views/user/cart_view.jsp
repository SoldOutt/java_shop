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
	<div class="header">
		<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
		<!-- navbar -->
		<jsp:include page="/WEB-INF/views/user/layout/navigation.jsp"></jsp:include>
	</div>
	<div class="shopping_cart container-fluid px-xl-5 mt-5">
		<div class="row">
			<div class="col-lg-8">
				<table>
					<thead>
						<td>Products</td>
						<td>Price</td>
						<td>Quantity</td>
						<td>Total</td>
						<td>Remove</td>
					</thead>
					<tbody>
						<c:forEach items="${cart.cartItems}" var="cartItem">
						<c:if test="${cartItem.quanlity!=0 }">
						
							<tr data-item=${cartItem.productId }>
								<td><img src="${base}/user/img/product-1.jpg" alt="">${cartItem.productName }</td>
								<td class='vnd'>${cartItem.priceUnit}</td>
								<td>
									<div class="product_number">
										<button class="product_reduce">-</button>
										<input data-item="${cartItem.productId}" type="number" class="number_of_product"
											value="${cartItem.quanlity}"/>
										<button class="product_add">+</button>
									</div>
								</td>
								<td class='vnd' id="priceAddOfProduct">${cartItem.priceUnit * cartItem.quanlity}</td>
								<td><button>
										<span>x</span>
									</button></td>
							</tr>
						</c:if>
						</c:forEach>


					</tbody>
				</table>
			</div>
			<div class="col-lg-4">
				<div class="coupon_code">
					<input type="text" placeholder="Coupon Code">
					<button>Apply Coupon</button>
				</div>
				<div class="pay_cart">
					<div class="cart_summary">
						<h3>CART SUMMARY</h3>
					</div>
					<div class="cart_total">
						<div class="">
							<p>Subtotal</p>
							<p id="" class="vnd">$150</p>
						</div>

						<div class="cart_buy">
							<div class="">
								<p>Total</p>
								<p id="total_cart">0</p>
							</div>
							<button id="btnOpenForm">Buy it</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-popup-bg">
		<div class="form-container">
			<button id="btnCloseForm" class="close-button">X</button>
			<h1>Contact Us</h1>
			<p>For more information. Please complete this form.</p>
			<form method="POST" action="/cart/finish">
				<c:choose>
					<c:when test="${isLogined }">
						<div class="mb-3 form-group">
							<label for="customerName" class="form-label">Tên của bạn
							</label> <input type="text" class="form-control" id="customerName"
								name="customerName" readonly value="${userLogined.username }">

						</div>
						<div class="mb-3 form-group">
							<label for="customerAddress" class="form-label">Địa chỉ</label> <input
								type="text" class="form-control" id="customerAddress"
								name="customerAddress" placeholder="nhap dia chi nhan">

						</div>
						<div class="mb-3 form-group">
							<label for="customerEmail" class="form-label">Email</label> <input
								type="email" class="form-control" name="customerEmail"
								id="customerEmail" readonly value="${userLogined.email }">
						</div>
					</c:when>
					<c:otherwise>
						<div class="mb-3 form-group">
							<label for="customerName" class="form-label">Tên của bạn
							</label> <input type="text" class="form-control" id="customerName"
								name="customerName">

						</div>
						<div class="mb-3 form-group">
							<label for="customerAddress" class="form-label">Địa chỉ</label> <input
								type="text" class="form-control" id="customerAddress"
								name="customerAddress" placeholder="nhap dia chi nhan">

						</div>
						<div class="mb-3 form-group">
							<label for="customerEmail" class="form-label">Email</label> <input
								type="email" name="customerEmail" class="form-control"
								id="customerEmail">
						</div>
					</c:otherwise>
				</c:choose>




				<%-- <div class="form-group">
					<label for="">Name</label> <input type="text" class="form-control"
						value="${isLogined?userLogined.username:''} " />
				</div>
				<div class="form-group">
					<label for="">Address</label> <input class="form-control"
						type="text" />
				</div>
				<div class="form-group">
					<label for="">E-Mail Address</label> <input class="form-control"
						value="${isLogined?userLogined.email:''}" type="text" />
				</div>
				<div class="form-group">
					<label for="">Phone Number</label> <input class="form-control"
						value="${isLogined?userLogined.email:''}" type="text" />
				</div> --%>
				<button>Submit</button>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	</div>
	<!-- JavaScript Bundle with Popper -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
	<!-- <script type="text/javascript">
		var arrCartItem = document.querySelectorAll('.number_of_product')
		arrCartItem.forEach(item=>{
			console.log(item)
			item.addEventListener('change',()=>console.log(2))
			item.addEventListener('click',()=>console.log(3))
		})
		
	</script> -->




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
				<div class="mb-3 form-group">
					<label for="customerName" class="form-label">Tên của bạn </label> <input
						type="text" class="form-control" id="customerName"
						name="customerName" readonly value="${userLogined.username }">

				</div>
				<div class="mb-3 form-group">
					<label for="customerAddress" class="form-label">Địa chỉ</label> <input
						type="text" class="form-control" id="customerAddress"
						name="customerAddress" placeholder="nhap dia chi nhan">

				</div>
				<div class="mb-3 form-group">
					<label for="customerEmail" class="form-label">Email</label> <input
						type="email" class="form-control" name="customerEmail"
						id="customerEmail" readonly value="${userLogined.email }">
				</div>
			</c:when>
			<c:otherwise>
				<div class="mb-3 form-group">
					<label for="customerName" class="form-label">Tên của bạn </label> <input
						type="text" class="form-control" id="customerName"
						name="customerName">

				</div>
				<div class="mb-3 form-group">
					<label for="customerAddress" class="form-label">Địa chỉ</label> <input
						type="text" class="form-control" id="customerAddress"
						name="customerAddress" placeholder="nhap dia chi nhan">

				</div>
				<div class="mb-3 form-group">
					<label for="customerEmail" class="form-label">Email</label> <input
						type="email" name="customerEmail" class="form-control"
						id="customerEmail">
				</div>
			</c:otherwise>
		</c:choose>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</body>
</html>