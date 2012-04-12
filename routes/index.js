fs = require('fs')

exports.index = function(req, res){
  res.render('index', { title: 'Express' })
};

exports.ondersteuning = function(req, res){
  res.render('index', { title: 'Ondersteuning' })
};

exports.regelingen = function(req, res){
  res.render('index', { title: 'Regelingen' })
};

exports.product = function(req, res){
  res.render('index', { title: 'Product' })
};

exports.admin = function(req, res){
  res.render('index', { title: 'Admin' })
};

exports.client = function(req, res){
    console.log('client');
    var client = fs.readFileSync('./public/client/client.html', 'utf8')
    res.writeHead(200, {
        'Content-type': 'text/html; charset = utf-8'
    });
    res.end(client);
};

exports.api = function(req, res){
    console.log('Client Certificate');
    var clientCert = req.connection.getPeerCertificate();
    console.log(clientCert);
    if(req.client.authorized){
        res.render('index', { title: 'API', name: clientCert.subject.CN })
    } else {
        res.render('index', { title: 'unauthorized'})
    }
};
