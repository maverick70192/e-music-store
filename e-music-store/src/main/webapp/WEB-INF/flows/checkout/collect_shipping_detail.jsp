<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<div class="conatiner-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Customer</h1>
			<p class="lead">Shipping Details!</p>
		</div>
		<sf:form modelAttribute="order" class="form-horizaontal">
<%-- 			<input type="hidden" name="${ _csrf.parameterName }" --%>
<%-- 					value="${ _csrf.token }"> --%>
			<sf:errors path="*" element="div" cssClass="errors" />
			
			<h2>Shipping Address:</h2>
			<br/>
			<div class="form-group">
				<sf:label path="cart.customer.shippingAddress.streetName" cssErrorClass="error">StreetName:</sf:label>
				<sf:input path="cart.customer.shippingAddress.streetName" cssErrorClass="error" class="form-control"
					placeholder="Enter your streetname" />
			</div>
			
			<div class="form-group">
				<sf:label path="cart.customer.shippingAddress.apartmentNumber" cssErrorClass="error">ApartmentNumber:</sf:label>
				<sf:input path="cart.customer.shippingAddress.apartmentNumber" cssErrorClass="error" class="form-control"
					placeholder="Enter your apartmentNumber" />
			</div>
			
			<div class="form-group">
				<sf:label path="cart.customer.shippingAddress.city" cssErrorClass="error">City:</sf:label>
				<sf:input path="cart.customer.shippingAddress.city" cssErrorClass="error" class="form-control"
					placeholder="Enter your city" />
			</div>
			
			<div class="form-group">
				<sf:label path="cart.customer.shippingAddress.state" cssErrorClass="error">State:</sf:label>
				<sf:input path="cart.customer.shippingAddress.state" cssErrorClass="error" class="form-control"
					placeholder="Enter your state" />
			</div>
			
			<div class="form-group">
				<sf:label path="cart.customer.shippingAddress.country" cssErrorClass="error">Country:</sf:label>
				<sf:input path="cart.customer.shippingAddress.country" cssErrorClass="error" class="form-control"
					placeholder="Enter your country" />
			</div>
			
			<div class="form-group">
				<sf:label path="cart.customer.shippingAddress.zipCode" cssErrorClass="error">ZipCode:</sf:label>
				<sf:input path="cart.customer.shippingAddress.zipCode" cssErrorClass="error" class="form-control"
					placeholder="Enter your zipCode" />
			</div>
			
			<input type="hidden" name="_flowExecutionKey" />
			
			<br/>
			<div class="form-group products">
				<sf:button class="btn btn-primary" name="_eventId_backToCollectCustomerInfo">Back</sf:button>
				<sf:button type="submit" class="btn btn-primary" name="_eventId_shippingDetailCollected">Next</sf:button>
				<sf:button class="btn btn-primary" name="_eventId_cancel">Cancel</sf:button>
			</div>
		</sf:form>
	</div>
</div>