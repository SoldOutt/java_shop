<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<ul class="nav bg-dark">
		<li class="nav-item"><a class="nav-link active"
			aria-current="page" href="/admin/product">Product</a></li>
		<li class="nav-item"><a class="nav-link" href="/admin/category">Category</a></li>
		<li class="nav-item"><a class="nav-link" href="/admin/addProduct">Add Product</a></li>
		<li class="nav-item"><a class="nav-link" href="/admin/addCategory">Add Category</a></li>
		<li class="nav-item"><a class="nav-link" href="/admin/sale_order">Sale Order</a></li>
		<c:if test="${isLogined }">
			<h2>Hello ${userLogined.username }</h2>
		</c:if>
	</ul>
	<c:if test="${isLogined }">
			<h2>Hello ${userLogined.username }</h2>
		</c:if>

