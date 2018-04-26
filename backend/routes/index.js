var express = require('express');
var router = express.Router();
var axios = require('axios');
var parseString = require('xml2js').parseString;



/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/fetchweather/:city', function(req, res, next) {
  console.log('inside fetchweather');
  console.log('value of city', req.params.city);

  var url = "http://api.apixu.com/v1/current.json?key="+process.env.weatherapikey+"&q="+req.params.city

  var placeString = ""

  axios.get(url)
  .then((response)=>{
    console.log("value of response: ", response.data);
    var placeString = response.data.location.name + ", " + response.data.location.region + ", " + response.data.location.country;
    var tempC = response.data.current.temp_c;
    var description = response.data.current.condition.text;
    var icon = response.data.current.condition.icon;
    var humidity = response.data.current.humidity;
    var precipitationMM = response.data.current.precip_mm
    var returnObj = {
      "status": "Success",
      "place": placeString.toString(),
      "temp": tempC.toString(),
      "description": description.toString(),
      "icon": icon.substring(2, icon.length),
      "humidity": humidity.toString(),
      "precipitation": precipitationMM.toString(),
    }
    console.log('value of returnObj');
    console.log(returnObj);
    res.json(returnObj);
  })
  .catch((error)=>{
    var returnObj = {
      "status": "Error",
      "place": "error",
      "temp": "error",
      "description": "error",
      "icon": "error",
      "humidity": "error",
      "precipitation": "error",
    }
    res.json(returnObj);
  })
});


module.exports = router;
