<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid mt-4 move_page">
	<nav aria-label="...">
		<ul class="pagination">
			<li class="page-item  ${ page == 1 ? 'disabled': ''}"><a
			data-page="${page-1}"
				class="page-link" href="/user/product?page=${page-1}">Previous</a></li>
			<c:forEach var="i" begin="1" end="${totalPage}">
				<li class="page-item"><a
					data-page="${i}"
					class="page-link move_page-btn ${page==i?'active':'' }"
					href="/user/product?page=${i}">${i }</a></li>
			</c:forEach>
			<li class="page-item ${page==totalPage?'disabled':'' }"><a
			data-page="${page+1}"
				class="page-link" href="/user/product?page=${page+1}" >Next</a></li>
		</ul>
	</nav>
</div>
<script>
	var arrPage = document.querySelectorAll('.page-link')
	
	arrPage.forEach(page=>{
		page.addEventListener('click',e=>{
			var p = e.target.getAttribute('data-page');
			
			 page.setAttribute("href",updateURLParameter(window.location.href, "page",p ))
		})
	})
</script>