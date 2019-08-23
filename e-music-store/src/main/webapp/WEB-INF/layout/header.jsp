<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!-- Navbar -->
<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value="/" />"><img
				width="180" height="30"
				src="<c:url value="/resources/images/NETEXAM.png"/>"
				alt="Netxam_logo"></a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<c:url value="/" />">HOME</a></li>
				<li><a href="<c:url value="/products/all" />">PRODUCTS</a></li>
				<li><a href="<c:url value="/about" />">ABOUT</a></li>

				<c:if test="${ pageContext.request.userPrincipal.name != null }">

					<c:if test="${ pageContext.request.userPrincipal.name == 'admin' }">
						<li><a href="<s:url value="/admin" />">ADMIN</a></li>
					</c:if>

					<c:if test="${ pageContext.request.userPrincipal.name != 'admin' }">
						<c:set value="${ pageContext.request.userPrincipal.name }" var="username" />
						<s:url value="/customer/{customerId}" var="customerUrl">
							<s:param name="customerId" value="${ username }" />
						</s:url>
						<li><a href="${customerUrl }">${ fn:toUpperCase(username) }</a></li>
						<li><a href="<s:url value="/customer/cart" />">CART</a></li>
					</c:if>

					<li><a href="<s:url value="/logout" />">LOGOUT</a></li>
				</c:if>

				<c:if test="${ pageContext.request.userPrincipal.name == null }">
					<li><a href="<c:url value="/login" />">LOGIN</a></li>
					<li><a href="<c:url value="/register" />">REGISTER</a></li>
				</c:if>

			</ul>
		</div>
	</div>
</nav>