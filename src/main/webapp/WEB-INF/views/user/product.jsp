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
		<div class="container-fluid mt-5 px-xl-5 mt-5">
			<div class="row">
				<div class="filter col-lg-3 col-md-4 col-sm-12">
					<div class="filter_price box_filter">
						<div class="filter_name">
							<h4>filter by price</h4>
						</div>
						<div class="filter_options">
							<div class="option_check">
								<input type="checkbox" name="filter_price" checked id="price_1">
								<label for="price_1">All price</label>
							</div>
							<div class="option_check">
								<input type="checkbox" name="filter_price" id="price_2">
								<label for="price_2">$100-$200</label>
							</div>
							<div class="option_check">
								<input type="checkbox" name="filter_price" id="price_3">
								<label for="price_3">$200-$300</label>
							</div>
							<div class="option_check">
								<input type="checkbox" name="filter_price" id="price_4">
								<label for="price_4">$300-$400</label>
							</div>
							<div class="option_check">
								<input type="checkbox" name="filter_price" id="price_5">
								<label for="price_5"> >500 </label>
							</div>
						</div>
					</div>
					<div class="filter_color box_filter">
						<div class="filter_name">
							<h4>filter by color</h4>
						</div>
						<div class="filter_options">
							<div class="option_check">
								<input type="checkbox" name="filter_color" id="color_1" checked>
								<label for="color_1">All color</label>
							</div>
							<div class="option_check">
								<input type="checkbox" name="filter_color" id="color_2" value="">
								<label for="color_2">Black</label>
							</div>
							<div class="option_check">
								<input type="checkbox" name="filter_color" id="color_3" value="">
								<label for="color_3">White</label>
							</div>
							<div class="option_check">
								<input type="checkbox" name="filter_color" id="color_4" value="">
								<label for="color_4">Red</label>
							</div>
							<div class="option_check">
								<input type="checkbox" name="filter_color" id="color_5" value="">
								<label for="color_5">Blue</label>
							</div>
							<div class="option_check">
								<input type="checkbox" name="filter_color" id="color_6" value="">
								<label for="color_6">Green</label>
							</div>
						</div>
					</div>
					<div class="filter_color box_filter">
						<div class="filter_name">
							<h4>filter by size</h4>
						</div>
						<div class="filter_options">
							<div class="option_check">
								<input type="checkbox" name="filter_price" checked id="size_1">
								<label for="size_1">All size</label>
							</div>
							<div class="option_check">
								<input type="checkbox" name="filter_price" id="size_2">
								<label for="size_2">XS</label>
							</div>
							<div class="option_check">
								<input type="checkbox" name="filter_price" id="size_3">
								<label for="size_3">S</label>
							</div>
							<div class="option_check">
								<input type="checkbox" name="filter_price" id="size_4">
								<label for="size_4">M</label>
							</div>
							<div class="option_check">
								<input type="checkbox" name="filter_price" id="size_5">
								<label for="size_5">L</label>
							</div>
							<div class="option_check">
								<input type="checkbox" name="filter_price" id="size_6">
								<label for="size_6">XL</label>
							</div>
						</div>
					</div>
				</div>
				<div class="shop_products col-lg-9 col-md-8 col-sm-12">
					<div class="show_control">
						<div class="show_option">
							<i class="fas fa-bars"></i> <i class="fa fa-th-large"></i>
						</div>
						<div class="show_sort">
							<div class="sorting">
								<button>
									Sorting <i class="fas fa-sort-down"></i>
								</button>
								<ul class="sort_list">
									<li>Lastest</li>
									<li>Popularity</li>
									<li>Best rating</li>
								</ul>
							</div>
							<div class="showing">
								<button>
									Showing <i class="fas fa-sort-down"></i>
								</button>
								<ul class="sort_list">
									<li>10</li>
									<li>20</li>
									<li>30</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="contain">
						<div class="product_list row mb-4">
							<c:forEach var='product' items="${products}">
								<div class="col-lg-4 col-md-6 col-sm-6 mb-3">
									<div class="box_product">
										<div class="product_img mb-3">
											<div class="product_bx_img">
												<img src="${base}/uploads/${product.avatar}"
													class="card-img-top" alt="...">
											</div>


											<div class="product_action">
												<a style="cursor: pointer;"
													onClick="addOneToCart(${product.id},1)" class="action"><i
													class="fas fa-shopping-cart"></i></a> <a href="#"
													class="action"><i class="far fa-heart"></i></a> <a href="#"
													class="action"><i class="fas fa-sync-alt"></i></a> <a
													href="detailProduct/${product.seo}" class="action"><i
													class="fas fa-search"></i></a>
											</div>
										</div>
										<div class="product_infor pb-3">
											<a href="detailProduct/${product.seo}" class="product_name">${product.title }</a>
											<div class="product_price mt-3">
												<c:choose>
													<c:when test="${product.priceScale!=null}">
														<div class="new_price">${product.priceScale }</div>
														<div class="old_price">${product.price}</div>
													</c:when>
													<c:otherwise>
														<div class="new_price">${product.price }</div>

													</c:otherwise>
												</c:choose>

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
					<!-- move page -->
					<%-- <div class="container-fluid mt-4 move_page">
						<!-- 	<a href="" class="move_page-btn">Previous</a> <a href=""
							class="active move_page-btn">1</a> <a href=""
							class="move_page-btn">2</a> <a href="" class="move_page-btn">3</a>
						<a href="" class="move_page-btn">4</a> <a href=""
							class="move_page-btn">Next</a>
							 -->
						<nav aria-label="..." class="container-fluid mt-4 move_page">
							<ul class="pagination">
								<li class="page-item  ${ page == 1 ? 'disabled': ''}"><a
									class="page-link" href="/user/product?page=${page-1}">Previous</a>
								</li>
								<c:forEach var="i" begin="1" end="${totalPage}">
									<li class="page-item"><a
										class="page-link move_page-btn ${page==i?'active':'' }"
										href="/user/product?page=${i}">${i }</a></li>
								</c:forEach>
								<li class="page-item ${page==totalPage?'disabled':'' }"><a
									class="page-link" href="/user/product?page=${page+1}" )>Next</a></li>
							</ul>
						</nav>
					</div> --%>
					<jsp:include page="/WEB-INF/views/user/layout/pagination.jsp"></jsp:include>
				</div>

			</div>
		</div>
		<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
		<script type="text/javascript">
			console.log("${products}")
			
		</script>
	</div>
</body>
</html>