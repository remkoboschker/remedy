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
    @html require('views/table')(table.label)
    for row in table.rows
      tablerow = new TableRow(type: row.type, name: row.name, label: row.label, id: table.id)
      tablerow.render()
      tablerow.bind("nextRow", @nextRow)
      @tbody.append tablerow.el
    
  nextRow: ->
    if @.el.next().length isnt 0
      @log "next row"
    else
      @log "end of table"
    
module.exports = Table

