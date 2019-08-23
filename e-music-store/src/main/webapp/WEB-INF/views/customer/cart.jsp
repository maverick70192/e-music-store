<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="container-wrapper" style="margin-bottom: 30px;">
	<div class="container">
		<section>
			<div class="jumbotron">
				<div class="container">
					<h1>Cart</h1>

					<p>All the selected products in your shopping cart.</p>
				</div>
			</div>
		</section>

		<section class="container" ng-app="cartApp">
			<div ng-controller="cartCtrl" ng-init="initCartId('${ cartId }')">
				<table class="table table-hover">
					<tr>
						<th>Product</th>
						<th>Unit Price</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Action</th>
					</tr>
					<tr ng-repeat="item in cart.cartItems">
						<td>{{ item.product.name }}</td>
						<td>{{ item.product.price }}</td>
						<td>{{ item.quantity }}</td>
						<td>{{ item.totalPrice }}</td>
						<td>
							<a href="#" class="label label-danger" ng-click="removeFromCart(item.product.id)">
								<span class="glyphicon glyphicon-remove"></span> &nbsp;  remove
							</a>
						</td>
					</tr>
					<tr>
						<th></th>
						<th></th>
						<th>Grand Total</th>
						<th>{{ calGrandTotal() }}</th>
						<th></th>
					</tr>
				</table>

				<a href="<s:url value="/products/all"/>" class="btn btn-primary pull-left">Continue Shopping</a>
				<div class="pull-right">
					<a class="btn btn-danger" ng-click="clearCart()"><span
						class="glyphicon glyphicon-remove-sign"></span> &nbsp; Clear Cart</a>
					<a class="btn btn-success" href="<s:url value="/order/${ cartId }"/>"><span
						class="glyphicon glyphicon-shopping-cart"></span> &nbsp; Checkout</a>
				</div>
			</div>
		</section>
	</div>
</div>