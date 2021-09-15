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
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
	<!-- navbar -->
	<jsp:include page="/WEB-INF/views/user/layout/navigation.jsp"></jsp:include>

	<div class="container-fluid  contact px-xl-5 mt-5 ">
		<div class="contact_title">
			<h3>CONTACT US</h3>
		</div>
		<div class="mt-5">
			<div class="row">
				<div class="col-lg-7 p-3">
					<sf:form method="POST" modelAttribute="contact">
						<sf:input path="userName" type="text" id="userName" name="userName" placeholder="Your name"></sf:input><!--  -->
						<sf:input path="email" type="email" id="email" name="email" placeholder="Your email"></sf:input>
						<sf:input path="subject" type="text" id="subject" name="subject" placeholder="Subject"></sf:input>
						<sf:textarea path="message" name="message" id="message"
							placeholder="Message"></sf:textarea>
						<button type="button" onClick ="saveContact()">Send message</button>
					</sf:form>
				</div>
				<div class="col-lg-5 p-3">
					<div class="contact_map">
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d7442.584327199716!2d105.8994929!3d21.1407682!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1621260965820!5m2!1svi!2s"
							width="400" height="300" style="border: 0;" allowfullscreen=""
							loading="lazy"></iframe>
						<div class="mt-5 contact_address">
							<p>
								<i class="fas fa-map-marker-alt"></i>Liên Hà,Đông Anh, Hà Nội
							</p>
							<p>
								<i class="fas fa-envelope"></i>boychauphong2001@gmail.com
							</p>
							<p>
								<i class="fas fa-phone-alt"></i>0346663207
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer container-fluid mt-5 pt-5">
		<div class="row px-xl-5 pt-5 pb-4">
			<div class="footer_get_touch col-lg-4 col-md-12">
				<div class="footer_name">
					<h3>Get in touch</h3>
					<p>No dolore ipsum accusam no lorem. Invidunt sed clita kasd
						clita et et dolor sed dolor. Rebum tempor no vero est magna amet
						no</p>
				</div>
				<div class="footer_contact">
					<p>
						<i class="fas fa-map-marker-alt"></i>Liền Hà,Đông Anh, Hà Nội
					</p>
					<p>
						<i class="fas fa-envelope"></i>boychauphong2001@gmail.com
					</p>
					<p>
						<i class="fas fa-phone-alt"></i>0346663207
					</p>
				</div>
			</div>
			<div class="col-lg-8 col-md-12 row">
				<div class="quick_shop col-lg-4 col-md-4 col-sm-12">
					<h3>Quick Shop</h3>
					<ul>
						<li><a href="#"><i class="fas fa-chevron-right"></i>Home</a></li>
						<li><a href="#"><i class="fas fa-chevron-right"></i>Our
								Shop</a></li>
						<li><a href="#"><i class="fas fa-chevron-right"></i>Shop
								Detail</a></li>
						<li><a href="#"><i class="fas fa-chevron-right"></i>Shopping
								Cart</a></li>
						<li><a href="#"><i class="fas fa-chevron-right"></i>Checkout</a></li>
						<li><a href="#"><i class="fas fa-chevron-right"></i>Contact
								Us</a></li>
					</ul>
				</div>
				<div class="my_account col-lg-4 col-md-4 col-sm-12">
					<h3>Quick Shop</h3>
					<ul>
						<li><a href="#"><i class="fas fa-chevron-right"></i>Home</a></li>
						<li><a href="#"><i class="fas fa-chevron-right"></i>Our
								Shop</a></li>
						<li><a href="#"><i class="fas fa-chevron-right"></i>Shop
								Detail</a></li>
						<li><a href="#"><i class="fas fa-chevron-right"></i>Shopping
								Cart</a></li>
						<li><a href="#"><i class="fas fa-chevron-right"></i>Checkout</a></li>
						<li><a href="#"><i class="fas fa-chevron-right"></i>Contact
								Us</a></li>
					</ul>
				</div>
				<div class="newsleter col-lg-4 col-md-4 col-sm-12">
					<h3>NEWSLETTER</h3>
					<p>Duo stet tempor ipsum sit amet magna ipsum tempor est</p>
					<form action="#">
						<input type="text" placeholder="Your Email Add">
						<button>Sign Up</button>
					</form>
					<div class="follow">
						<h3>Follow us</h3>
						<a href="#"><i class="fab fa-twitter"></i></a> <a href="#"><i
							class="fab fa-facebook-f"></i></a> <a href="#"><i
							class="fab fa-linkedin-in"></i></a> <a href="#"><i
							class="far fa-camera"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>


	<%-- <header>
		<h1>TiKi</h1>
	</header>
	<div class="container">
		<h2>Chăm sóc khách hàng TIKI</h2>
		<p>Tiki luôn sẵn snagf nghe câu hỏi và các vấn đề của khách hàng!</p>
		<div class="form">
			<sf:form action="/contact" method="POST" modelAttribute="contact"
				enctype="multipart/form-data">
				<div class="form_group">
					<label for="">Hãy chọn vấn đề bên dưới nhé</label>
					<sf:select path="problem">
						<sf:option value="0">Bảo Hành</sf:option>
						<sf:option value="1">Bảo hiểm</sf:option>
						<sf:option value="2">Khiếu nại</sf:option>
					</sf:select>
				</div>

				<div class="form_group">
					<label for="">Địa chỉ mail</label>
					<sf:input id="mail" path="mail" type="text"
						placeholder="Nhập địa chỉ mail" />
				</div>
				<div class="form_group">
					<label for="">Số điện thoại</label>
					<sf:input id="sdt" path="sdt" type="text"
						placeholder="Nhập số điện thoại" />
				</div>
				<div class="form_group">
					<label for="">Mã đơn hàng</label>
					<sf:input id="maDonHang" path="maDonHang" type="text"
						placeholder="Nhập mã đơn hàng" />
				</div>
				<div class="form_group">
					<label for="">Tiêu đề</label>
					<sf:input path="tieuDe" id="tieuDe" type="text"
						placeholder="Tiêu đề" />
				</div>
				<div class="form_group">
					<label for="">Nội dung</label>
					<sf:textarea path="noiDung" id="noiDung"
						placeholder="Viết nội dung"></sf:textarea>
				</div>
				<input id="inputFile" name="inputFile" type="file"
					class="form-control-file" multiple="multiple">
				<button>Gửi đi</button>
				<button type='button' onClick='saveContact()'>Gửi đi(Ajax)</button>
			</sf:form>
		</div>
	</div> --%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
	<script src="js/index.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
	<script>
		function saveContact() {
			// javascript object.
			// data la du lieu ma day len action cua controller
			let data = {
				userName : jQuery("#userName").val(), // lay theo id
				email : jQuery("#email").val(), // lay theo id
				subject : jQuery("#subject").val(),
				message : jQuery("#message").val(),
				
				
			};

			// $ === jQuery
			// json == javascript object
			jQuery.ajax({
				url : "/user/contact-ajax",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),

				dataType : "json", // kieu du lieu tra ve tu controller la json
				success : function(jsonResult) {
					/* alert("Gui request thanh cong ma don hang ",
							jsonResult.message.maDonHang); */
							jQuery("#userName").val(''), // lay theo id
							 jQuery("#email").val('') // lay theo id
							 jQuery("#subject").val('')
							 jQuery("#message").val('')
					console.log(jsonResult)
					window.alert('Cảm ơn bạn đã liên hệ với chúng tôi!!')
				},
				error : function(jqXhr, textStatus, errorMessage) { // error callback 
				}
			});
		}
	</script>
</body>
</html>