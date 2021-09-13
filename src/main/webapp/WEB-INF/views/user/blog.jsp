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
	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
	<!-- navbar -->
	<jsp:include page="/WEB-INF/views/user/layout/navigation.jsp"></jsp:include>
	
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	</div>
	<!-- JavaScript Bundle with Popper -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>

	<div class="container">
		<h1>${blog.title}</h1>
		<p>${blog.createDate }</p>
		<div class="blog_contain">
			${blog.deatilPost}
		
		</div>
	</div>


	<jsp:include page="/WEB-INF/views/user/layout/nav.jsp"></jsp:include>
	<div class="container">
		<div class="product_detail">
			<div class="row">
				<div class="col-md-6 co-sm-12">
					<div class="bx-Img">
						<img
							src="${pageContext.servletContext.contextPath}/uploads/${product.avatar}" />
					</div>
				</div>
				<div class="col-md-6 co-sm-12">
					<div class="detail_product">
						<h3>${product.title}</h3>
						<p>Giới thiệu : ${product.shortDescription}</p>
						<p>
							Price: <span
								class="${ product.priceScale != undefine ? 'decoration-center':''}">
								${product.price} </span>
						</p>
						<p>
							Sale Price: <span> ${product.priceScale} </span>
						</p>
						<button class="btn btn-primary" onclick="addCart(${product.id},1)">Add
							to cart</button>
					</div>
				</div>
			</div>
			<div class="product_description">${product.detailDescription}</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
</body>
</html>