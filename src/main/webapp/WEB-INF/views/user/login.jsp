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
	<section>
		<div class="contain">
			<!-- Sign In -->
			<div class="user box_signIn">
				<div class="box_img">
					<img src="${base}/user/img/login.jpg" alt="">
				</div>
				<div class="box_form">
					<form action="/perform_login" method="POST">
						<h2>Sign In</h2>
						<input type="text" name="username" placeholder="Username">
						<input type="password" name="password" placeholder="Password">
						<input type="submit" name="password" value="Sign In">
						<p>
							If you don't have an account? <span onclick="Login_toggle()">Sign
								up</span>
						</p>
					</form>
				</div>
			</div>
			<!-- Sign Up -->
			<div class="user box_signUp">
				<div class="box_img">
					<img src="${base}/user/img/signup.jpg" alt="">
				</div>
				<div class="box_form">
					<form id="signUp" action="#" method="POST">
						<h2>Sign Up</h2>
						<input type="text" name="usernamerg" placeholder="Username">
						<input type="email" name="email" placeholder="Email"> <input
							type="text" placeholder="Phone number" name="phoneNumber">
						<input type="password" placeholder="Password" name="passwordrg">
						<input type="password" placeholder="Confirm Password" name="confirmPassword"> <input
							type="submit" value="Sign Up">
						<p>
							If you have an account? <span onclick="Login_toggle()">Sign
								In</span>
						</p>
					</form>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
	<script>
		document.querySelector('#signUp').addEventListener('submit',e=>{
			e.preventDefault()
			console.log(jQuery("input[name='usernamerg']").val())
			let data = {
				username : jQuery("input[name='usernamerg']").val(), // lay theo id
				email : jQuery("input[name='email']").val(), // lay theo id
				phoneNumber : jQuery("input[name='phoneNumber']").val(),
				password : jQuery("input[name='passwordrg']").val(),
			
			
		};

		// $ === jQuery
		// json == javascript object
		jQuery.ajax({
			url : "/register",
			type : "POST",
			contentType : "application/json",
			data : JSON.stringify(data),

			dataType : "json", // kieu du lieu tra ve tu controller la json
			success : function(jsonResult) {
				/* alert("Gui request thanh cong ma don hang ",
						jsonResult.message.maDonHang); */
						jQuery("input[name='usernamerg").val(''), // lay theo id
						 jQuery("input[name='email").val('') // lay theo id
						 jQuery("input[name='phoneNumber").val('')
						 jQuery("input[name='passwordrg").val('')
						  jQuery("input[name='confirmPassword").val('')
				console.log(jsonResult)
				window.alert('Chúc mừng bạn đã đăng kí thành công!!!')
				
			},
			error : function(jqXhr, textStatus, errorMessage) { // error callback 
			}
		});
		})
		
	</script>
</body>
</html>