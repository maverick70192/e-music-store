<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<div class="conatiner-wrapper" style="margin-bottom: 80px;">
	<div class="container">
		<div class="page-header">
			<h1>Customer Recovery</h1>
			<p class="lead">Please fill in your information below for security question answer!</p>
		</div>
		<sf:form modelAttribute="forgotPassword" method="post">
			<input type="hidden" name="${ _csrf.parameterName }"
				value="${ _csrf.token }">
			<sf:errors path="*" element="div" cssClass="errors" />
			<br />
			<div class="form-group">
				<sf:label path="username" cssErrorClass="error">Username:</sf:label>
				<input type="text" class="form-control" readonly="readonly"
					value="${ forgotPassword.username }" />
			</div>

			<div class="form-group">
				<sf:label path="email" cssErrorClass="error">Email:</sf:label>
				<input type="text" class="form-control" readonly="readonly"
					value="${ forgotPassword.email }" />
			</div>

			<div class="form-group">
				<sf:label path="securityQuestion" cssErrorClass="error">SecurityQuestion:</sf:label>
				<input type="text" class="form-control" readonly="readonly"
					value="${ forgotPassword.securityQuestion }" />
			</div>

			<div class="form-group">
				<sf:label path="answer" cssErrorClass="error">Answer:</sf:label>
				<sf:input path="password" cssErrorClass="error" class="form-control" />
			</div>

			<input type="hidden" name="_flowExecutionKey" />

			<br />
			<div class="form-group">
				<sf:button type="submit" class="btn btn-primary"
					name="_eventId_secondaryInfoCollected">Next</sf:button>
				<sf:button class="btn btn-primary" name="_eventId_cancel">Cancel</sf:button>
			</div>
		</sf:form>
	</div>
</div>