Spine = require('spine')
$ = Spine.$

class Navbar extends Spine.Controller
  className: 'navbar'
  
  
  constructor: ->
    super
    @html require('views/navbar')
    
      
module.exports = Navbar