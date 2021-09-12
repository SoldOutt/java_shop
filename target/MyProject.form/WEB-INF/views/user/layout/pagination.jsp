
<div class="d-flex justify-content-center">
<nav aria-label="...">
  <ul class="pagination">
    <li class="page-item  ${ page == 1 ? 'disabled': ''}">
      <a class="page-link" href="/user/product?page=${page-1}">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item active" aria-current="page">
      <span class="page-link">2</span>
    </li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="/user/product?page=${page+1}">Next</a>
    </li>
  </ul>
</nav>
</div>