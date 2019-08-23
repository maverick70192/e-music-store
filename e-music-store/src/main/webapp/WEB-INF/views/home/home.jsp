<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!-- First Container -->
<div id="myCarousel" class="carousel slide" data-ride="carousel"
	data-interval="1500">
	<!-- Indicators -->

	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<img class="first-slide home-image"
				src="<c:url value="/resources/images/Music1.jpg"/>" alt="Music">
			<div class="container">
				<div class="carousel-caption">
					<h1>Welcome to Le's Music Store</h1>

					<p>Here you can browse and buy Instruments, Records and music
						related Accessories. Order Now for Your Amazing New Kit!</p>

				</div>
			</div>
		</div>

		<div class="item">
			<img class="second-slide home-image"
				src="<c:url value="/resources/images/Music2.jpg"/>" alt="Music">
			<div class="container">
				<div class="carousel-caption">
					<h1>Facts You Should Know About Music</h1>

					<p>Music brings joy, to all of our hearts, It's one of those,
						emotional arts.</p>

				</div>
			</div>
		</div>

		<div class="item">
			<img class="third-slide home-image"
				src="<c:url value="/resources/images/Music3.jpg"/>" alt="Music">
			<div class="container">
				<div class="carousel-caption">
					<h1>It's A Jazz Affair</h1>

					<p>Through ups and downs, Somehow I manage to survive in life.</p>

				</div>
			</div>
		</div>
	</div>
	<a class="left carousel-control" href="#myCarousel" role="button"
		data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
		aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#myCarousel" role="button"
		data-slide="next"> <span class="glyphicon glyphicon-chevron-right"
		aria-hidden="true"></span> <span class="sr-only">Next</span>
	</a>
</div>

<!-- Second Container -->
<div class="container-fluid bg-2 text-center">
	<br>
	<div class="row">
		<div class="col-sm-4">
			<a href="<c:url value="/products?searchCondition=Instrument" />">
				<img alt="Instruments"
				src="<c:url value="/resources/images/Instruments.png"/>" width="210"
				height="210" />
			</a>
			<h3>
				<b>Instruments</b>
			</h3>
			<p>Well crafted and delicate instruments.</p>
		</div>
		<div class="col-sm-4">
			<a href="<c:url value="/products?searchCondition=Record" />">
				<img alt="Discography"
					src="<c:url value="/resources/images/Discography.png"/>" width="210"
					height="210" />
			</a>
			<h3>
				<b>Discography</b>
			</h3>
			<p>All exceptional collections of music records in favour of the
				traditional and modern genre of jazz.</p>
		</div>
		<div class="col-sm-4">
			<a href="<c:url value="/products?searchCondition=Accessory" />">
				<img alt="Accessories"
					src="<c:url value="/resources/images/Accessories.png"/>" width="210"
					height="210" />
			</a>
			<h3>
				<b>Accessories</b>
			</h3>
			<p>All musical and related geeky goods.</p>
		</div>
	</div>
</div>