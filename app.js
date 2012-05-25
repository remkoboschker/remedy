
/**
 * Module dependencies.
 */

var express = require('express');
var routes = require('./routes');
var api = require('./routes/api');
var fs = require('fs');
var RedisStore = require('connect-redis')(express);
  
var options = {
    key: fs.readFileSync('./cert/server-key.pem'),
    cert: fs.readFileSync('./cert/server-cert.pem'),
    passphrase: "test",
    requestCert: true,
    ca: fs.readFileSync('./cert/client-cert.pem')
    //rejectUnauthorized: true   
};

var app = module.exports = express.createServer(options);
var redirect = express.createServer();

// Configuration

app.configure(function(){
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  //app.set('strict routing', 'false');
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(express.cookieParser());
  app.use(express.session({ secret: 'groot geheim', store: new RedisStore }));
  app.use(require('stylus').middleware({ src: __dirname + '/public' }));
  app.use(app.router);
  app.use(express.static(__dirname + '/public'));
});

app.configure('development', function(){
    app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
    app.use(express.logger());
    app.all('*', function(req, res, next) {
        res.header("Access-Control-Allow-Origin", 'http://localhost:9294');
        res.header("Access-Control-Allow-Headers", "X-Requested-With, Content-Type");
        res.header("Access-Control-Allow-Methods", "POST, GET, PUT, DELETE")
        res.header("Access-Control-Allow-Credentials", "true")
        next();
    });
    
});
   
app.configure('production', function(){
  app.use(express.errorHandler());
});

// Routes

redirect.all('*', function(req,res){
    res.redirect('https://remedy.informatietuin.nl'+req.url);
})

app.get('/', routes.index);
app.get('/regelingen', routes.regelingen);
app.get('/systeembeheer', routes.admin);
app.get('/ondersteuning', routes.ondersteuning);
app.get('/app/', routes.client);

app.post('/api/employees', api.employees.create);
app.get('/api/employees', api.employees.read);
app.put('/api/employees/:id', api.employees.update);
app.delete('/api/employees/:id', api.employees.destroy);
//app.get('/api', routes.api);

app.listen(3002, function(){
  console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
});

redirect.listen(3001, function(){});

