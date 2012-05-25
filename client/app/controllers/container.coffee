Spine   = require('spine')
Tabs    = require('controllers/tabs')
Footer  = require('controllers/footer')

class Container extends Spine.Controller
  
  className: 'container-fluid'
   
  constructor: ->
    super
    
    @tabs = new Tabs
    @footer = new Footer
    
    @append @tabs, @footer
    
module.exports = Container