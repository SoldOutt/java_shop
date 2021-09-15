<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="nav_bar container-fluid px-xl-5 ">
	<div class="row">
		<div class="nav_bar-categories col-lg-3 col-md-4 col-sm-6">
			<div class="categories_menu">
				<p>
					<i class="fas fa-bars"></i>Categories
				</p>
				<i class="far fa-chevron-down"></i>
				<ul class="categories_list">
					<c:forEach items="${categories }" var="category">
					<li><a href="/user/category/${category.seo}">${category.name }</a></li>
					</c:forEach>
				
				</ul>
			</div>
		</div>
		<div class="nav_bar-list col-lg-9 col-md-8 col-sm-6">
			<ul>
				<li><a href="/">Trang chủ</a></li>
				<li><a href="/user/product">Sản phẩm</a></li>
				<li><a href="/blog">Tin tức</a></li>
				<li><a href="/user/contact">Liên hệ</a></li>
			</ul>
			<div class="user_product">

				<a href="/user/view_cart" class="user_buy"> <i
					class="fas fa-shopping-cart"></i> <span id="totalCartItem"
					class="number_buy">${totalItems == null ? 0:totalItems }</span>
				</a>
			</div>
			<div class="nav_bar-mobile">
				<i class="fas fa-bars"></i>
				<ul>
					<li><a href="/">Home</a></li>
					<li><a href="/product">Shop</a></li>
					<li><a href="">Page</a></li>
					<li><a href="/contact">Contact</a></li>
				</ul>
			</div>
			<div class="hide_lg login">
				<c:choose>
					<c:when test="${isLogined }">
						<h2>Hello ${userLogined.username }</h2>
					</c:when>
					<c:otherwise>
						<a href="/login" class="">Đăng nhập</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>