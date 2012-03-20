Spine = require('spine')
Medewerker = require('models/medewerker')

class Form extends Spine.Controller
  
  #tag: "form"
  
  elements:
    "input": "input"

  events:
    "keyup": "update"
  
  constructor: ->
    super
    
  render: ->
    @item = Medewerker.find(@id)
    @html @template()
    
  template: -> 
    require('views/tdInput')(@)

  update: (e) ->
    #e.preventDefault()

    if e.keyCode is 13
      @item[@name] = @input.val()
      @item.save()
    
module.exports = Form