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
	<div class="detail_product px-xl-5 mt-5">
		<div class="row">
			<div class="col-lg-5 detail_product-img">

				<img id="zoom_01" src="${base}/uploads/${product.avatar}"
					alt="anh san pham"
					data-zoom-image="${base}/uploads/${product.avatar}" />
			</div>
			<div class="col-lg-7 detail_product-infor">
				<h3 class="product_name">${product.title }</h3>
				<div class="product_rating">
					<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star"></i>
				</div>
				<div class="product_price">
					<h4>${product.priceScale}</h4>
				</div>
				<div class="product_description">${product.shortDescription }</div>

				<div class="product_cart">
					<div class="product_number">
						<button class="product_reduce">-</button>
						<input type="text" id="number_of_product" value="0">
						<button class="product_add">+</button>
					</div>
					<div class="product_addcart" onclick="addCart()">
						<i class="fas fa-shopping-cart"></i><span>Add To Cart</span>
					</div>
				</div>
				<div class="product_share">
					<span>Share on: </span> <i class="fab fa-facebook-f"></i> <i
						class="fab fa-twitter"></i> <i class="fab fa-linkedin-in"></i>
				</div>
			</div>
		</div>
		<div class="product_review px-xl-5 mt-5 pt-5 p-3">
			<div class="product_review-cat">
				<ul>
					<li data-review="0" class="active">Description</li>

					<li data-review="1">Reviews(<span>1</span>)
					</li>
				</ul>
				<div class="product_review-tab">
					<div class="active">${product.detailDescription }</div>

					<div class="">
						<div class="row">
							<div class="col-lg-6">
								<h3>1 review for "Product Name"</h3>
								<div class="customer_review">
									<div class="customer_img">
										<img src="${base}/user/img/user.jpg" alt="">
									</div>
									<div class="customer_box_review">
										<h5>
											John Doe <span> - 01 Jan 2045</span>
										</h5>
										<div class="customer_review-rating">
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i>
										</div>
										<p>Diam amet duo labore stet elitr ea clita ipsum, tempor
											labore accusam ipsum et no at. Kasd diam tempor rebum magna
											dolores sed sed eirmod ipsum.</p>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<h3>Leave a review</h3>
								<form id="form_review" action="">
									<div class="your_rating">
										<p>Your Rating * :</p>
										<i class="far fa-star"></i> <i class="far fa-star"></i> <i
											class="far fa-star"></i> <i class="far fa-star"></i> <i
											class="far fa-star"></i>
									</div>
									<label for="write_review">Your Review *</label>
									<textarea id="write_review"></textarea>
									<label for="write_name">Your Name *</label> <input type="text"
										id="write_name"> <label for="write_email">Your
										Email *</label> <input type="email" id="write_email">
									<button>Post</button>

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="featured_product">
		<div class="container-fluid pt-5 mb-4">
			<h2 class="mr-3 mx-xl-5 categories_title">
				<span>CÃ³ thá» báº¡n cÅ©ng thÃ­ch</span>
			</h2>
		</div>
		<div class="product_list row mx-xl-5 pb-3">
			<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
				<div class="box_product">
					<div class="product_img mb-3">
						<img src="${base}/user/img/product-5.jpg" alt="">
						<div class="product_action">
							<a href="#" class="action"><i class="fas fa-shopping-cart"></i></a>
							<a href="#" class="action"><i class="far fa-heart"></i></a> <a
								href="#" class="action"><i class="fas fa-sync-alt"></i></a> <a
								href="#" class="action"><i class="fas fa-search"></i></a>
						</div>
					</div>
					<div class="product_infor pb-3">
						<a href="detail_product.html" class="product_name">Product
							Name Goes Here</a>
						<div class="product_price mt-3">
							<div class="new_price">$123.00</div>
							<div class="old_price">$200.00</div>
						</div>
						<div class="rating mt-2">
							<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
				<div class="box_product">
					<div class="product_img mb-3">
						<img src="${base}/user/img/product-6.jpg" alt="">
						<div class="product_action">
							<a href="#" class="action"><i class="fas fa-shopping-cart"></i></a>
							<a href="#" class="action"><i class="far fa-heart"></i></a> <a
								href="#" class="action"><i class="fas fa-sync-alt"></i></a> <a
								href="#" class="action"><i class="fas fa-search"></i></a>
						</div>
					</div>
					<div class="product_infor pb-3">
						<a href="detail_product.html" class="product_name">Product
							Name Goes Here</a>
						<div class="product_price mt-3">
							<div class="new_price">$123.00</div>
							<div class="old_price">$200.00</div>
						</div>
						<div class="rating mt-2">
							<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
				<div class="box_product">
					<div class="product_img mb-3">
						<img src="${base}/user/img/product-7.jpg" alt="">
						<div class="product_action">
							<a href="#" class="action"><i class="fas fa-shopping-cart"></i></a>
							<a href="#" class="action"><i class="far fa-heart"></i></a> <a
								href="#" class="action"><i class="fas fa-sync-alt"></i></a> <a
								href="#" class="action"><i class="fas fa-search"></i></a>
						</div>
					</div>
					<div class="product_infor pb-3">
						<a href="detail_product.html" class="product_name">Product
							Name Goes Here</a>
						<div class="product_price mt-3">
							<div class="new_price">$123.00</div>
							<div class="old_price">$200.00</div>
						</div>
						<div class="rating mt-2">
							<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
				<div class="box_product">
					<div class="product_img mb-3">
						<img src="${base}/user/img/product-8.jpg" alt="">
						<div class="product_action">
							<a href="#" class="action"><i class="fas fa-shopping-cart"></i></a>
							<a href="#" class="action"><i class="far fa-heart"></i></a> <a
								href="#" class="action"><i class="fas fa-sync-alt"></i></a> <a
								href="#" class="action"><i class="fas fa-search"></i></a>
						</div>
					</div>
					<div class="product_infor pb-3">
						<a href="detail_product.html" class="product_name">Product
							Name Goes Here</a>
						<div class="product_price mt-3">
							<div class="new_price">$123.00</div>
							<div class="old_price">$200.00</div>
						</div>
						<div class="rating mt-2">
							<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	</div>
	<!-- JavaScript Bundle with Popper -->
	<script async='async' src='https://cdnjs.cloudflare.com/ajax/libs/elevatezoom/3.0.8/jquery.elevatezoom.min.js' />
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>


	



	<script type="text/javascript">
        	function addCart() {
        		console.log(1 , ${product.id})
        		let num = document.querySelector('#number_of_product').value
        		console.log(num)
        		// javascript object.
        		// data la du lieu ma day len action cua controller
				let data = {
						productId: ${product.id}, // lay theo id
						quanlity: num, // lay theo id
					
        		};
        		
				// $ === jQuery
				// json == javascript object
				jQuery.ajax({
					url : "/cart/add",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify(data),
		
					dataType : "json", // kieu du lieu tra ve tu controller la json
					success : function(jsonResult) {
						console.log(jsonResult)
						document.querySelector("#totalCartItem").textContent = jsonResult.totalItems
						
					},
					error : function(jqXhr, textStatus, errorMessage) { // error callback 
						
					}
				});
        	}
        </script>
	<script>

    //<![CDATA[

    window.addEventListener('load', function() {

        $("#zoom_01").elevateZoom({

            zoomType: "lens",

            lensShape: "round",

            lensSize: 200

        });

    })

    //]]>

</script>
</body>
</html>