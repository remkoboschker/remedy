Spine = require('spine')
Medewerker = require('models/medewerker')

class TableRow extends Spine.Controller
 
  @editing = false
  
  tag: "tr"
  
  elements:
    "td": "td"
    "input": "input"
  
  events:
    "click td": "setInput"
    "focus": "setInput"
    "blur input": "removeInput"
    "keyup input": "update"
    "keydown input": "setModifier"
    
  constructor: ->
    super
    
  render: ->  
    @label = Medewerker.label[@groupName][@attr] 
    @html require('views/tableRow')(@)
    @input = require('views/tdInput')(@)
    @el.attr("id", @attr)
    
  setInput: ->
    if not @editing
      @td.empty()
      @td.append @input
      @td.addClass('edit')
      @td.children().focus()
      @editing = true
      
  removeInput: ->
    @log @td
    @store()
    if @td.has('input') isnt 0
      @td.empty()
      @td.removeClass()
    @td.append @file[@groupName][@attr]
    @editing = false
    
  store: ->
    if Medewerker.can["u"] and @file[@groupName][@attr] isnt @input.val()
        @file[@groupName][@attr] = @input.val()
        @log 'save'
        @file.save()
  
  #pressing the return key saves the input to the store and replaces the input with the td
  #pressing shift-return or tab saves the input and sets the input for the next table row; if there 
  #are no table rows left, it will move to the next table in the next column if need be.
  #shift-back space moves back one row across tables and columns as well

  update: (e) ->
    if e.keyCode is 13 # return
      e.target.blur()
      if window.modifier
        @nextField(@el)
    if e.keyCode is 9 # tab
      @nextField(@el)
    if e.keyCode is 8 and window.modifier # backspace
      @previousField(@el)
    if e.keyCode is 16      
      window.modifier = false
      
  setModifier: (e) ->
    if e.keyCode is 16 # shift
      window.modifier = true #possibly not the neatest solution to attach modifier to the window needed because modifier would otherwise be local to the row and get lost when switching row
    if ((e.keyCode is 8) and window.modifier) # prevent backspace when modifier is true
      e.preventDefault()
      return false
    if ((e.keyCode is 9) and @editing) # prevent normal tab behaviour when editing
      e.preventDefault()
      return false
          
  nextField: (element) ->
    if element.is('tr') and element.next().length isnt 0
      element.next().focus()
    else if element.next(':has(tbody > tr)').length isnt 0
      element.next().find('tbody > tr').first().focus()
    else if element.is('tr')
      @nextField element.parents('table')
    else if element.is('table')
      @nextField element.parents('.column')
    else if element.is('.column')
      element.siblings(':has(table)').first().find('tbody > tr').first().focus()
    else
      throw 'unknown element in nextField'
      
  previousField: (element) ->
    if element.is('tr') and element.prev().length isnt 0
      element.prev().focus()
    else if element.prev(':has(tbody > tr)').length isnt 0
      element.prev().find('tbody > tr').last().focus()
    else if element.is('tr')
      @previousField element.parents('table')
    else if element.is('table')
      @previousField element.parents('.column')
    else if element.is('.column')
      element.siblings(':has(table)').last().find('tbody > tr').last().focus()
    else
      throw 'unknown element in previousField'

module.exports = TableRow