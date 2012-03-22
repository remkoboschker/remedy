Spine = require('spine')
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
    "keyup input": "update"
    "keydown input": "setModifier"
    
  
  constructor: ->
    super
    
  render: () ->
    @item = Medewerker.find(@id)
    @html require('views/tableRow')(@)
    @input = require('views/tdInput')(@)
    
  edit: ->
    if not @editing
      @td.empty()
      @td.append @input
      @td.addClass('edit')
      @td.children().focus()
      @editing = true
  
  #pressing the return key saves the input to the store and replaces the input with the td
  #pressing shift-return saves the input and sets the input for the next table row; if there 
  #are no table rows left, it will move to the next table

  update: (e) ->
    if e.keyCode is 13 # return
      @item[@name] = @input.val()
      @item.save()
      @td.empty()
      @td.removeClass()
      @td.append @item[@name]
      @editing = false
      if @modifier
        #@trigger nextRow bound to model
        @modifier = false
    
  setModifier: (e) ->
    if e.keyCode is 16 # shift
      @modifier = true
    
  

module.exports = TableRow