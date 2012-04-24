var mongoose = require('mongoose'),
    Employee = require('../employee');

exports.employees = function(req, res){
    console.log('employees');
    //console.log(req.body.personal);
};


exports.employees.create = function(req, res){
    //create a new employee from Employee model 
    var employee = new Employee(req.body);
    //connect to db
    mongoose.connect('mongodb://localhost/remedyDB');
     //save employee and close connection
    employee.save(function(err){
        if (err) {throw err;}
        mongoose.disconnect();
    });
    
    //return newly created object to the client
    //res.head(201, )
    
    //res.end(employee)
    
};

exports.employees.read = function(req, res){
    mongoose.connect('mongodb://localhost/remedyDB');
    
};

exports.employees.update = function(req, res){
    
};

exports.employees.destroy = function(req, res){
    
};


