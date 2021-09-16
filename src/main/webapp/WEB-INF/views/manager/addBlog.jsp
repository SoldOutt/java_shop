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
				<sf:form method="POST" action="/admin/addBlog"
					modelAttribute="blog" enctype="multipart/form-data">
					<sf:hidden path="id" />
					
					<div class="mb-3">
						<label for="title" class="form-label">Tiêu đề </label>
						<sf:input type="text" class="form-control" id="title" path="title"
							name="title" />
					</div>
					<div class="mb-3">
						<label for="shortDes" class="form-label">Lời dẫn </label>
						<sf:input type="text" class="form-control" id="shortDes" path="shortDescription"
							name="short_Description" />
					</div>
					<div class="mb-3">
						<label for="detailPost" class="form-label">Detail
							Blog </label>
						<%-- <sf:input type="text" class="form-control" id="detail_description"
					path="detailDescription" name="detail_description" /> --%>
						<sf:textarea path="detailPost" id="detailDescription"
							name="detail_post" />
					</div>
					<div class="mb-3">
						<label for="avatar" class="form-label">Ảnh nền </label> <input
							id="avatar" name="avatarImage" type="file"
							class="form-control-file" multiple="multiple">
					</div>
					<button class="btn btn-primary">Tạo blog</button>
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