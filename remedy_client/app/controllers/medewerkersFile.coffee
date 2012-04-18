Spine = require('spine')
Medewerker = require('models/medewerker')
Table = require('controllers/table')
layout = require('lib/layout')

class MedewerkersFile extends Spine.Controller

  className: 'medewerkersFile span9'
    
  elements:
    "#column1": "column1"
    "#column2": "column2"
    "#column3": "column3"
  
  events:
    'click #deleteEmployee': 'delete'
    
  constructor: ->
    super
    @active @change
    
  render: ->
    tables = {}
    @html require('views/file')(@file)
    
    for attr, val of @file.attributes()
      if attr isnt "id" and attr isnt "photo" and Medewerker.can[attr]["r"]
        table = new Table file: @file, groupName: attr, group: val
        table.render()
        tables[attr] = table.el #if two have the same name should raise error
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
    @file = Medewerker.find(params.id)
    @render()
  
  delete: ->
    if Medewerker.can["d"] 
      @file.destroy() if confirm('Weet je zeker dat je het bestand wil verwijderen?')
    else
      alert 'permission denied'
      
    
module.exports = MedewerkersFile