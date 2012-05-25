Spine       = require('spine')
Employee    = require('models/employee')
Table       = require('controllers/table')
layout      = require('lib/layout')
template    = require('views/file')

class EmployeesFile extends Spine.Controller

  className: 'employeesFile span9'
    
  elements:
    "#column1": "column1"
    "#column2": "column2"
    "#column3": "column3"
  
  events:
    'click #deleteFile': 'delete'
    
  constructor: ->
    super
    @active @change
    
  render: ->
    tables = {}
    @html template(@file)
    
    for attr, val of @file.attributes()
      if attr isnt "id" and attr isnt "photo" and Employee.can[attr]["r"]
        table = new Table file: @file, groupName: attr, group: val
        table.render()
        if not tables[attr]?
            tables[attr] = table.el
        else
            throw 'duplicate table name'
    @layouter(tables)
        
  
  layouter: (tables) ->
    for table in layout.medewerkersFile[0]
      @column1.append(tables[table]) if tables[table]?
    for table in layout.medewerkersFile[1]
      @column2.append(tables[table]) if tables[table]?
    for table in layout.medewerkersFile[2]
      @column3.append(tables[table]) if tables[table]?
      
  updateTitle: ->
    $('#fileTitle').empty()
    $('#fileTitle').append(@item.fullName())
  
  change: (params) =>
    @file = Employee.find(params.id)
    @render()
  
  delete: ->
    if Employee.can["d"] 
      @file.destroy() if confirm('Weet je zeker dat je het bestand wil verwijderen?')
    else
      alert 'permission denied'
      
    
module.exports = EmployeesFile