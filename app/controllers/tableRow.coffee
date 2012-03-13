Spine = require('spine')
Form  = require('controllers/form')

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
    @render()
    
  render: (row) ->
    # snap niet waarom row.value undefined is
    @html @template(row)
    
  template: (row) -> 
    require('views/tableRow')(row)
    
  edit: ->
    if not @editing
      placeholder = @td.text()
      @td.empty()
      @form = new Form
      @form.render("")
      @td.append @form.el
      @td.addClass('edit')
      @td.children().children().focus()
      @editing = true
      #@save()
  ###    
  next: ->
    nextSibling = @.el.next()
    if nextSibling 
      nextSibling.click()
    else
      #volgende tabel
  
  save: ->
    @item.voornaam = "test"
    @item.save()
    @log @item
   ### 
module.exports = TableRow