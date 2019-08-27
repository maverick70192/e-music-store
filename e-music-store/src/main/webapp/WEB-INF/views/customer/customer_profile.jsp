<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.table {
	table-layout: fixed;
	overflow: auto;
}

.table td {
	text-align: left;
/* 	display: table-cell; */
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>

<div class="container-wrapper" style="margin-top: 80px; margin-bottom: 60px;">
	<div class="container">
		<div class="page-header">
			<h1>Customer Details</h1>
		</div>
		<div class="table-responsive">
			<table id="table" class="table table-hover">
				<tbody>
					<tr>
						<td>Name</td>
						<td>${ customer.name }</td>
					</tr>
					<tr>
						<td>Email</td>
						<td>${ customer.email }</td>
					</tr>
					<tr>
						<td>Phone</td>
						<td>${ customer.phone }</td>
					</tr>
					<tr>
						<td>Username</td>
						<td>${ customer.username }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="container">
		<div class="page-header">
			<h1>Billing Details</h1>
		</div>
		<div class="table-responsive">
			<table id="table" class="table table-hover">
				<tbody>
					<tr>
						<td>StreetName</td>
						<td>${ customer.billingAddress.streetName }</td>
					</tr>
					<tr>
						<td>ApartmentNumber</td>
						<td>${ customer.billingAddress.apartmentNumber }</td>
					</tr>
					<tr>
						<td>City</td>
						<td>${ customer.billingAddress.city }</td>
					</tr>
					<tr>
						<td>State</td>
						<td>${ customer.billingAddress.state }</td>
					</tr>
					<tr>
						<td>Country</td>
						<td>${ customer.billingAddress.country }</td>
					</tr>
					<tr>
						<td>ZipCode</td>
						<td>${ customer.billingAddress.zipCode }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="container">
		<div class="page-header">
			<h1>Shipping Details</h1>
		</div>
		<div class="table-responsive">
			<table id="table" class="table table-hover">
				<tbody>
					<tr>
						<td>StreetName</td>
						<td>${ customer.shippingAddress.streetName }</td>
					</tr>
					<tr>
						<td>ApartmentNumber</td>
						<td>${ customer.shippingAddress.apartmentNumber }</td>
					</tr>
					<tr>
						<td>City</td>
						<td>${ customer.shippingAddress.city }</td>
					</tr>
					<tr>
						<td>State</td>
						<td>${ customer.shippingAddress.state }</td>
					</tr>
					<tr>
						<td>Country</td>
						<td>${ customer.shippingAddress.country }</td>
					</tr>
					<tr>
						<td>ZipCode</td>
						<td>${ customer.shippingAddress.zipCode }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<br/>
		<a href="" class="btn btn-primary">Edit Profile</a>
	</div>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
