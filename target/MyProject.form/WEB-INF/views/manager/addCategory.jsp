<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<jsp:include page="/WEB-INF/views/manager/layout/nav.jsp"></jsp:include>
	<h1>From Add Category</h1>
	<div class="container">
		<sf:form method="POST" action="/manager/addCategory"
			modelAttribute="category" >
			<sf:hidden path="id" />
			<div class="mb-3">
				<label for="name" class="form-label">Name </label>
				<sf:input type="text" class="form-control" id="name" path="name"
					name="name" />
			</div>
			<div class="mb-3">
				<label for="price" class="form-label">Description</label>
				<sf:input type="text" class="form-control" id="description" path="description"
					name="description" />
			</div>
			
			<button class="btn btn-primary">Add Category</button>
		</sf:form>
	</div>
</body>
</html>