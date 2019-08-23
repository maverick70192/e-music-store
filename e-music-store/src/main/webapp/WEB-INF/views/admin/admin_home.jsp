<%@ page language="java" isELIgnored="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<div class="conatiner-wrapper" style="margin-bottom: 90px;">
	<div class="container">
		<div class="page-header">
			<h1>Administrator Page</h1>
			<p class="lead">This is the administrator page!</p>
		</div>
		
		<c:if test="${ request.userPrincipal.name != null }">
			<h2>
				Welcome, ${ request.userPrincipal.name } | <a href="<s:url value="/logout" />">Logout</a>
			</h2>
		</c:if>
		
		<h3>
			<a href="<s:url value="/admin/product-inventory" />">Product Inventory</a>
		</h3>
		
		<p>Here you can view, check and modify the product inventory!</p>
		
		<br/><br/>
		
		<h3>
			<a href="<s:url value="/admin/customers" />">Customer Management</a>
		</h3>
		
		<p>Here you can view customer information!</p>
	</div>
</div>