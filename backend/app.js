require('dotenv').config();
var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
const http = require('http');
const url = require('url');
const WebSocket = require('ws');
var axios = require('axios');
var parseString = require('xml2js').parseString;

var cors = require('cors');

var app = express();


var index = require('./routes/index');
var users = require('./routes/users');

app.use(cors());
app.options('*', cors())

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


app.use('/', index);
app.use('/users', users);


const server = http.createServer(app);
const wss = new WebSocket.Server({ server });


wss.on('connection', function connection(ws, req) {
 const location = url.parse(req.url, true);
 // You might use location.query.access_token to authenticate or share sessions
 // or req.headers.cookie (see http://stackoverflow.com/a/16395220/151312)
  ws.on('message', function incoming(message) {
    console.log('received: %s', message);
    function timeout() {
        setTimeout(function () {
          axios.get("https://www.wired.com/feed/rss")
          .then(response=>{
            // console.log('response from wired: ', response);
            console.log('value of parsed xml from wired:');
            var xml = response.data

            parseString(xml, function (err, result) {
                console.log(result);
                console.log(result.rss.channel);
                var returnArr = [{
                  "story1title": result.rss.channel[0].item[1].title[0].toString(),
                  "story1description": result.rss.channel[0].item[1].description[0].toString(),
                  "story1link": result.rss.channel[0].item[1].link[0].toString(),
                }]
                console.log('value of returnArr');
                console.log(returnArr);
                ws.send(JSON.stringify(returnArr));
            });
          })
          .catch(error=>{
            console.log('error from wired: ', error);
          });
          timeout();
        }, 1000);
    }

    timeout();

 });
});

server.listen(8080, function listening() {
 console.log('Listening on %d', server.address().port);
});




// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
