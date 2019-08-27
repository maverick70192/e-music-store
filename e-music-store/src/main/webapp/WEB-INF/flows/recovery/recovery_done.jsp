<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<div class="container-wrapper">
	<div class="container">
		<section>
			<div class="jumbotron">
				<div class="container">
					<h1>New Password is set!</h1>
					
					<p>You can now login and continue shopping!</p>
				</div>
			</div>
		</section>

		<section class="container">
			<p>
				<a href="<s:url value="/login"/>" class="btn btn-primary pull-left">Login Here!</a>
			</p>
		</section>
	</div>
</div>