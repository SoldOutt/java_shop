<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="col-lg-3 col-md-4 adminitration">
	<div class="bx_admin">
		<div class="admin_img">
			<img src="img/user.jpg" alt="">
		</div>
		<div class="link_admin">
			<a href=""><i class="fab fa-facebook-f"></i></a> <a href=""><i
				class="fab fa-twitter"></i></a>
		</div>
	</div>
	<div class="admin_control">
		<ul>
			<li data_review='0' class="active"><a href="#">Danh sách
					khách hàng</a></li>
			<li data_review='1'><a href="/admin/product">Quản lí sản phẩm</a></li>
			<li data_review='10'><a href="/admin/addProduct">Thêm sản phẩm</a></li>
			<li data_review='2'><a href="/admin/category">Quản lí danh mục</a></li>
			<li data_review='2'><a href="/admin/sale_order">Quản lí đơn hàng</a></li>
			<li data_review='2'><a href="/admin/category">Quản lí bài viết</a></li>
			<li data_review='2'><a href="/admin/sale_order">Tạo bài viết</a></li>
			<!-- <li data_review='2'><a href="">Quản lí danh mục</a></li> -->
		</ul>
	</div>
</div>