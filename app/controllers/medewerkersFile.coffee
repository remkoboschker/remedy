Spine = require('spine')
Medewerker = require('models/medewerker')
Table = require('controllers/table')

class MedewerkersFile extends Spine.Controller

  className: 'medewerkersFile span9'
    
  events:
    "click #deleteEmployee": "delete"
    "nextTable": "nextTable"
    
  elements:
    "#column1": "column1"
    "#column2": "column2"
    "#column3": "column3"
    
  constructor: ->
    super
    @active @change

  render: ->
    tables = []
    passphoto = require('views/passphoto')(@item)
    @html require('views/file')(@item)
    @column1.append passphoto
    
    for attr, val of @item.attributes()
      if attr isnt "id" and attr isnt "photo" and Medewerker.can[attr]["r"]
        table = new Table
        table.render attr, val
        tables.push table.el
    @appendToColumns(tables)
  
  appendToColumns: (tables) -> #hoe volgorde append als eerder in model later in layout
    for table in tables
      @column2.append table
  
  change: (params) =>
    @item = Medewerker.find(params.id)
    @render()
  
  delete: ->
    if Medewerker.can["d"] 
      @item.destroy() if confirm('Weet je zeker dat je het bestand wil verwijderen?')
    else
      alert 'permission denied'
    
module.exports = MedewerkersFile