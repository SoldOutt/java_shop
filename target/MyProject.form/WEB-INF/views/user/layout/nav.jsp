<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<nav class="navbar navbar-expand-lg navbar-light bg-primary ">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="/user/product">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>
			</ul>
			<div>
				<a href="/user/view_cart" class="btn btn-dark">Số hàng trong
					giỏ: <span id="totalCartItem">${totalItems == null ? 0:totalItems }</span>
				</a>
			</div>
			<form class="d-flex">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-dark" type="submit">Search</button>
			</form>
		</div>
	</div>
</nav>
<c:choose>
	<c:when test="${isLogined }">
		<h2>Hello ${userLogined.username }</h2>
	</c:when>
	<c:otherwise>
		<a href="/login">Login</a>
	</c:otherwise>
</c:choose>