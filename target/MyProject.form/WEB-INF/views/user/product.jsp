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
	<jsp:include page="/WEB-INF/views/user/layout/nav.jsp"></jsp:include>
	<div class="container">
		<div class="row py-3">
			<c:forEach var='product' items="${products}">
				<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
					<div class="card">
						<img src="${pageContext.servletContext.contextPath}/uploads/${product.avatar}" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">${product.title }</h5>
							<p class="card-text">${product.shortDescription}</p>
							<a href="detailProduct/${product.id}" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		 <div class="d-flex justify-content-center">
			<nav aria-label="...">
				<ul class="pagination">
					<li class="page-item  ${ page == 1 ? 'disabled': ''}"><a
						class="page-link" href="/user/product?page=${page-1}">Previous</a>
					</li>
					<c:forEach var = "i" begin = "1" end = "${totalPage}">
						<li class="page-item"><a class="page-link" href="/user/product?page=${i}">${i }</a></li>
					</c:forEach>
					<li class="page-item"><a class="page-link"
						href="/user/product?page=${page+1}">Next</a></li>
				</ul>
			</nav>
		</div> 
		
		 <%-- <jsp:include page="/WEB-INF/views/user/layout/pagination.jsp"></jsp:include>  --%>
	</div>
</body>
</html>