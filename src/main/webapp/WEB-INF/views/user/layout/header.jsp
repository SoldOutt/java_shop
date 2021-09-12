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
					<input type="text" id="search_input" name='keyword' placeholder="TÃ¬m kiáº¿m">
					<button>
						<i class="fas fa-search"></i>
					</button>
				</form>
			</div>
			<div class="login">
				<c:choose>
					<c:when test="${isLogined }">
						<h2>Hello ${userLogined.username }</h2>
					</c:when>
					<c:otherwise>
						<a href="/login"><i class="fas fa-user"></i>Đăng nhập</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>