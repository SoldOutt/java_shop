<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop</title>
      <jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
</head>

<body>
    <div class="header">
        <jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
        <!-- navbar -->
         <jsp:include page="/WEB-INF/views/user/layout/navigation.jsp"></jsp:include>
    </div>
        <div class="shopping_cart container-fluid px-xl-5 mt-5">
            <div class="row">
                <div class="col-lg-8">
                    <table>
                        <thead>
                            <td>Products</td>
                            <td>Price</td>
                            <td>Quantity</td>
                            <td>Total</td>
                            <td>Remove</td>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <img src="${base}/user/img/product-1.jpg" alt="">Product Name
                                </td>
                                <td class='vnd'>150</td>
                                <td>
                                    <div class="product_number">
                                        <button class="product_reduce">-</button>
                                        <input type="text" class="number_of_product" value="0">
                                        <button class="product_add">+</button>
                                    </div>
                                </td>
                                <td class='vnd'>150</td>
                                <td><button><span>x</span></button></td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="${base}/user/img/product-1.jpg" alt="">Product Name
                                </td>
                                <td class='vnd'>150</td>
                                <td>
                                    <div class="product_number">
                                        <button class="product_reduce">-</button>
                                        <input type="text" class="number_of_product" value="0">
                                        <button class="product_add">+</button>
                                    </div>
                                </td>
                                <td class='vnd'>150</td>
                                <td><button><span>x</span></button></td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="${base}/user/img/product-1.jpg" alt="">Product Name
                                </td>
                                <td class='vnd'>150</td>
                                <td>
                                    <div class="product_number">
                                        <button class="product_reduce">-</button>
                                        <input type="text" class="number_of_product" value="0">
                                        <button class="product_add">+</button>
                                    </div>
                                </td>
                                <td class='vnd'>150</td>
                                <td><button><span>x</span></button></td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="${base}/user/img/product-1.jpg" alt="">Product Name
                                </td>
                                <td class='vnd'>150</td>
                                <td>
                                    <div class="product_number">
                                        <button class="product_reduce">-</button>
                                        <input type="text" class="number_of_product" value="0">
                                        <button class="product_add">+</button>
                                    </div>
                                </td>
                                <td class='vnd'>150</td>
                                <td><button><span>x</span></button></td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="${base}/user/img/product-1.jpg" alt="">Product Name
                                </td>
                                <td class='vnd'>150</td>
                                <td>
                                    <div class="product_number">
                                        <button class="product_reduce">-</button>
                                        <input type="text" class="number_of_product" value="0">
                                        <button class="product_add">+</button>
                                    </div>
                                </td>
                                <td class='vnd'>150</td>
                                <td><button><span>x</span></button></td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="${base}/user/img/product-1.jpg" alt="">Product Name
                                </td>
                                <td class='vnd'>150</td>
                                <td>
                                    <div class="product_number">
                                        <button class="product_reduce">-</button>
                                        <input type="text" class="number_of_product" value="0">
                                        <button class="product_add">+</button>
                                    </div>
                                </td>
                                <td class='vnd'>150</td>
                                <td><button><span>x</span></button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-4">
                    <div class="coupon_code">
                        <input type="text" placeholder="Coupon Code">
                        <button>Apply Coupon</button>
                    </div>
                    <div class="pay_cart">
                        <div class="cart_summary">
                            <h3>CART SUMMARY</h3>
                        </div>
                        <div class="cart_total">
                            <div class="">
                                <p>Subtotal</p>
                                <p id="total_cart" class="vnd">150</p>
                            </div>
                            <div class="">
                                <p>Shipping</p>
                                <p>$10</p>
                            </div>
                            <div class="cart_buy">
                                <div class="">
                                    <p>Total</p>
                                    <p>$160</p>
                                </div>
                                <button>Buy it</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
    </div>
    <!-- JavaScript Bundle with Popper -->
   <jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</body>