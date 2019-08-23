<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<div class="conatiner-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Customer</h1>
			<p class="lead">Customer Details!</p>
		</div>
		<sf:form modelAttribute="order" class="form-horizaontal">
<%-- 			<input type="hidden" name="${ _csrf.parameterName }" --%>
<%-- 					value="${ _csrf.token }"> --%>
			<sf:errors path="*" element="div" cssClass="errors" />
			
			<h2>Basic Information:</h2>
			<br/>
			<div class="form-group">
				<sf:label path="cart.customer.name" cssErrorClass="error">Name:</sf:label>
				<sf:input path="cart.customer.name" cssErrorClass="error" class="form-control"
					placeholder="Enter your name" />
			</div>
			
			<div class="form-group">
				<sf:label path="cart.customer.email" cssErrorClass="error">Email:</sf:label>
				<sf:input path="cart.customer.email" cssErrorClass="error" class="form-control"
					placeholder="Enter your email" />
			</div>
			
			<div class="form-group">
				<sf:label path="cart.customer.phone" cssErrorClass="error">Phone:</sf:label>
				<sf:input path="cart.customer.phone" cssErrorClass="error" class="form-control"
					placeholder="Enter your phone" />
			</div>
			
			<br/>
			<h2>Billing Address:</h2>
			<br/>
			<div class="form-group">
				<sf:label path="cart.customer.billingAddress.streetName" cssErrorClass="error">StreetName:</sf:label>
				<sf:input path="cart.customer.billingAddress.streetName" cssErrorClass="error" class="form-control"
					placeholder="Enter your streetname" />
			</div>
			
			<div class="form-group">
				<sf:label path="cart.customer.billingAddress.apartmentNumber" cssErrorClass="error">ApartmentNumber:</sf:label>
				<sf:input path="cart.customer.billingAddress.apartmentNumber" cssErrorClass="error" class="form-control"
					placeholder="Enter your apartmentNumber" />
			</div>
			
			<div class="form-group">
				<sf:label path="cart.customer.billingAddress.city" cssErrorClass="error">City:</sf:label>
				<sf:input path="cart.customer.billingAddress.city" cssErrorClass="error" class="form-control"
					placeholder="Enter your city" />
			</div>
			
			<div class="form-group">
				<sf:label path="cart.customer.billingAddress.state" cssErrorClass="error">State:</sf:label>
				<sf:input path="cart.customer.billingAddress.state" cssErrorClass="error" class="form-control"
					placeholder="Enter your state" />
			</div>
			
			<div class="form-group">
				<sf:label path="cart.customer.billingAddress.country" cssErrorClass="error">Country:</sf:label>
				<sf:input path="cart.customer.billingAddress.country" cssErrorClass="error" class="form-control"
					placeholder="Enter your country" />
			</div>
			
			<div class="form-group">
				<sf:label path="cart.customer.billingAddress.zipCode" cssErrorClass="error">ZipCode:</sf:label>
				<sf:input path="cart.customer.billingAddress.zipCode" cssErrorClass="error" class="form-control"
					placeholder="Enter your zipCode" />
			</div>
			
			<input type="hidden" name="_flowExecutionKey" />
			
			<br/>
			<div class="form-group products">
				<sf:button type="submit" class="btn btn-primary" name="_eventId_customerInfoCollected">Next</sf:button>
				<sf:button class="btn btn-primary" name="_eventId_cancel">Cancel</sf:button>
			</div>
		</sf:form>
	</div>
</div>