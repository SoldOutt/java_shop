<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
	<!-- navbar -->
	<jsp:include page="/WEB-INF/views/user/layout/navigation.jsp"></jsp:include>
	<div class="content-profile-page">
		<div class="profile-user-page card">
			<div class="img-user-profile">
				<img class="profile-bgHome"
					src="https://37.media.tumblr.com/88cbce9265c55a70a753beb0d6ecc2cd/tumblr_n8gxzn78qH1st5lhmo1_1280.jpg" />
				<img class="avatar"
					src="http://gravatar.com/avatar/288ce55a011c709f4e17aef7e3c86c64?s=200"
					alt="jofpin" />
			</div>
			<!-- <button>Follow</button> -->
			<div class="user-profile-data">
				<h1>${userLogined.username }</h1>
				<p>${userLogined.email }</p>
				
				<p>Vai trò: ${userLogined.username=='admin'? '<a href="admin/product">Người quản trị</a>':'Người dùng' }</p>
			</div>
			
			<h2 class="mx-3">Danh sách đơn hàng đã đặt</h2>
			<table class="table">
				<thead>
					<tr>

						<th scope="col">Thời gian đặt</th>

						<th scope="col">Địa chỉ nhận</th>
						<th scope="col">Tổng tiền</th>
						<th scope="col">Trạng thái</th>
						<th scope="col">Hành động</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="x" items="${saleOrders}">
						<tr>

							<td><c:out value="${x.createDate}"></c:out></td>
							<td><c:out value="${x.customerAddress}"></c:out></td>
							<td><c:out value="${x.total}"></c:out></td>
							<td><c:out
									value="${x.status == true?'Chưa xử lí': 'Đã xủ lí'}"></c:out></td>
							<td>
								<button onClick="getDetailSaleOrder(${x.id})"
									class="btn btn-primary mr-3">Xem chi tiết</button>

							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<footer>
		<h4>
			Design by <a href="https://twitter.com/jofpin" target="_blank"
				title="José Pino">@jofpin</a>
		</h4>
	</footer>
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		function getDetailSaleOrder(id){
			
			let data = {
					id: id, // lay theo id	
    		};
    		console.log(id)
			// $ === jQuery
			// json == javascript object
			jQuery.ajax({
				url : "/manager/saleorder_detail/"+id,
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),
	
				dataType : "json", // kieu du lieu tra ve tu controller la json
				success : function(jsonResult) {
					console.log(jsonResult)
					
				},
				error : function(jqXhr, textStatus, errorMessage) { // error callback 
					console.log(errorMessage,textStatus,jqXhr)
				}
			});
		}
	</script>
</body>
</html>