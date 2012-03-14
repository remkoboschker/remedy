Spine = require('spine')

class Form extends Spine.Controller
  
  tag: "form"
  
  elements:
    "input": "input"
  
  constructor: ->
    super
    
  render: () ->
    @html @template()
    
  template: () -> 
    require('views/tdInput')(@value)

module.exports = Form