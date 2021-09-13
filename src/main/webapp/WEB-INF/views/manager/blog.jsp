<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- CSS only -->
<jsp:include page="/WEB-INF/views/manager/layout/css.jsp"></jsp:include>
<style type="text/css">
td img {
	max-width: 200px;
}
</style>
</head>
<body>
	<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shop</title>
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
							aria-controls="home" aria-selected="true">Danh sách tin tức</button>
					</li>
					
					
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<table class="table data_product table-hover ">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Tiêu đề</th>
									<th scope="col">Ảnh bìa</th>
									<th scope="col">Giới thiệu</th>
									<th scope="col">Hành động</th>
								</tr>
							</thead>
							<tbody>
							
								< <c:forEach var="blog" items="${blogs}" varStatus="loop">
									<tr data-id=${blog.id }>
										<th>${loop.index+1 }</th>
										<td>${blog.title }</td>
										<td><img src="${base}/uploads/${blog.blogImg }"
											width="100px" height="100px" alt=""></td>
										
										<td>${blog.shortDescription }</td>
										
										<td><a class="btn btn-warning btnOpenForm"
											href="/admin/editBlog/${blog.seo}">Sửa</a>
											<button class="btn btn-danger"
												onClick="deleteProduct(${product.id})">Xóa</button></td>
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
	

 



	<!-- JavaScript Bundle with Popper -->
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
		
	<script type="text/javascript">
        	function deleteProduct(id,event) {
        		console.log(event)
        		
				let data = {
					id: id, // lay theo id
        		};
        		
			
				jQuery.ajax({
					url : "/removeProduct/" +id,
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
						
					}
				});
        	}
        
        </script>
</body>
</html>