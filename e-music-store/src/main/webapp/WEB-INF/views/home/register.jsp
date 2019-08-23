<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<div class="conatiner-wrapper" style="margin-bottom: 80px;">
	<div class="container">
		<div class="page-header">
			<h1>Register Customer</h1>
			<p class="lead">Please fill in your information below!</p>
		</div>
		<sf:form modelAttribute="customer" method="post">
			<input type="hidden" name="${ _csrf.parameterName }"
					value="${ _csrf.token }">
			<sf:errors path="*" element="div" cssClass="errors" />
			
			<h2>Basic Information:</h2>
			<br/>
			<div class="form-group">
				<sf:label path="name" cssErrorClass="error">Name:</sf:label>
				<sf:input path="name" cssErrorClass="error" class="form-control"
					placeholder="Enter your name" />
			</div>
			
			<div class="form-group">
				<sf:label path="email" cssErrorClass="error">Email:</sf:label>
<%-- 				&nbsp; <span style="color: #ff0000">${ emailMessage }</span> --%>
				<sf:input path="email" cssErrorClass="error" class="form-control"
					placeholder="Enter your email" />
			</div>
			
			<div class="form-group">
				<sf:label path="phone" cssErrorClass="error">Phone:</sf:label>
				<sf:input path="phone" cssErrorClass="error" class="form-control"
					placeholder="Enter your phone" />
			</div>
			
			<div class="form-group">
				<sf:label path="username" cssErrorClass="error">Username:</sf:label>
<%-- 				&nbsp; <span style="color: #ff0000">${ usernameMessage }</span> --%>
				<sf:input path="username" cssErrorClass="error" class="form-control"
					placeholder="Enter your username" />
			</div>
			
			<div class="form-group">
				<sf:label path="password" cssErrorClass="error">Password:</sf:label>
				<sf:password path="password" cssErrorClass="error" class="form-control" />
			</div>
			
			<br/>
			<h2>Billing Address:</h2>
			<br/>
			<div class="form-group">
				<sf:label path="billingAddress.streetName" cssErrorClass="error">StreetName:</sf:label>
				<sf:input path="billingAddress.streetName" cssErrorClass="error" class="form-control"
					placeholder="Enter your streetname" />
			</div>
			
			<div class="form-group">
				<sf:label path="billingAddress.apartmentNumber" cssErrorClass="error">ApartmentNumber:</sf:label>
				<sf:input path="billingAddress.apartmentNumber" cssErrorClass="error" class="form-control"
					placeholder="Enter your apartmentNumber" />
			</div>
			
			<div class="form-group">
				<sf:label path="billingAddress.city" cssErrorClass="error">City:</sf:label>
				<sf:input path="billingAddress.city" cssErrorClass="error" class="form-control"
					placeholder="Enter your city" />
			</div>
			
			<div class="form-group">
				<sf:label path="billingAddress.state" cssErrorClass="error">State:</sf:label>
				<sf:input path="billingAddress.state" cssErrorClass="error" class="form-control"
					placeholder="Enter your state" />
			</div>
			
			<div class="form-group">
				<sf:label path="billingAddress.country" cssErrorClass="error">Country:</sf:label>
				<sf:input path="billingAddress.country" cssErrorClass="error" class="form-control"
					placeholder="Enter your country" />
			</div>
			
			<div class="form-group">
				<sf:label path="billingAddress.zipCode" cssErrorClass="error">ZipCode:</sf:label>
				<sf:input path="billingAddress.zipCode" cssErrorClass="error" class="form-control"
					placeholder="Enter your zipCode" />
			</div>
			
			<br/>
			<h2>Shipping Address:</h2>
			<br/>
			<div class="form-group">
				<sf:label path="shippingAddress.streetName" cssErrorClass="error">StreetName:</sf:label>
				<sf:input path="shippingAddress.streetName" cssErrorClass="error" class="form-control"
					placeholder="Enter your streetname" />
			</div>
			
			<div class="form-group">
				<sf:label path="shippingAddress.apartmentNumber" cssErrorClass="error">ApartmentNumber:</sf:label>
				<sf:input path="shippingAddress.apartmentNumber" cssErrorClass="error" class="form-control"
					placeholder="Enter your apartmentNumber" />
			</div>
			
			<div class="form-group">
				<sf:label path="shippingAddress.city" cssErrorClass="error">City:</sf:label>
				<sf:input path="shippingAddress.city" cssErrorClass="error" class="form-control"
					placeholder="Enter your city" />
			</div>
			
			<div class="form-group">
				<sf:label path="shippingAddress.state" cssErrorClass="error">State:</sf:label>
				<sf:input path="shippingAddress.state" cssErrorClass="error" class="form-control"
					placeholder="Enter your state" />
			</div>
			
			<div class="form-group">
				<sf:label path="shippingAddress.country" cssErrorClass="error">Country:</sf:label>
				<sf:input path="shippingAddress.country" cssErrorClass="error" class="form-control"
					placeholder="Enter your country" />
			</div>
			
			<div class="form-group">
				<sf:label path="shippingAddress.zipCode" cssErrorClass="error">ZipCode:</sf:label>
				<sf:input path="shippingAddress.zipCode" cssErrorClass="error" class="form-control"
					placeholder="Enter your zipCode" />
			</div>
			
			<br/>
			<div class="form-group">
				<sf:button type="submit" class="btn btn-primary">Register</sf:button>
				<a href="<s:url value="/"/>" class="btn btn-primary">Cancel</a>
			</div>
		</sf:form>
	</div>
</div>