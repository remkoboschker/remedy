Spine = require('spine')

class MedewerkersLijst extends Spine.Controller
  constructor: ->
    super
    @item.bind("update",  @render)
    @item.bind("destroy", @remove)

  render: =>
    @replace require('views/medewerkerSidebar')(@item)
    @

  remove: =>
    @el.remove()
    
module.exports = Medewerkers
