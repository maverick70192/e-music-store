<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<div class="container-wrapper">
	<div class="container">
		<section>
			<div class="jumbotron">
				<div class="container">
					<h1>Customer registered successfully!</h1>
				</div>
			</div>
		</section>

		<section class="container">
			<p>
				<a href="<s:url value="/products/all"/>" class="btn btn-primary pull-left">Products</a>
			</p>
		</section>
	</div>
</div>