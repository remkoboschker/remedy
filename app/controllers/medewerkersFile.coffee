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
    "click #deleteEmployee": "delete"
    "blur #initials": "updateTitle"
    #"click #givenName": "updateTitle"
    #"click #familyName": "updateTitle"
    

    
  constructor: ->
    super
    @active @change

  render: ->
    tables = {}
    passphoto = require('views/passphoto')(@item)
    @html require('views/file')(@item)
    #@column1.append passphoto
    
    for attr, val of @item.attributes()
      if attr isnt "id" and attr isnt "photo" and Medewerker.can[attr]["r"]
        table = new Table
        table.render @id, attr, val
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
    @log 'updateTitel'
    $('#fileTitle').empty()
    $('#fileTitle').append(@item.fullName())
  
  change: (params) =>
    @id = params.id
    @item = Medewerker.find(@id)
    @render()
  
  delete: ->
    if Medewerker.can["d"] 
      @item.destroy() if confirm('Weet je zeker dat je het bestand wil verwijderen?')
    else
      alert 'permission denied'
    
module.exports = MedewerkersFile