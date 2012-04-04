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
    
  render: (id, name, object) ->
    @html template(Medewerker.label[name]['label'])
    @el.attr("id", name)
    for attr, val of object
      if Medewerker.can[name][attr]["r"]
        tablerow = new TableRow
        tablerow.render id, name, attr, val
        @tbody.append tablerow.el
    
module.exports = Table

