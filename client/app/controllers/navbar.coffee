Spine       = require('spine')
$           = Spine.$
template    = require('views/navbar')

class Navbar extends Spine.Controller
  className: 'navbar'
  
  constructor: ->
    super
    @html template
     
module.exports = Navbar