<%@ page isELIgnored="false" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><t:getAsString name="title" ignore="false" /></title>
<link rel="icon"
	href="<s:url value="/resources/images/NetxamLogo.png"/>"
	type="image/gif" sizes="16x16">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<%-- <script --%>
<%--  	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  --%>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>

<link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css" rel="stylesheet">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.0.1/angular.min.js"></script>
<script
	src="<s:url value="/resources/js/controller.js" />"></script>

<link rel="stylesheet" type="text/css"
	href="<s:url value="/resources/css/style.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<s:url value="/resources/css/carousel.css"/>" />
</head>
<body>
	<div id="header">
		<t:insertAttribute name="header" />
	</div>

	<div id="body">
		<t:insertAttribute name="body" />
	</div>

	<div id="footer">
		<t:insertAttribute name="footer" />
	</div>
</body>
</html>