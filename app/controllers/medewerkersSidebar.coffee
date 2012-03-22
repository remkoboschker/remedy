Spine = require('spine')

Medewerker = require('models/medewerker')
Employee = require('models/employee')
MedewerkersLijstItem = require('controllers/medewerkersLijstItem')
MedewerkersFile = require('controllers/medewerkersFile')
List    = require('lib/list')
$       = Spine.$

class MedewerkersSidebar extends Spine.Controller

  className: 'medewerkersSidebar span3'
  
  elements:
    ".items": "items"
    "input[type=search]": "search"
  
  events:
   "click #createEmployee": "new"
   'keyup input[type=search]': 'filter'
  
  constructor: ->
    super
    
    @html require('views/medewerkersSidebar')
    
    @list = new List
      el: @items, 
      template: require('views/medewerkersLijstItem'), 
      selectFirst: true

    @list.bind 'change', @change

    @active (params) -> 
      @list.change(Medewerker.find(params.id))

    Medewerker.bind('refresh change', @render)

  filter: ->
    @query = @search.val()
    @render()

  render: =>
    medewerkers = Medewerker.filter(@query)
    @list.render(medewerkers)

  change: (item) =>
    @navigate '/admin/medewerkers', item.id

  new: ->
    item = Medewerker.create( initialen: 'initialen', voornaam: 'voornaam', achternaam: 'achternaam', meisjesnaam: 'meisjesnaam', geboortedatum: 'dd/mm/jjjj', geslacht: 'geslacht', bsn: 'bsn', legitimatie: 'legitimatie', profielfoto: 'upload', tel_werk: 'tel_werk', tel_prive: 'tel_prive',  mail_werk: 'mail_werk', mail_prive: 'mail_prive', ice_tel: 'ice_tel', ice_naam: 'ice_naam', ice_relatie: 'ice_relatie', straat: 'straat', huisnummer: 'huisnummer', huisnummer_toevoeging: 'huisnummer_toevoeging', postcode: '1234 AB', woonplaats: 'woonplaats', land: 'land', rol: 'rol', bankrekening: 'bankrekening', in_dienst: 'dd/mm/jjjj', uit_dienst: 'dd/mm/jjjj', cv: 'upload', contract: 'upload')   
    @navigate '/admin/medewerkers', item.id
    
module.exports = MedewerkersSidebar