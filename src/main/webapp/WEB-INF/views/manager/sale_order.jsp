<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<ul class="nav nav-tabs mb-5" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
							data-bs-target="#home" type="button" role="tab"
							aria-controls="home" aria-selected="true">Danh sách đơn
							hàng</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
							data-bs-target="#profile" type="button" role="tab"
							aria-controls="profile" aria-selected="false">Đơn hàng
							đã xử lí</button>
					</li>

				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<table class="table data_product table-hover ">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Khách hàng</th>
									<th scope="col">Địa chỉ</th>
									<th scope="col">Số điện thoại</th>
									<th scope="col">Tổng tiền</th>
									<th scope="col">Hành động</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="x" items="${saleOrders}" varStatus="loop">
									<c:if test="${x.status}">

										<tr data-id=${x.id }>
											<th>${loop.index+1 }</th>
											<td>${x.customerName }</td>
											<td>${x.customerAddress }</td>
											<td>${x.customerPhone}</td>
											<td>${x.total}</td>
											<td>
												<button onClick="getDetailSaleOrder(${x.id})"
													class="btn btn-primary mr-3">Xem chi tiết</button>
												<button onClick="removeSaleOrder(${x.id})"
													class="btn btn-success">Xử lí</button>
											</td>
										</tr>
									</c:if>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="tab-pane fade" id="profile" role="tabpanel"
						aria-labelledby="profile-tab">


						<table class="table data_product table-hover ">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Khách hàng</th>
									<th scope="col">Địa chỉ</th>
									<th scope="col">Số điện thoại</th>
									<th scope="col">Tổng tiền</th>
									<th scope="col">Hành động</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="x" items="${saleOrdersDelete}" varStatus="loop">
									

									

										<tr data-id=${product.id }>
											<th>${loop.index+1 }</th>
											<td>${x.customerName }</td>
											<td>${x.customerAddress }</td>
											<td>${x.customerPhone}</td>
											<td>${x.total}</td>
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
function removeSaleOrder(id){
			const isConfirm = window.confirm('Bạn muốn xác nhận đơn hàng này ??? ')	
			if(!isConfirm)return
	
			let data = {
					id: id, // lay theo id	
    		};
			
    		console.log(id)
			// $ === jQuery
			// json == javascript object
			jQuery.ajax({
				url : "/admin/removeSaleOrder/"+id,
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),
	
				dataType : "json", // kieu du lieu tra ve tu controller la json
				success : function(jsonResult) {
					console.log(jsonResult)
					var arr = document.querySelectorAll('tr')
					arr.forEach(x=>{if(x.getAttribute('data-id')==id)x.remove()})
					
				},
				error : function(jqXhr, textStatus, errorMessage) { // error callback 
					console.log(errorMessage,textStatus,jqXhr)
				}
			});
		}
	</script>
</body>
</html>