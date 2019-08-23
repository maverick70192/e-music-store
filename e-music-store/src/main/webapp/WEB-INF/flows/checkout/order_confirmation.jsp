<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="now" class="java.util.Date" />

<div class="conatiner-wrapper" style="margin-bottom:20px;">
	<div class="container">
		<div class="page-header">
			<h1>Order</h1>
			<p class="lead">Order Confirmation!</p>
		</div>

		<div class="container">

			<div class="row">

				<sf:form modelAttribute="order" class="form-horizaontal">
					<%-- 			<input type="hidden" name="${ _csrf.parameterName }" --%>
					<%-- 					value="${ _csrf.token }"> --%>

					<div class="well col-lg-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-1">

						<div class="text-center">
							<h1>Receipt</h1>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<address>
									<strong>Shipping Address</strong><br/>
									${ order.cart.customer.shippingAddress.streetName } <br/>
									${ order.cart.customer.shippingAddress.apartmentNumber } <br/>
									${ order.cart.customer.shippingAddress.city }, ${ order.cart.customer.shippingAddress.state } <br/>
									${ order.cart.customer.shippingAddress.country }, ${ order.cart.customer.shippingAddress.zipCode } <br/>
								</address>
							</div>
							
							<div class="col-xs-6 col-sm-6 col-md-6 text-right">
								<p>Shipping Date: <fmt:formatDate type="date" value="${ now }" /></p>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<address>
									<strong>Billing Address</strong><br/>
									${ order.cart.customer.billingAddress.streetName } <br/>
									${ order.cart.customer.billingAddress.apartmentNumber } <br/>
									${ order.cart.customer.billingAddress.city }, ${ order.cart.customer.billingAddress.state } <br/>
									${ order.cart.customer.billingAddress.country }, ${ order.cart.customer.billingAddress.zipCode } <br/>
								</address>
							</div>
						</div>
						
						<div class="row">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Product</th>
										<th>Quantity</th>
										<th class="text-center">Price</th>
										<th class="text-center">Total</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ order.cart.cartItems }" var="cartItem">
										<tr>
											<td class="col-md-9"><em>${ cartItem.product.name }</em></td>
											<td class="col-md-1" style="text-align:center"><em>${ cartItem.quantity }</em></td>
											<td class="col-md-1" style="text-align:center"><em><fmt:formatNumber type="currency" value="${ cartItem.product.price }" /></em></td>
											<td class="col-md-1" style="text-align:center"><em><fmt:formatNumber type="currency" value="${ cartItem.totalPrice }" /></em></td>
										</tr>
									</c:forEach>
									
									<tr>
										<td></td>
										<td></td>
										<td class="text-right">
											<h4><strong>Grand total: </strong></h4>
										</td>
										<td class="text-center text-danger">
											<h4><strong><fmt:formatNumber type="currency" value="${ order.cart.grandTotal }" /></strong></h4>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<input type="hidden" name="_flowExecutionKey" /> <br />
						<div class="form-group">
							<sf:button class="btn btn-primary"
								name="_eventId_backToCollectShippingDetail">Back</sf:button>
							<sf:button type="submit" class="btn btn-primary"
								name="_eventId_orderConfirmed">Submit Order</sf:button>
							<sf:button class="btn btn-primary" name="_eventId_cancel">Cancel</sf:button>
						</div>
					</div>
				</sf:form>
			</div>
		</div>
	</div>
</div>