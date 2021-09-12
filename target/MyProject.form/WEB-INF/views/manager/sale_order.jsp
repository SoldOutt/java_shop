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
	<h1>Sale Order</h1>
	<table class="table">
		<thead>
			<tr>
				
				<th scope="col">code</th>
				<th scope="col">Name customer</th>
				<th scope="col">Address</th>
				<th scope="col">Total</th>
				<th scope="col">Control</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="x" items="${saleOrders}">
				<tr>
					
					<td><c:out value="${x.code}"></c:out></td>
					<td><c:out value="${x.customerName}"></c:out></td>
					<td><c:out value="${x.customerAddress}"></c:out></td>
					<td><c:out value="${x.total}"></c:out></td>
					<td> <button onClick="getDetailSaleOrder(${x.id})" class="btn btn-primary mr-3">Xem chi tiết</button> <button class="btn btn-success">Xử lí</button> </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		function getDetailSaleOrder(id){
			
			let data = {
					productId: id, // lay theo id	
    		};
    		
			// $ === jQuery
			// json == javascript object
			jQuery.ajax({
				url : "/manager/saleorder_detail",
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