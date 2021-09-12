<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- CSS only -->
<jsp:include page="/WEB-INF/views/manager/layout/css.jsp"></jsp:include>
<style type="text/css">
td img {
	max-width: 200px;
}
</style>
</head>
<body>
	<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shop</title>
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
    <link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500;1,600&display=swap"
	rel="stylesheet">
    CSS only
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/responsive.css"> -->
<jsp:include page="/WEB-INF/views/manager/layout/css.jsp"></jsp:include>
</head>

<body>
	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
	<div class="container-fluid px-xl-5 mt-5">
		<div class="row">
			<jsp:include page="/WEB-INF/views/manager/layout/navigation.jsp"></jsp:include>
			<div class="col-lg-9 col-md-8 data">
				<ul class="nav nav-tabs mb-5" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
							data-bs-target="#home" type="button" role="tab"
							aria-controls="home" aria-selected="true">Danh sách sản
							phẩm</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
							data-bs-target="#profile" type="button" role="tab"
							aria-controls="profile" aria-selected="false">Sản phẩm đã xóa</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="contact-tab" data-bs-toggle="tab"
							data-bs-target="#contact" type="button" role="tab"
							aria-controls="contact" aria-selected="false">Gì đó</button>
					</li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<table class="table data_product table-hover ">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Tên sản phẩm</th>
									<th scope="col">Ảnh sản phẩm</th>
									<th scope="col">Giá Tiền</th>
									<th scope="col">Giới thiệu</th>
									<th scope="col">Nổi bật</th>
									<th scope="col">Giá hiện tại</th>
									<th scope="col">Hành động</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="product" items="${products}" varStatus="loop">
									<tr data-id=${product.id }>
										<th>${loop.index+1 }</th>
										<td>${product.title }</td>
										<td><img src="${base}/uploads/${product.avatar }"
											width="100px" height="100px" alt=""></td>
										<td class="vnd">${product.price }</td>
										<td>${product.shortDescription }</td>
										<td>${product.isHot ? "1":"0"}</td>
										<td>${product.priceScale != null?product.priceScale:product.price}</td>
										<td><a class="btn btn-warning btnOpenForm"
											href="/admin/edit-products/${product.id}">Sửa</a>
											<button class="btn btn-danger"
												onClick="deleteProduct(${product.id})">Xóa</button></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="tab-pane fade" id="profile" role="tabpanel"
						aria-labelledby="profile-tab">
						<table class="table data_product table-hover ">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Tên sản phẩm</th>
									<th scope="col">Ảnh sản phẩm</th>
									<th scope="col">Giá Tiền</th>
									<th scope="col">Giới thiệu</th>
									<th scope="col">Mô tả</th>
									<th scope="col">Hành động</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="product" items="${productsDeleted}">
									<tr data-id=${product.id }>
										<th>1</th>
										<td>${product.title }</td>
										<td><img src="${base}/uploads/${product.avatar }"
											width="100px" height="100px" alt=""></td>
										<td class="vnd">${product.price }</td>
										<td>${product.shortDescription }</td>
										<td>${product.priceScale != null?product.priceScale:product.price}</td>
										<td><a class="btn btn-warning btnOpenForm"
											href="/admin/edit-products/${product.id}">Sửa</a>
											<button class="btn btn-danger"
												onClick="deleteProduct(${product.id})">Xóa</button></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="tab-pane fade" id="contact" role="tabpanel"
						aria-labelledby="contact-tab">2</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
	<script src="js/index.js"></script>
	<!-- </body>

</html>
 -->


<%-- 	<jsp:include page="/WEB-INF/views/manager/layout/nav.jsp"></jsp:include>
<h1>Product</h1>
<form method="get" action="/admin/list-products">
	<input name="keyword">
	<button>Search</button>
</form>
<table class="table">
	<thead>
		<tr>
			<th scope="col">#</th>
			<th scope="col">Title</th>
			<th scope="col">Price</th>
			<th scope="col">Descripton</th>

			<th scope="col">Avatar</th>
			<th scope="col">Setting</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="product" items="${products}">
			<tr data-id=${product.id }>
				<th scope="row"></th>
				<td><c:out value="${product.title}"></c:out></td>
				<td><c:out value="${product.price}"></c:out></td>
				<td><c:out value="${product.shortDescription}"></c:out></td>
				<td><img alt=""
					src="${pageContext.servletContext.contextPath}/uploads/${product.avatar}"></td>
				<td><a class="btn btn-warning"
					href="/admin/edit-products/${product.id}">Sửa</a>
					<button class="btn btn-danger"
						onClick="deleteProduct(${product.id})">Xóa</button></td>
			</tr>

		</c:forEach>
	</tbody>
</table> --%>
 



	<!-- JavaScript Bundle with Popper -->
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
		
	<script type="text/javascript">
        	function deleteProduct(id,event) {
        		console.log(event)
        		
				let data = {
					id: id, // lay theo id
        		};
        		
			
				jQuery.ajax({
					url : "/removeProduct/" +id,
					type : "post",
					contentType : "application/json",
					data : JSON.stringify(data),
		
					dataType : "json", // kieu du lieu tra ve tu controller la json
					success : function(jsonResult) {
						console.log(jsonResult)
						var arr = document.querySelectorAll('tr')
						arr.forEach(x=>{if(x.getAttribute('data-id')==id)x.remove()})
					},
					error : function(jqXhr, textStatus, errorMessage) { // error callback 
						
					}
				});
        	}
        
        </script>
</body>
</html>