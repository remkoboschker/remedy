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
      tablerow = new TableRow(row: row)
      tablerow.render() 
      @tbody.append tablerow.el 
      
  template: (item) ->
    require('views/table')(item)
    
module.exports = Table