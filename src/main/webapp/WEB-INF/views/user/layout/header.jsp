<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="header_top">
	<div class="logo">
		<a href="/">
			<p>
				multi<span>shop</span>
			</p>
		</a>
	</div>
	<div class="search">
		<form action="">
			<input type="text" id="search_input" name='keyword'
				placeholder="Tìm kiếm">
			<button>
				<i class="fas fa-search"></i>
			</button>
		</form>
	</div>
	<div class="login">
		<c:choose>
			<c:when test="${isLogined }">
				<%-- <h2>Hello ${userLogined.username }</h2> --%>
				<div class="dropdown">
					<a class="dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-bs-toggle="dropdown"
						aria-expanded="false">Hello ${userLogined.username }</a>

					<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<li><a class="dropdown-item" href="/profile">Trang cá nhân</a></li>
						<li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
				<a href="/login"><i class="fas fa-user"></i>Đăng nhập</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>