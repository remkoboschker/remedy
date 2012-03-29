Spine       = require('spine') 
Medewerker  = require('models/medewerker')
TableRow    = require('controllers/tableRow')
template    = require('views/table')

class Table extends Spine.Controller
  
  tag: "table"
  className: "table table-striped table-bordered"
  
  elements:
    "tbody": "tbody"
  
  constructor: ->
    super
    
  render: (name, object) ->
    @html template(Medewerker.label[name]['label'])
    for attr, val of object
      if Medewerker.can[name][attr]["r"]
        tablerow = new TableRow
        tablerow.render name, attr, val
        @tbody.append tablerow.el
    @log @.el
    
module.exports = Table

