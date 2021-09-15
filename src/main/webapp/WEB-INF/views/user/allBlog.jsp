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
	
	<div class="px-5 mt-5">
		<c:forEach items="${blogs}" var="blog">
			<div class="blog_itemm">
				<h2>${blog.title}</h2>
				<div class="blog_item_contain">
					<div class="blog_item-img">
						<img alt="" src="${base}/uploads/${blog.blogImg}">
					</div>
					<div class="blog_item-text mx-3">
						<p class="mb-3">${blog.shortDescription }</p>
						<a href="user/blog/${blog.seo}">Đọc thêm</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	</div>
	<!-- JavaScript Bundle with Popper -->
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>

	

	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
</body>
</html>