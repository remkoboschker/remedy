Spine = require('spine')
Medewerker = require('models/medewerker')
FieldNames = require('models/fieldNames')
Table = require('controllers/table')

class MedewerkersFile extends Spine.Controller

  className: 'medewerkersFile span9'
    
  events:
    "click #deleteEmployee": "delete"
    
  elements:
    "#column1": "column1"
    "#column2": "column2"
    "#column3": "column3"
    
  constructor: ->
    super
    @active @change
    
    @person    = new Table
    @telephone = new Table
    @ice       = new Table
    @mail      = new Table
    @address   = new Table
    @employee  = new Table
    
    # @list.bind 'change', @change
    
    #Medewerker.bind('refresh change', @render)
  
  render: ->
    @html require('views/file')(@item)
    @column1.append require('views/passphoto')(@item)

    @telephone.render
      label: "telefoon"
      id: @item.id 
      rows: [
        {label: "prive", name: "tel_prive"},
        {label: "werk", name: "tel_werk"}
        ]
    @column2.append @telephone.el
  
    @ice.render
      label: "ice"
      id: @item.id 
      rows: [
        {label: "naam", name: "ice_naam"},
        {label: "telefoon", name: "ice_tel"},
        {label: "relatie", name: "ice_relatie"}
        ]
    @column2.append @ice.el

    @person.render
      label: "persoon"
      id: @item.id 
      rows: [
        {label: "initialen", name: "initialen"},
        {label: "voornaam", name: "voornaam"},
        {label: "achternaam", name: "achternaam"},
        {label: "meisjesnaam", name: "meisjesnaam"},
        {label: "geboortedat", name: "geboortedatum"},
        {label: "geslacht", name: "geslacht"},
        {label: "bsn", name: "bsn"},
        {label: "legitimatie", name: "legitimatie"},
        {label: "profielfoto", name: "profielfoto"}
        ]    
    @column2.append @person.el
       
    @mail.render
      label: "email"
      id: @item.id 
      rows: [
        {label: "werk", name: "mail_werk"},
        {label: "prive", name: "mail_prive"}
        ]
    @column3.append @mail.el
    
    @address.render
      label: "adres"
      id: @item.id 
      rows: [
        {label: "straat", name: "straat"},
        {label: "huisnummer", name: "huisnummer"},
        {label: "toevoeging", name: "huisnummer_toevoeging"},
        {label: "postcode", name: "postcode"},
        {label: "woonplaats", name: "woonplaats"},
        {label: "land", name: "land"}
        ]
    @column3.append @address.el
    
    @employee.render
      label: "medewerker"
      id: @item.id 
      rows: [
        {label: "rol", name: "rol"},
        {label: "bankrekening", name: "bankrekening"},
        {label: "in dienst", name: "in_dienst"},
        {label: "uit dienst", name: "uit_dienst"},
        {label: "cv", name: "cv"},
        {label: "contract", name: "contract"}
        ]
    @column3.append @employee.el
    
  change: (params) =>
    @item = Medewerker.find(params.id)
    @render()
  
  delete: -> 
    @item.destroy() if confirm('Weet je zeker dat je het bestand wil verwijderen?')
    
    
module.exports = MedewerkersFile