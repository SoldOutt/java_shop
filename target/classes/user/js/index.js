var categories = document.querySelector('.categories_menu');
categories.addEventListener('click', function() {
	var categories_list = document.querySelector('.categories_menu ul');
	if (categories_list.style.height == '0px' || categories_list.style.height == 0) {
		var h = 41 * categories_list.childElementCount;
		categories_list.style.height = h + 'px';
	} else {
		categories_list.style.height = '0';
	}
})
var navMobile = document.querySelector('.nav_bar-mobile')
// window.addEventListener('click', function(){
//  navMobile.classList.remove('active')    
// })
navMobile.addEventListener('click', function() {
	navMobile.classList.toggle('active')
})
// SignIn-SignUp
function Login_toggle() {
	var contain = document.querySelector('section .contain');
	var section = document.querySelector('section');
	contain.classList.toggle('active');
	section.classList.toggle('active');
}

//detail product
// images
var numImg = 1;
var buttonNextImg = document.querySelector('.detail_product-img--next')
var buttonPrevImg = document.querySelector('.detail_product-img--prev')
var product_Img = document.querySelector('.detail_product-img img')
if (buttonNextImg) {

	buttonNextImg.addEventListener('click', function() {
		numImg++;
		if (numImg > 5) numImg = 1;
		var srcImg = `img/product-${numImg}.jpg`
		product_Img.setAttribute('src', srcImg)

	})
}
if (buttonPrevImg) {

	buttonPrevImg.addEventListener('click', function() {
		numImg--;
		if (numImg < 1) numImg = 5;
		var srcImg = `img/product-${numImg}.jpg`
		product_Img.setAttribute('src', srcImg)

	})
}

// cart
var product_number = document.querySelectorAll('.product_number');
product_number.forEach(function(x) {
	var countProduct = x.children[1]
	var buttonReduce = x.children[0]
	var buttonAdd = x.children[2]

	countProduct.addEventListener('change', () => { changeCartItem(countProduct.getAttribute('data-item'), countProduct.value) })

	buttonReduce.addEventListener('click', function() {
		var numProduct = parseInt(countProduct.value);
		if (!numProduct || numProduct <= 0) {
			numProduct = 0;
			countProduct.value = numProduct
			changeCartItem(countProduct.getAttribute('data-item'), countProduct.value)
		} else {
			numProduct--
			countProduct.value = numProduct
			changeCartItem(countProduct.getAttribute('data-item'), countProduct.value)
		}

	})
	buttonAdd.addEventListener('click', function() {
		var numProduct = parseInt(countProduct.value);
		if (!numProduct && numProduct != 0) {
			numProduct = 0;
			countProduct.value = numProduct
			changeCartItem(countProduct.getAttribute('data-item'), countProduct.value)
		} else {
			numProduct++
			countProduct.value = numProduct
			changeCartItem(countProduct.getAttribute('data-item'), countProduct.value)
		}
	})
})


var listProduct_Buy = document.querySelectorAll('.shopping_cart tbody tr')
var totalCart = 0
if (listProduct_Buy) {
	listProduct_Buy.forEach(function(item) {
		item.children[2].children[0].addEventListener('click', () => {
			totalCart -= parseInt(item.children[3].innerHTML)
			var price = item.children[1].innerHTML
			var count = item.children[2].children[0].children[1].value
			var sumPriceOfItem = price * count
			item.children[3].innerHTML = sumPriceOfItem
			totalCart += parseInt(item.children[3].innerHTML)
			document.querySelector('#total_cart').innerHTML = totalCart
		})
		totalCart += parseInt(item.children[3].innerHTML)
		document.querySelector('#total_cart').innerHTML = totalCart
		
		
		item.children[4].children[0].addEventListener('click', () => {
			totalCart -= parseInt(item.children[3].innerHTML)
			changeCartItem(item.getAttribute('data-item'),0)
			console.log(item.getAttribute('data-item'),0)
			document.querySelector('#total_cart').innerHTML = totalCart
			item.remove()
		})
	})
}
// review
var reviewProduct = document.querySelectorAll('.product_review-cat ul li');
var reviewProduct_box = document.querySelectorAll('.product_review-tab>div');
var reviewProduct_num

reviewProduct.forEach(function(x) {
	x.addEventListener('click', function() {
		var a = document.querySelector('.product_review-cat ul li.active');
		a.classList.remove('active')
		x.classList.add('active')
		reviewProduct_num = x.getAttribute('data-review')
		var reviewTap = document.querySelector('.product_review-tab');
		var reviewTapActive = document.querySelector('.product_review-tab>div.active');
		reviewTapActive.classList.remove('active')
		reviewTap.children[reviewProduct_num].classList.add('active')
	})
})



//admin
var adminControl = document.querySelectorAll('.admin_control ul li')
var viewData = document.querySelectorAll('.data>table')
console.log(viewData)
adminControl.forEach(function(x) {
	x.addEventListener('click', function() {
		var a = document.querySelector('.admin_control ul li.active')
		a.classList.remove('active')
		x.classList.add('active')
		var dataReview = x.getAttribute('data_review')
		console.log(dataReview)
		var data_Table = document.querySelector('.data>table.active')
		data_Table.classList.remove('active')
		viewData[dataReview].classList.add('active')

	})
})

//form pop up
function closeForm() {
	$('.form-popup-bg').removeClass('is-visible');
}

$(document).ready(function($) {

	/* Contact Form Interactions */
	$('#btnOpenForm').on('click', function(event) {
		event.preventDefault();

		$('.form-popup-bg').addClass('is-visible');
	});

	//close popup when clicking x or off popup
	$('.form-popup-bg').on('click', function(event) {
		if ($(event.target).is('.form-popup-bg') || $(event.target).is('#btnCloseForm')) {
			event.preventDefault();
			$(this).removeClass('is-visible');
		}
	});

});

//change cart view 
function changeCartItem(idProduct, quanlity) {
	// javascript object.
	// data la du lieu ma day len action cua controller
	let data = {
		productId: idProduct, // lay theo id
		quanlity: quanlity, // lay theo id
	};
	console.log(data)
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: "/user/change_cart",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json


		success: function(jsonResult) {
			console.log(jsonResult)
			document.querySelector("#totalCartItem").textContent = jsonResult.totalItems
		},
		error: function(jqXhr, textStatus, errorMessage) { // error callback 
		}
	});
}

//change cart view 
function addOneToCart(idProduct, quanlity) {
	// javascript object.
	// data la du lieu ma day len action cua controller
	let data = {
		productId: idProduct, // lay theo id
		quanlity: quanlity, // lay theo id
	};
	console.log(data)
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: "/cart/add",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json


		success: function(jsonResult) {
			console.log(jsonResult)
			document.querySelector("#totalCartItem").textContent = jsonResult.totalItems
		},
		error: function(jqXhr, textStatus, errorMessage) { // error callback 
		}
	});
}

