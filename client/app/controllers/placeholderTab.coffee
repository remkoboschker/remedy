Spine = require('spine')

class PlaceholderTab extends Spine.Controller
  
  constructor: ->
    super
    
    @html require('views/placeholderTab')
    
module.exports = PlaceholderTab