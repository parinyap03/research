<?php 
// Declare a variable to store the URL
$data_url = 'http://api.weatherapi.com/v1/current.json?key=e695f821ad2647cda76140352230710&q=13.7563,100.5018';

// Fetch data from the URL and decode it as JSON
$jsonData = file_get_contents($data_url);
$data = json_decode($jsonData, true);

// Extract the location name and current temperature
$locationName = $data['location']['name'];
$locationCountry = $data['location']['country'];
$locationLocaltime = $data['location']['localtime'];
$currentTempC = $data['current']['temp_c'];
$currentHumidity = $data['current']['humidity'];
$currentUV = $data['current']['uv'];

?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Weather</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <style>
        table thead tr{
            background-color: #2d4263;
            color: white;
            text-align: center;
        }
    </style>

</head>
  <body>
 
  	<div class="container">
  		<div class="row">
  			<div class="col-sm-12">
  				<h3>Weather</h3>
  				<table class="table table-bordered table-striped">
  					<thead>
  						<tr> <!--class="table-danger"-->
  							<th>Location</th>
                            <th>Country</th>
                            <th>Localtime</th>
  							<th>Current Temperature (°C)</th>
                            <th>Humidity</th>
                            <th>UV</th>
  						</tr>
  					</thead>
  					<tbody>
  						<tr>
  							<td><?php echo $locationName; ?></td>
  							<td><?php echo $locationCountry; ?></td>
                            <td><?php echo $locationLocaltime; ?></td>
  							<td><?php echo $currentTempC; ?>°C</td>
                            <td><?php echo $currentHumidity; ?></td>
  							<td><?php echo $currentUV; ?></td>
  						</tr>
  					</tbody>
  				</table>
  			</div>
  		</div>
  	</div>
  </body>
</html>
