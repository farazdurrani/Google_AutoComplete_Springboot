<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Address Successfully Submitted</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>		

	<form:form action="/" method="get">
	
	<div class="container">

				<h3>Following address is submitted:</h3>
				<br></br>
				<h4>Street Name: ${address.address1}</h4>
				<h4>City: ${address.city}</h4>
				<h4>State: ${address.state}</h4>
				<h4>Zipcode: ${address.zipcode}</h4>
				<h4>Country: ${address.country}</h4>
				
				<div class="col-sm-12 form-group">
					<button class="btn pull-right btn-success" id="Submit" value="Enter another address" type="Submit">Enter another address</button>
				</div>	
				
	</div>	
	
	</form:form>	

			
</body>
</html>
