var fs = require('fs');

exports.index = function(req, res){
  res.render('index', { title: 'Remedy' })
};

exports.ondersteuning = function(req, res){
  res.render('index', { title: 'Ondersteuning' })
};

exports.regelingen = function(req, res){
  res.render('index', { title: 'Regelingen' })
};

exports.admin = function(req, res){
  res.render('index', { title: 'Systeembeheer' })
};

exports.client = function(req, res){
    
    var client = fs.readFileSync('./public/app/client.html', 'utf8');
    
    res.writeHead(200, { 'Content-type': 'text/html; charset = utf-8'});
    res.end(client);
};

