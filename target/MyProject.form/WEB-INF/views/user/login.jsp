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
	<jsp:include page="/WEB-INF/views/user/layout/nav.jsp"></jsp:include>

	<form method="POST" action ="/perform_login">
		<c:if test="${not empty param.login_error }">
			<h5>Tài khoản hoặc mật khẩu không chính xác</h5>
		</c:if>
		<div class="mb-3">
			<label for="customerName" class="form-label">Tên đăng nhập
				</label> <input type="text" class="form-control"
				id="username" name="username" >
			
		</div>
		<div class="mb-3">
			<label for="customerAddress" class="form-label">Mật khẩu</label>
			 <input type="password" class="form-control"
				id="password" name = "password" >
			
		</div>
		
		
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</body>
</html>