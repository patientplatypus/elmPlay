var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/fetchweather', function(req, res, next) {
  console.log('inside fetchweather');
  res.json({"status": "weather", "value": "weathering"})
});

module.exports = router;
