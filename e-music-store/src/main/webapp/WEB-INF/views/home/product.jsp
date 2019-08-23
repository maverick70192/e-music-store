<%@ page language="java" isELIgnored="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="conatiner-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Product Detail</h1>

			<p class="lead">Here is the detailed information of the product!</p>
		</div>

		<s:url value="/resources/images/{imageName}" var="imageUrl">
			<s:param name="imageName" value="${ product.imageName }" />
		</s:url>

		<div class="container product" ng-app="cartApp">
			<div class="row">
				<div class="col-md-5">
					<img alt="image" src="${ imageUrl }" style="width: 100%; height: 300px" />
				</div>
				<div class="col-md-5">
					<h3>${ product.name }</h3>
					<p>${ product.description }</p>
					<p>
						<strong>Manufacturer</strong> : ${ product.manufacturer }
					</p>
					<p>
						<strong>Category</strong> : ${ product.category }
					</p>
					<p>
						<strong>Quality</strong> : ${ product.quality }
					</p>
					<h4><fmt:formatNumber type="currency" groupingUsed="true" value="${ product.price }" /></h4>
					
					<br/>
					
					<c:set var="username" scope="page" value="${ pageContext.request.userPrincipal.name }" />
					<c:set var="url" scope="page" value="/products/all" />
					<c:if test="${ username == 'admin' }">
						<c:set var="url" scope="page" value="/admin/product-inventory" />
					</c:if>
					
					<p ng-controller="cartCtrl">
						<a href="<s:url value="${ url }"/>" class="btn btn-primary">Back</a>
						
						<s:url value="/customer/cart/{cartId}" var="cartUrl">
							<s:param name="cartId" value="${ cartId }" />
						</s:url>
						
						<c:if test="${ role == null }">
							&nbsp; <a class="btn btn-warning" href="<s:url value="/login"/>">login to add to cart!</a>
						</c:if>
						
						<c:if test="${ role == 'ROLE_USER' }">
							<a href="#" class="btn btn-warning btn-large" ng-click="addToCart('${ product.id }')">
								<span class="glyphicon glyphicon-shopping-cart"></span> &nbsp; Add to Cart</a>
							<a href="${ cartUrl }" class="btn btn-primary">
								<span class="glyphicon glyphicon-hand-right"></span> &nbsp; View Cart
							</a>
						</c:if>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>