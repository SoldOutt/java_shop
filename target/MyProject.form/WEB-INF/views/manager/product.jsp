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
	max-width: 200px;}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/manager/layout/nav.jsp"></jsp:include>
	<h1>Product</h1>
	<form method = "get" action="/manager/list-products">
		<input name="keyword">
		<button>Search</button>
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
					<tr>
						<th scope="row"></th>
						<td><c:out value="${product.title}"></c:out></td>
						<td><c:out value="${product.price}"></c:out></td>
						<td><c:out value="${product.shortDescription}"></c:out></td>
						<td><img alt=""
							src="${pageContext.servletContext.contextPath}/uploads/${product.avatar}"></td>
						<td><a class="btn btn-warning"
							href="/manager/edit-products/${product.id}">Sửa</a> 
							<button class="btn btn-danger" onClick="deleteProduct(${product.id})">Xóa</button></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
	</form>



	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		<script type="text/javascript">
        	function deleteProduct(id) {
        		// javascript object.
        		// data la du lieu ma day len action cua controller
				let data = {
					id: id, // lay theo id
        		};
        		
				// $ === jQuery
				// json == javascript object
				jQuery.ajax({
					url : "/removeProduct",
					type : "POST",
					contentType : "application/json",
					data : JSON.stringify(data),
		
					dataType : "json", // kieu du lieu tra ve tu controller la json
					success : function(jsonResult) {
						
						console.log(jsonResult)
					},
					error : function(jqXhr, textStatus, errorMessage) { // error callback 
						
					}
				});
        	}
        </script>
</body>
</html>