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

<div class="conatiner-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Product Inventory Page</h1>
			<c:choose>
				<c:when test="${ empty products }">
					<p class="lead">Sorry, No product here right now!</p>
				</c:when>
				<c:otherwise>
					<p class="lead">This is the product inventory page!</p>
				</c:otherwise>
			</c:choose>
		</div>
		<c:if test="${ not empty products }">
			<div class="table-responsive">
				<table id="table" class="table table-stripped table-hover">
					<thead>
						<tr class="bg-success">
							<th>Photo Thumb</th>
							<th>Product Name</th>
							<th>Category</th>
							<th>Quality</th>
							<th>Price</th>
							<!-- 						<th>Status</th> -->
							<!-- 						<th>UnitInStock</th> -->
							<!-- 						<th>Manufacturer</th> -->
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ products }" var="product">
							<s:url value="/products/product/{productId}" var="productViewUrl">
								<s:param name="productId" value="${ product.id }" />
							</s:url>
							<s:url value="/admin/product-inventory/delete-product/{productId}" var="productDeleteUrl">
								<s:param name="productId" value="${ product.id }" />
							</s:url>
							<s:url value="/admin/product-inventory/edit-product/{productId}" var="productEditUrl">
								<s:param name="productId" value="${ product.id }" />
							</s:url>
							<s:url value="/resources/images/{imageName}" var="imageUrl">
								<s:param name="imageName" value="${ product.imageName }" />
							</s:url>
							<tr>
								<td><img alt="image" style="width:100%;" src="${ imageUrl }"></td>
								<td>${ product.name }</td>
								<td>${ product.category }</td>
								<td>${ product.quality }</td>
								<td>
									<fmt:formatNumber type="currency" groupingUsed="true" value="${ product.price }" />
								</td>
								<%-- 							<td>${ product.status }</td> --%>
								<%-- 							<td>${ product.unitInStock }</td> --%>
								<%-- 							<td>${ product.manufacturer }</td> --%>
								<td>
									<a href="${ productViewUrl }">
										<span class="glyphicon glyphicon-info-sign"></span>
									</a>
									&ensp;&ensp;&ensp;
									<a href="${ productDeleteUrl }">
										<span class="glyphicon glyphicon-remove"></span>
									</a>
									&ensp;&ensp;&ensp;
									<a href="${ productEditUrl }">
										<span class="glyphicon glyphicon-pencil"></span>
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
		<a class="btn btn-primary" style="margin:30px 0px 40px 0px" href="<s:url value="/admin/add-product" />">Add Product</a>
	</div>
</div>