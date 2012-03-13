Spine   = require('spine')
Tabs    = require('/lib/tabs')
$       = Spine.$

MedewerkersTab = require('controllers/medewerkersTab')
PlaceholderTab = require('controllers/placeholderTab')

class Tabbladen extends Spine.Controller

  className: "tabbable"
  
  constructor: ->
    super
    
    @html require('views/tabs')
        
    medewerkersTab = new MedewerkersTab(el: $(".medewerkers", @el))
    placeholderTab = new PlaceholderTab(el: $(".placeholder", @el))
    
    
    new Spine.Manager(medewerkersTab, placeholderTab)
    
    tabs = new Tabs(el: $(".tabs", @el))
    tabs.connect("medewerkers", medewerkersTab)
    tabs.connect("placeholder", placeholderTab)
    
    tabs.render()
    
module.exports = Tabbladen