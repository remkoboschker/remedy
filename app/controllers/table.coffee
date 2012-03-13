Spine = require('spine')

TableRow = require('controllers/tableRow')

class Table extends Spine.Controller
  
  tag: "table"
  className: "table table-striped table-bordered"
  
  elements:
    "tbody": "tbody"
  
  constructor: ->
    super
    
  render: (table) ->
    @html @template(table.label)
    for row in table.rows
      @log row
      tablerow = new TableRow
      tablerow.render(row) 
      @tbody.append tablerow.el 
      
  template: (item) ->
    require('views/table')(item)
    
module.exports = Table