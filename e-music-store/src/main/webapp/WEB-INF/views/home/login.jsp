<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="conatiner-wrapper" style="margin-top: 40px; margin-bottom: 80px;">
	<div class="container">
		<div class="login-box">
			<c:choose>
				<c:when test="${ not empty message }">
					<h2>${ message }</h2>
				</c:when>
				<c:when test="${ not empty error }">
					<h2 class="error" style="color: #ff0000;">${ error }</h2>
				</c:when>
				<c:otherwise>
					<h2>Login with username and password!</h2>
				</c:otherwise>
			</c:choose>
			<br/>
			<form name="loginForm" method="post">
				<div class="form-group">
					<label for="username">Username:</label>
					<input type="text" id="username" name="username" class="form-control" />
				</div>
				<div class="form-group">
					<label for="password">Password:</label>
					<input type="password" id="password" name="password" class="form-control" />
				</div>
				<div class="form-group">
					<input type="checkbox" class=" id="remember-me" name="remember-me" />
					<label for="remember-me">Remember Me</label>
				</div>
				<div class="form-group">
					<input type="submit" value="Login" class="btn btn-primary" />
					&nbsp; <a class="btn btn-warning" href="<s:url value="/forgot-password" />">Forgot Password?</a>
				</div>
				<input type="hidden" name="${ _csrf.parameterName }"
					value="${ _csrf.token }">
			</form>
		</div>
	</div>
</div>