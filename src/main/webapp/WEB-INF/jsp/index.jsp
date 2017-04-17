<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvS0g_NqYnHvwfQgzZWbVz7mMhfLKSoG4&libraries=places&callback=initAutocomplete"
        async defer></script>

<script>
	var placeSearch, autocomplete;
	var componentForm = {
		street_number : 'short_name',
		route : 'long_name',
		locality : 'long_name',
		administrative_area_level_1 : 'short_name',
		country : 'long_name',
		postal_code : 'short_name'
	};

	function initAutocomplete() {
		autocomplete = new google.maps.places.Autocomplete((document
				.getElementById('autocomplete')), {
			types : [ 'geocode' ]
		});

		autocomplete.addListener('place_changed', fillInAddress);
	}

	function fillInAddress() {
		var place = autocomplete.getPlace();
		for ( var component in componentForm) {
			if (component == "route") {
				document.getElementById('address1').value = '';
				//document.getElementById('address1').disabled = false;
			} else if (component == "locality") {
				document.getElementById('city').value = '';
				//document.getElementById('city').disabled = false;
			} else if (component == "administrative_area_level_1") {
				document.getElementById('state').value = '';
				//document.getElementById('state').disabled = false;
			} else if (component == "postal_code") {
				document.getElementById('zipcode').value = '';
				//document.getElementById('zipcode').disabled = false;
			} else if (component == "country") {
				document.getElementById('country').value = '';
				//document.getElementById('zipcode').disabled = false;
			}else {
			}
		}
		var street_number = '';
		for (var i = 0; i < place.address_components.length; i++) {
			var addressType = place.address_components[i].types[0];

			if (componentForm[addressType]) {
				var val = place.address_components[i][componentForm[addressType]];
				if (addressType == "street_number") {
					street_number += val;
				} else if (addressType == "route") {
					document.getElementById('address1').value = street_number
							+ " " + val;
				} else if (addressType == "locality") {
					document.getElementById('city').value = val;
				} else if (addressType == "administrative_area_level_1") {
					document.getElementById('state').value = val;
				} else if (addressType == "postal_code") {
					document.getElementById('zipcode').value = val;
				} else if (addressType == "street_number") {
					document.getElementById('street_number').value = val;
				} else if (addressType == "country"){
					document.getElementById('country').value = val;
				} else {
					console.log("this component is of no use to me: "
							+ addressType);
				}
			}
		}
	}

	function geolocate() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				var geolocation = {
					lat : position.coords.latitude,
					lng : position.coords.longitude
				};
				var circle = new google.maps.Circle({
					center : geolocation,
					radius : position.coords.accuracy
				});
				autocomplete.setBounds(circle.getBounds());
			});
		}
	}
</script>


</head>
<body>		

	<form:form action="/addressform" method="post" modelAttribute="address">
	
	<div class="container">
				<br></br>
				<div class="col-sm-12 form-group">
					<!-- Enter a location -->
					<input class="form-control" id="autocomplete" onFocus="geolocate()" type="text" />
				</div>
			
				<div class="col-sm-6 form-group">
					<label for='route'>Street Name</label>
					<form:input class="form-control" path="address1" name="route" type="text" id="address1"/>
				</div>

				<div class="col-sm-6 form-group">
					<label for='locality'>City</label>
					<form:input class="form-control" path="city" name="locality" type="text" id="city" />
				</div>
				
				<div class="col-sm-6 form-group">
					<label for='administrative_area_level_1'>State</label>
					<form:input class="form-control" path="state" name="administrative_area_level_1" type="text" id="state"/>
				</div>
				
				<div class="col-sm-6 form-group">
					<label for='postal_code'>Zip Code</label>
					<form:input class="form-control" path="zipcode" name="postal_code" type="text" id="zipcode"/>
				</div>
				
				<div class="col-sm-6 form-group">
					<label for='country'>Country</label>
					<form:input class="form-control" path="country" name="country" type="text" id="country"/>
				</div>
				
				<div class="col-sm-12 form-group">
					<button class="btn pull-right btn-success" id="Submit" value="Submit" type="Submit">Submit</button>
				</div>
	</div>	
	
	</form:form>	

			
</body>
</html>
