<%@ page isELIgnored="false" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.modal-dialog {
	width: 600px;
}

.thumbnail {
	margin-bottom: 6px;
}
</style>

<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>About Us</h1>

			<p>We are humble team who are passionate about helping our
				customers to get the best experience on music instruments and stuff.
				We are determined to provide the best products and services.</p>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-sm-4 col-6">
					<a href="#" title="Music"><img src="<c:url value="/resources/images/gallery/Gallery1.jpg"/>"
						class="thumbnail img-responsive"></a>
				</div>
				<div class="col-lg-3 col-sm-4 col-6">
					<a href="#" title="Music"><img
						src="<c:url value="/resources/images/gallery/Gallery2.jpg"/>"
						class="thumbnail img-responsive"></a>
				</div>
				<div class="col-lg-3 col-sm-4 col-6">
					<a href="#" title="Music"><img
						src="<c:url value="/resources/images/gallery/Gallery3.jpg"/>"
						class="thumbnail img-responsive"></a>
				</div>
				<div class="col-lg-3 col-sm-4 col-6">
					<a href="#" title="Music"><img
						src="<c:url value="/resources/images/gallery/Gallery4.jpg"/>"
						class="thumbnail img-responsive"></a>
				</div>
				<div class="col-lg-3 col-sm-4 col-6">
					<a href="#" title="Music"><img
						src="<c:url value="/resources/images/gallery/Gallery5.jpg"/>"
						class="thumbnail img-responsive"></a>
				</div>
				<div class="col-lg-3 col-sm-4 col-6">
					<a href="#" title="Music"><img
						src="<c:url value="/resources/images/gallery/Gallery6.jpg"/>"
						class="thumbnail img-responsive"></a>
				</div>
				<div class="col-lg-3 col-sm-4 col-6">
					<a href="#" title="Music"><img
						src="<c:url value="/resources/images/gallery/Gallery7.jpg"/>" 
						class="thumbnail img-responsive"></a>
				</div>
				<div class="col-lg-3 col-sm-4 col-6">
					<a href="#" title="Music"><img
						src="<c:url value="/resources/images/gallery/Gallery8.jpg"/>"
						class="thumbnail img-responsive"></a>
				</div>
				<div class="col-lg-3 col-sm-4 col-6">
					<a href="#" title="Music"><img
						src="<c:url value="/resources/images/gallery/Gallery9.jpg"/>"
						class="thumbnail img-responsive"></a>
				</div>
				
			</div>
		</div>
		<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<h3 class="modal-title">Heading</h3>
					</div>
					<div class="modal-body"></div>
					<div class="modal-footer">
						<button class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$('.thumbnail').click(function() {
		$('.modal-body').empty();
		var title = $(this).parent('a').attr("title");
		$('.modal-title').html(title);
		$($(this).parents('div').html()).appendTo('.modal-body');
		$('#myModal').modal({
			show : true
		});
	});
</script>