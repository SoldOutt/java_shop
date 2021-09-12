<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/user/css/style.css">
<jsp:include page="/WEB-INF/views/manager/layout/css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/manager/layout/nav.jsp"></jsp:include>
	<h1>Contact</h1>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">First Name</th>
				<th scope="col">Last Name</th>
				<th scope="col">Email</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="contact" items="${contacts}">
				<tr>
					<th scope="row"></th>
					<td><c:out value="${contact.firstName}"></c:out></td>
					<td><c:out value="${contact.lastName}"></c:out></td>
					<td><c:out value="${contact.email}"></c:out></td>
				</tr>

			</c:forEach>
		</tbody>
	</table>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
</body>
</html>