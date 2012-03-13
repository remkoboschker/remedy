Spine = require('spine')

class Form extends Spine.Controller
  
  tag: "form"
  
  elements:
    "input": "input"
  
  constructor: ->
    super
    
  render: (placeholder) ->
    @html @template(placeholder)
    
  template: (placeholder) -> 
    require('views/tdInput')(placeholder)

module.exports = Form