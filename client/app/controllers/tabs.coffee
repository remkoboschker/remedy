Spine           = require('spine')
Tab             = require('/lib/tabs')
$               = Spine.$
template        = require('views/tabs')
EmployeesTab    = require('controllers/employeesTab')
PlaceholderTab  = require('controllers/placeholderTab')

class Tabs extends Spine.Controller

  className: "tabbable"
  
  constructor: ->
    super
    
    @html template
        
    emplyeesTab = new EmployeesTab(el: $(".medewerkers", @el))
    #leveranciersTab = new PlaceholderTab(el: $(".leveranciers", @el))
    #voorraadTab = new PlaceholderTab(el: $(".voorraad", @el))
    #urenregistratieTab = new PlaceholderTab(el: $(".urenregistratie", @el))
    #kasboekTab = new PlaceholderTab(el: $(".kasboek", @el))
    #balansTab = new PlaceholderTab(el: $(".balans", @el))
    #winstverliesTab = new PlaceholderTab(el: $(".winstverlies", @el))
    
    
    new Spine.Manager(medewerkersTab) #, leveranciersTab, voorraadTab, urenregistratieTab, kasboekTab, balansTab, winstverliesTab)
    
    tab = new Tab(el: $(".tabs", @el))
    tab.connect("medewerkers", medewerkersTab)
    #tab.connect("leveranciers", leveranciersTab)
    #tab.connect("voorraad", voorraadTab)
    #tab.connect("urenregistratie", urenregistratieTab)
    #tab.connect("kasboek", kasboekTab)
    #tab.connect("balans", balansTab)
    #tab.connect("winstverlies", winstverliesTab)
    
    tab.render()
    
module.exports = Tabs