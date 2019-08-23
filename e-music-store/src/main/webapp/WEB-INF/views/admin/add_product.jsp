<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<div class="conatiner-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Add Product</h1>
			<p class="lead">Fill, the below information to add a product!</p>
		</div>
		<sf:form modelAttribute="product" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${ _csrf.parameterName }"
					value="${ _csrf.token }">
			<sf:errors path="*" element="div" cssClass="errors" />
			<div class="form-group">
				<sf:label path="name" cssErrorClass="error">Name:</sf:label>
				<sf:input path="name" cssErrorClass="error" class="form-control"
					placeholder="Enter product name" />
			</div>
			<div class="form-group">
				<sf:label path="description" cssErrorClass="error">Description:</sf:label>
				<sf:textarea rows="6" path="description" cssErrorClass="error"
					class="form-control" placeholder="Enter product description" />
			</div>
			<div class="form-group">
				<sf:label path="category" cssErrorClass="error">Category:</sf:label>
				<sf:select path="category" class="form-control"
					cssErrorClass="error">
					<sf:option value="instrument">Instrument</sf:option>
					<sf:option value="record">Record</sf:option>
					<sf:option value="accessory">Accessory</sf:option>
				</sf:select>
			</div>
			<div class="form-group">
				<sf:label path="price" cssErrorClass="error">Price:</sf:label>
				<sf:input path="price" cssErrorClass="error" class="form-control"
					placeholder="Enter the price" />
			</div>
			<div class="form-group">
				<sf:label path="quality" cssErrorClass="error">Quality:</sf:label>
				<sf:select path="quality" class="form-control"
					cssErrorClass="error">
					<sf:option value="new">New</sf:option>
					<sf:option value="refurbished">Refurbished</sf:option>
					<sf:option value="used">Used</sf:option>
				</sf:select>
			</div>
			<div class="form-group">
				<sf:label path="status" cssErrorClass="error">Status:</sf:label>
				<sf:select path="status" class="form-control"
					cssErrorClass="error">
					<sf:option value="active">Active</sf:option>
					<sf:option value="inactive">Inactive</sf:option>
				</sf:select>
			</div>
			<div class="form-group">
				<sf:label path="unitInStock" cssErrorClass="error">Unit in Stock:</sf:label>
				<sf:input path="unitInStock" cssErrorClass="error"
					class="form-control" placeholder="Enter the unit in the stock" />
			</div>
			<div class="form-group">
				<sf:label path="manufacturer" cssErrorClass="error">Manufacturer:</sf:label>
				<sf:input path="manufacturer" cssErrorClass="error"
					class="form-control" placeholder="Enter the manufacturer name" />
			</div>
			<div class="form-group">
				<sf:label path="image" cssErrorClass="error">Upload Picture</sf:label>:
				<sf:input type="file" path="image" accept="image/*" cssErrorClass="error" class="form-control" />			
			</div>
			<br/>
			<div class="form-group">
				<sf:button type="submit" class="btn btn-primary">Submit</sf:button>
				<a href="<s:url value="/admin/product-inventory"/>" class="btn btn-primary">Cancel</a>
			</div>
		</sf:form>
	</div>
</div>