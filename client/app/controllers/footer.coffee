Spine = require('spine')

class Footer extends Spine.Controller

  className: 'footer'

  constructor: ->
    super
    @html require('views/footer')
    
module.exports = Footer