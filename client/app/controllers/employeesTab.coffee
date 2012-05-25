Spine       = require('spine')
File        = require('controllers/employeesFile')
Sidebar     = require('controllers/employeesSidebar')
Employee  = require('models/employee')

class employeesTab extends Spine.Controller
  
  constructor: ->
    super
       
    @file = new File
    @sidebar = new Sidebar
    
    @routes
      '/admin/employees/:id': (params) -> 
        @sidebar.active(params)
        @file.active(params)
    
    @append @file, @sidebar
    
    Employee.fetch()

module.exports = employeesTab