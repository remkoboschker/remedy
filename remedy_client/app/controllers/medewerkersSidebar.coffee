Spine = require('spine')

Medewerker = require('models/medewerker')
Employee = require('models/employee')
MedewerkersLijstItem = require('controllers/medewerkersLijstItem')
MedewerkersFile = require('controllers/medewerkersFile')
List    = require('lib/list')
$       = Spine.$

class MedewerkersSidebar extends Spine.Controller

  className: 'medewerkersSidebar sidebar span3'
  
  elements:
    ".items": "items"
    "input[type=search]": "search"
  
  events:
   'click #createEmployee': 'create'
   'keyup input[type=search]': 'filter'
   'ready': 'resize'
  
  constructor: ->
    super
    
    @html require('views/medewerkersSidebar')
    
    @list = new List
      el: @items, 
      template: require('views/medewerkersLijstItem'), 
      selectFirst: true

    @list.bind 'change', @change

    @active (params) -> 
      @log 'const'
      @log params.id
      @list.change(Medewerker.find(params.id))

    Medewerker.bind('refresh change', @render)
    
    # not the cleanest solution as it goes outside of spine's event handlers. also it is called every time a reload occurs
    $('document').ready( -> $('.scroll-area').height($('#file').height() - 93)) # set the sidebar to the same height as the file by adjusting the height of the overflow area.

  filter: ->
    @query = @search.val()
    @render()

  render: =>
    medewerkers = Medewerker.filter(@query)
    @list.render(medewerkers)

  change: (item) =>
    @navigate '/admin/medewerkers', item.id

  create: ->
    if Medewerker.can["c"]
      item = Medewerker.create
        personal:
          initials: 'initialen'
          givenName: 'voornaam'
          familyName: 'achternaam'
          dateOfBirth: 'geboortedatum'
          sex: 'geslacht'
          idNumber: 'bsn'
          idDocument: 'legitimatie'
        photo: 'profielfoto'  
        tel:    
          work: 'tel_werk'
          private: 'tel_prive'
        mail:
          work: 'mail_werk'
          private: 'mail_prive' 
        ice:
          tel: 'ice_tel'
          name: 'ice_naam'
          relation: 'ice_relatie'
        address:
          street: 'straat'
          number: 'huisnummer'
          extension: 'huisnummer_toevoeging'
          postalcode: 'postcode'
          city: 'woonplaats'
          country: 'land'
        employed:
          role: 'rol'
          bankAccountNumber: 'bankrekening'
          inService: 'in_dienst'
          outService: 'uit_dienst'
          cv: 'cv'
          contract: 'contract'
      @navigate '/admin/medewerkers', item.id
    else
      alert 'permission denied'
      
  resize: ->
     $('.scroll-area').height($('#file').height() - 93) # set the sidebar to the same height as the file by adjusting the height of the overflow area.
    
module.exports = MedewerkersSidebar