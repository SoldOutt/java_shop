<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/manager/layout/css.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/views/manager/layout/nav.jsp"></jsp:include>
	<h1>Category </h1>
	
     <table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">Name</th>
				<th scope="col">Descripton</th>
				<th scope="col">Setting</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="x" items="${category}">
				<tr>
					<th scope="row"></th>
					<td><c:out value="${x.name}"></c:out></td>
					<td><c:out value="${x.description}"></c:out></td>
					<td><a class="btn btn-warning" href="/manager/edit-category/${x.id}">Sửa</a><a>Xóa</a></td>
				</tr>

			</c:forEach>
		</tbody>
	</table>
</body>
</html>