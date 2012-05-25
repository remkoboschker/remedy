Spine = require('spine')

class MedewerkersLijstItem extends Spine.Controller
  constructor: ->
    super
    @item.bind("update",  @render)
    @item.bind("destroy", @remove)

  render: =>
    @replace require('views/medewerkersLijstItem')(@item)
    @

  remove: =>
    @el.remove()
    
module.exports = MedewerkersLijstItem
