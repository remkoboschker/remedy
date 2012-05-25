var mongoose = require('mongoose'),
    Employee = require('../models/employee');
    _ = require('underscore')

//connect to db and leave open untill an error occurs or shutdown is called    
mongoose.connect('mongodb://localhost/remedyDB');

var toMongoose = function(source) {
  var obj = _.clone(source);
  //obj._id = obj.id; //mod on _id not allowed
  delete obj.id;
  return obj;
};


exports.employees = function(req, res){
    console.log('employees');
    //console.log(req.body.personal);
};

//create a new employee from Employee model 
//save employee and close connection
//return newly created object to the client
exports.employees.create = function(req, res){   
    var employee = new Employee(req.body);   
    
    employee.save(function(err){
        if (err) {throw err;}
    });
         
    res.json(employee.toSpine(), 201);   
};

exports.employees.read = function(req, res){
        
    return Employee.find({}, function(err, docs){
        
        var results = [];
        
        if (err) {throw err;}
        
        for(var i = 0; i < docs.length; i += 1){
            results.push(docs[i].toSpine());
        }

        return res.json(results, 200); 
    });
}

exports.employees.update = function(req, res) {
    
    var conditions;
    var update      = toMongoose(req.body);
    var options     = {};
    
    if (req.params.id === req.body.id) {
        conditions = {_id: req.params.id};
    } else {
        throw 'url id parameter not valid';
    }
    
    return Employee.update(conditions, update, options, function(err, numAffected) {
        if (err) {throw err;}
        if (numAffected > 1) { throw 'too many objects';}
        return Employee.findById(req.params.id, function(err, doc) {
            if (!err) {
                return res.json(doc.toSpine(), 200);
            } else {
                throw err;
            }        
        });            
    });
}

exports.employees.destroy = function(req, res) {
    return Employee.findById(req.params.id, function(err, doc) {
        return doc.remove(function(err) {
            if (!err){
                res.send();
            } else { 
                throw err;
            }
        });
    });
}


