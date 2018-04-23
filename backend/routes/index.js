var express = require('express');
var router = express.Router();
var axios = require('axios');
var parseString = require('xml2js').parseString;


// var xml = "<root>Hello xml2js!</root>"
// parseString(xml, function (err, result) {
//     console.log('value of xml parseString:');
//     console.log(result);
//     return result;
// });


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

router.get('/fetchforecast/:city', function(req, res, next) {
  console.log('inside fetchforecast');
  console.log('value of city', req.params.city);

  // apixu also has the ability to do forecasts - debug above first!

  // axios.get("https://httpbin.org/get")
  // .then((response)=>{
  //   console.log("value of response: ", response);
  // })
  // .catch((error)=>{
  //   console.log("value of error: ", error);
  // })
  //
  // res.json({"status": "weather", "value": "weathering"})
});

module.exports = router;


//EVERYTHING BELOW HERE IS SCRATCH!

// Here is how you would use the openweather api - unfortunately it is currently 404ing

// Openweather endpts
// api.openweathermap.org/data/2.5/weather?q={city name}
// api.openweathermap.org/data/2.5/weather?q={city name},{country code}

// var cityIndex = req.params.city.indexOf(",");
//
// if (cityIndex == -1){
//   var url = "api.openweathermap.org/data/2.5/weather?q="+req.params.city;
// }else{
//   var cityName = req.params.city.substring(0, cityIndex);
//   var countryName = req.params.city.substring(cityIndex+2, req.params.city.length);
//   var url = "api.openweathermap.org/data/2.5/weather?q="+cityName+","+countryName;
// }

// console.log('After if statement and value of url: ', url);
// // var appidUrl = url + "&APPID=" + process.env.weatherapikey;
// var appidUrl = "api.openweathermap.org/data/2.5/forecast?id=524901"+"&APPID="+process.env.weatherapikey;
// console.log('After if statement and value of appidUrl: ', appidUrl);
