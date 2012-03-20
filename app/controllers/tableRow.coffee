Spine = require('spine')
Form  = require('controllers/form')
Medewerker = require('models/medewerker')

class TableRow extends Spine.Controller
 
  @editing = false
  
  tag: "tr"
  
  elements:
    "td": "td"
    "th": "th"
    "input": "input"
  
  events:
    "click td": "edit"
    #"":"next"
   # "focus_out td": "save"
  
  constructor: ->
    super
    
  render: () ->
    @item = Medewerker.find(@id)
    @html require('views/tableRow')(@)
    
  edit: ->
    if not @editing
      @td.empty()
      @form = new Form(value: @value, type: @type, name: @name, id: @id)
      @form.render()
      @td.append @form.el
      @td.addClass('edit')
      @td.children().children().focus()
      @editing = true

module.exports = TableRow