Spine = require('spine')

Tabbladen = require('controllers/tabbladen')
Footer = require('controllers/footer')

class Container extends Spine.Controller
  
  className: 'container-fluid'
   
  constructor: ->
    super
    
    @tabbladen = new Tabbladen
    @footer = new Footer
    
    @append @tabbladen, @footer
    
module.exports = Container