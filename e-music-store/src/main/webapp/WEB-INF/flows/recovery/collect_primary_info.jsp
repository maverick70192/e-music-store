<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<div class="conatiner-wrapper" style="margin-bottom: 80px;">
	<div class="container">
		<div class="page-header">
			<h1>Customer Recovery</h1>
			<p class="lead">Please fill in your information below for user discovery!</p>
		</div>
		<sf:form modelAttribute="forgotPassword" method="post">
			<input type="hidden" name="${ _csrf.parameterName }"
				value="${ _csrf.token }">
			<sf:errors path="*" element="div" cssClass="errors" />
			<br />
			<div class="form-group">
				<sf:label path="username" cssErrorClass="error">Username:</sf:label>
				<sf:input path="username" cssErrorClass="error" class="form-control"
					placeholder="Enter your username" />
			</div>

			<div class="form-group">
				<sf:label path="email" cssErrorClass="error">Email:</sf:label>
				<sf:input path="email" cssErrorClass="error" class="form-control"
					placeholder="Enter your email" />
			</div>

			<input type="hidden" name="_flowExecutionKey" />

			<br />
			<div class="form-group">
				<sf:button type="submit" class="btn btn-primary"
					name="_eventId_primaryInfoCollected">Next</sf:button>
				<sf:button class="btn btn-primary" name="_eventId_cancel">Cancel</sf:button>
			</div>
		</sf:form>
	</div>
</div>