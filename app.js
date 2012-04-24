
/**
 * Module dependencies.
 */

var express = require('express'),
    routes = require('./routes'),
    api = require('./routes/api')
    fs = require('fs');
  
var options = {
    key: fs.readFileSync('./cert/server-key.pem'),
    cert: fs.readFileSync('./cert/server-cert.pem'),
    passphrase: "test",
    requestCert: true,
    ca: fs.readFileSync('./cert/client-cert.pem')
    
    //rejectUnauthorized: true
    
};

var app = module.exports = express.createServer(options);

// Configuration

app.configure(function(){
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(express.cookieParser());
  app.use(express.session({ secret: 'your secret here' }));
  app.use(require('stylus').middleware({ src: __dirname + '/public' }));
  app.use(app.router);
  app.use(express.static(__dirname + '/public'));
});

app.configure('development', function(){
    app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
    app.use(express.logger());   
});
   
app.configure('production', function(){
  app.use(express.errorHandler());
});

// Routes
app.get('/', routes.index);
app.get('/product', routes.product);
app.get('/regelingen', routes.regelingen);
app.get('/admin', routes.admin);
app.get('/client', routes.client);
app.post('/api/employees', api.employees.create);
app.get('/api/employees', api.employees.read);
app.put('/api/employees', api.employees.update);
app.delete('/api/employees', api.employees.destroy);
//app.get('/api', routes.api);
app.get('/ondersteuning', routes.ondersteuning);


app.listen(3000, function(){
  console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
});

