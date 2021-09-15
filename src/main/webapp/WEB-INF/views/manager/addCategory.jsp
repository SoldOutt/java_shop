<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/manager/layout/css.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
	<div class="container-fluid px-xl-5 mt-5">
		<div class="row">
			<jsp:include page="/WEB-INF/views/manager/layout/navigation.jsp"></jsp:include>
			<div class="col-lg-9 col-md-8 data">
				<sf:form method="POST" action="/admin/addCategory"
					modelAttribute="category">
					<sf:hidden path="id" />
					<div class="mb-3">
						<label for="name" class="form-label">Name </label>
						<sf:input type="text" class="form-control" id="name" path="name"
							name="name" />
					</div>
					<div class="mb-3">
						<label for="price" class="form-label">Description</label>
						<sf:input type="text" class="form-control" id="description"
							path="description" name="description" />
					</div>

					<button class="btn btn-primary">Add Category</button>
				</sf:form>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>






	
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</body>
</html>