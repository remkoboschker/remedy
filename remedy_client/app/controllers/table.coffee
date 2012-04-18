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
    
  render: () ->
    @html template(Medewerker.label[@groupName]['label'])
    @el.attr("id", @groupName)
    for attr, val of @group
      if Medewerker.can[@groupName][attr]["r"]
        tablerow = new TableRow file: @file, groupName: @groupName, attr: attr, val: val
        @tbody.append(tablerow.render()) 
    
module.exports = Table

