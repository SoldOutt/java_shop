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
	<div class="container-fluid px-xl-5 mt-5">
		<div class="row">
			<jsp:include page="/WEB-INF/views/manager/layout/navigation.jsp"></jsp:include>
			<div class="col-lg-9 col-md-8 data">
				<ul class="nav nav-tabs mb-5" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
							data-bs-target="#home" type="button" role="tab"
							aria-controls="home" aria-selected="true">Phản hồi khách
							hàng</button>
					</li>


				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<table class="table data_product table-hover ">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Tên khách hàng</th>
									<th scope="col">Email</th>
									<th scope="col">Vấn đề</th>
									<th scope="col">Nội dung</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach varStatus="loop" var="contact" items="${contacts}">
									<tr>
										<th scope="row">${loop.index+1 }</th>
										<td><c:out value="${contact.userName}"></c:out></td>
										<td><c:out value="${contact.email}"></c:out></td>
										<td><c:out value="${contact.subject}"></c:out></td>
										<td><c:out value="${contact.message}"></c:out></td>
									</tr>

								</c:forEach>
							</tbody>
						</table>

					</div>

				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
	<script src="js/index.js"></script>







	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>

</body>
</html>