<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/manager/layout/css.jsp"></jsp:include>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
</head>

<body>
	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
	<div class="container-fluid px-xl-5 mt-5">
		<div class="row">
			<jsp:include page="/WEB-INF/views/manager/layout/navigation.jsp"></jsp:include>
			<div class="col-lg-9 col-md-8 data">
				<sf:form method="POST" action="/admin/addProduct"
					modelAttribute="product" enctype="multipart/form-data">
					<sf:hidden path="id" />
					<div class="mb-3">
						<label for="category" class="form-label">Category </label>
						<sf:select path="categories.id" class="form-control" id="category">
							<sf:options items="${categories}" itemValue="id" itemLabel="name" />
						</sf:select>
					</div>
					<div class="mb-3">
						<label for="title" class="form-label">Title </label>
						<sf:input type="text" class="form-control" id="title" path="title"
							name="title" />
					</div>
					<div class="mb-3">
						<label for="price" class="form-label">Price</label>
						<sf:input type="number" class="form-control" id="price"
							path="price" name="price" />
					</div>
					<div class="mb-3">
						<label for="priceSale" class="form-label">Price Sale</label>
						<sf:input type="number" class="form-control" id="priceSale"
							path="priceScale" name="price" />
					</div>
					<div class="mb-3">
						<label for="sort_description" class="form-label">Sort
							Description </label>
						<sf:input type="text" class="form-control" id="sort_description"
							path="shortDescription" name="sort_description" />
					</div>
					<div class="mb-3">
						<label for="sort_description" class="form-label">Detail
							Description </label>
						<%-- <sf:input type="text" class="form-control" id="detail_description"
					path="detailDescription" name="detail_description" /> --%>
						<sf:textarea path="detailDescription" id="detailDescription"
							name="detail_description" />
					</div>
					<div class="mb-3">
						<label for="isHot" class="form-label">Sản phẩm nổi bật ? </label>
						<sf:checkbox path="isHot" id="isHot" name="isHot" />
					</div>
					<div class="mb-3">
						<label for="avatar" class="form-label">Avatar </label> <input
							id="avatar" name="avatarImage" type="file"
							class="form-control-file" multiple="multiple">
					</div>
					<div class="mb-3">
						<label>Image product</label> <input name="productImagess"
							type="file" multiple="multiple"/ >
					</div>

					<button class="btn btn-primary">Add product</button>
				</sf:form>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script>
		$(document).ready(function() {

			$('#detailDescription').summernote();
		});
	</script>
</body>
</html>