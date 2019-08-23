<%@ page language="java" isELIgnored="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<script>
$(document).ready(function() {
// 	var searchCondition = '${searchCondition}';
    $('#table').DataTable({
    	'lengthMenu': [[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, "All"]],
//     	"oSearch": {"sSearch": searchCondition}
    });
} );
</script>

<div class="conatiner-wrapper" style="margin-bottom: -100px;">
	<div class="container">
		<div class="page-header">
			<h1>Customer Management Page</h1>
			<c:choose>
				<c:when test="${ empty customers }">
					<p class="lead">Sorry, No Customer here right now!</p>
				</c:when>
				<c:otherwise>
					<p class="lead">This is the customer management page!</p>
				</c:otherwise>
			</c:choose>
		</div>
		<c:if test="${ not empty customers }">
			<div class="table-responsive products">
				<table id="table" class="table table-stripped table-hover">
					<thead>
						<tr class="bg-success">
							<th>Name</th>
							<th>Email</th>
							<th>Phone</th>
							<th>Username</th>
							<th>Enabled</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ customers }" var="customer">
							<tr>
								<td>${ customer.name }</td>
								<td>${ customer.email }</td>
								<td>${ customer.phone }</td>
								<td>${ customer.username }</td>
								<td>${ customer.enabled }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
	</div>
</div>