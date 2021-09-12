<!-- directive SPRING-FORM -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tiki</title>
<!-- <link rel="stylesheet" href="./style.css"> -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/user/css/style.css">
</head>
<body>
	<header>
		<h1>TiKi</h1>
	</header>
	<div class="container">
		<h2>Chăm sóc khách hàng TIKI</h2>
		<p>Tiki luôn sẵn snagf nghe câu hỏi và các vấn đề của khách hàng!</p>
		<div class="form">
			<sf:form action="/contact" method="POST" modelAttribute="contact" enctype="multipart/form-data">
				<div class="form_group">
					<label for="">Hãy chọn vấn đề bên dưới nhé</label> 
					<sf:select path="problem">
						<sf:option value="0">Bảo Hành</sf:option>
						<sf:option value="1">Bảo hiểm</sf:option>
						<sf:option value="2">Khiếu nại</sf:option>
					</sf:select>
				</div>
				
				<div class="form_group">
					<label for="">Địa chỉ mail</label> <sf:input id="mail" path="mail" type="text"
						placeholder="Nhập địa chỉ mail"/>
				</div>
				<div class="form_group">
					<label for="">Số điện thoại</label> <sf:input id="sdt" path="sdt" type="text"
						placeholder="Nhập số điện thoại"/>
				</div>
				<div class="form_group">
					<label for="">Mã đơn hàng</label> <sf:input id="maDonHang" path="maDonHang" type="text"
						placeholder="Nhập mã đơn hàng"/>
				</div>
				<div class="form_group">
					<label for="">Tiêu đề</label>
					 <sf:input path="tieuDe" id="tieuDe" type="text"
						placeholder="Tiêu đề"/>
				</div>
				<div class="form_group">
					<label for="">Nội dung</label>
					<sf:textarea path="noiDung" id="noiDung" placeholder="Viết nội dung"></sf:textarea>
				</div>
				<input id="inputFile" name="inputFile" type="file" class="form-control-file" multiple="multiple">
				<button>Gửi đi</button>
				<button type='button' onClick = 'saveContact()'>Gửi đi(Ajax)</button>
			</sf:form>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <script src="js/index.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	 <script type="text/javascript">
        	function saveContact() {
        		// javascript object.
        		// data la du lieu ma day len action cua controller
				let data = {
					problem: jQuery("#problem").val(), // lay theo id
					email: jQuery("#mail").val(), // lay theo id
					sdt: jQuery("#sdt").val(),
					maDonHang: jQuery("#maDonHang").val(),
					tieuDe: jQuery("#tieuDe").val(),
					noiDung: jQuery("#noiDung").val(),
					inputFile : jQuery('#inputFile').val()
        		};
        		
				// $ === jQuery
				// json == javascript object
				jQuery.ajax({
					url : "/contact-ajax",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify(data),
		
					dataType : "json", // kieu du lieu tra ve tu controller la json
					success : function(jsonResult) {
						console.log(jsonResult)
						alert("Gui request thanh cong ma don hang " , jsonResult.message.maDonHang);
						console.log(jsonResult)
					},
					error : function(jqXhr, textStatus, errorMessage) { // error callback 
						
					}
				});
        	}
        </script>
</body>
</html>