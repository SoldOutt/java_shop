<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Multi Shop</title>
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
</head>

<body>
	<div class="header">
		<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
		<!-- navbar -->
		<jsp:include page="/WEB-INF/views/user/layout/navigation.jsp"></jsp:include>

		<!-- <div class="carousel"> -->
		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="${base}/user/img/carousel-1.jpg" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="${base}/user/img/carousel-2.jpg" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="${base}/user/img/carousel-3.jpg" class="d-block w-100">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<!-- </div> -->
		<div class="featured container-fluid pt-5">
			<div class="row px-xl-5 pb-3">
				<div class="col-lg-3 col-md-6 col-sm-12 mb-5">
					<div class="featured_item">
						<h1 class="fas fa-check"></h1>
						<h5>Quality Product</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-12 mb-5">
					<div class="featured_item">
						<h1 class="far fa-shipping-fast"></h1>
						<h5>Free Shipping</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-12 mb-5">
					<div class="featured_item">
						<h1 class="fas fa-exchange"></h1>
						<h5>14-Day Return</h5>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-12 mb-5">
					<div class="featured_item">
						<h1 class="fas fa-phone-volume"></h1>
						<h5>24/7 Support</h5>
					</div>
				</div>
			</div>
		</div>

		<div class="categories">
			<div class="container-fluid pt-5 mb-4">
				<h2 class="mr-3 mx-xl-5 categories_title">
					<span>Danh mục sản phẩm</span>
				</h2>
			</div>
			<div class="categories_list row mx-xl-5 pb-3">
				<c:forEach items="${categories }" var="category">
					<div class="col-lg-3 col-md-4 col-sm-6 mb-3">
						<a href="/user/category/${category.seo }">
							<div class="categories_item p-4">
								<div class="categories_item-info">
									<div class="name">${category.name}</div>
								</div>
								<i class="fas fa-arrow-right"></i>
							</div>
						</a>
					</div>
				</c:forEach>


			</div>
		</div>
		<div class="featured_product">
			<div class="container-fluid pt-5 mb-4">
				<h2 class="mr-3 mx-xl-5 categories_title">
					<span>Sản phẩm nổi bật</span>
				</h2>
			</div>
			<div class="product_list row mx-xl-5 pb-3">
				<c:forEach var='product' items="${productHot}">
					<div class="col-lg-3 col-md-4 col-sm-6 mb-3">
						<div class="box_product">
							<div class="product_img mb-3">
								<div class="product_bx_img">
									<img src="${base}/uploads/${product.avatar}"
										class="card-img-top" alt="...">
								</div>


								<div class="product_action">
									<a style="cursor: pointer;" onClick="addOneToCart(${product.id},1)" class="action"><i
										class="fas fa-shopping-cart"></i></a> <a href="#" class="action"><i
										class="far fa-heart"></i></a> <a href="#" class="action"><i
										class="fas fa-sync-alt"></i></a> <a href="/user/detailProduct/${product.seo}" class="action"><i
										class="fas fa-search"></i></a>
								</div>
							</div>
							<div class="product_infor pb-3">
								<a href="/user/detailProduct/${product.seo}" class="product_name">${product.title }</a>
								<div class="product_price mt-3">
									<div class="new_price">${product.priceScale }</div>
									<div class="old_price">${product.price}</div>
								</div>
								<div class="rating mt-2">
									<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i> <i class="fas fa-star"></i> <i
										class="fas fa-star"></i>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>
			</div>
		</div>
		<div class="our-blog mt-5">
			<div class="container">
				<h3 class="decoration_center">OUR BLOG</h3>
				<h2 class="text-center mb-5">Latest News & Articles</h2>
				<div class="row">
					<c:forEach items="${blogs}" var="blog">
					
					<div class="col-lg-4 col-sm-12">
						<div class="blog_item">
							<div class="blog_item-img">
								<img src="${base}/uploads/${blog.blogImg}" alt="">
								<div class="blog_item-img--time">
									<p>01</p>
									<strong>JAN</strong>
									<p>2021</p>
								</div>
							</div>
							<a href="/user/blog/${blog.seo}">${blog.title }</a>
							<p>${blog.shortDescription}</p>
							<div class="blog_item-inf"></div>
						</div>
					</div>
					</c:forEach>

				</div>
			</div>
		</div>
		<!-- Footer -->

		<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	</div>
	<!-- JavaScript Bundle with Popper -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
	<!-- <script type="text/javascript">
		console.log("${productJava}")
		console.log("${productHot}")
		console.log()
	</script> -->
</body>

</html>