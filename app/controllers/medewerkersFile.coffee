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
  
  render: ->
    @html require('views/file')(@item)
    @column1.append require('views/passphoto')(@item)

    @telephone.render
      label: "telefoon"
      rows: [
        {label: "prive", value: @item.tel_prive},
        {label: "werk", value: @item.tel_werk}
        ]
    @column2.append @telephone.el

    @ice.render
      label: "ice"
      rows: [
        {label: "naam", value: @item.ice_naam},
        {label: "telefoon", value: @item.ice_tel},
        {label: "relatie", value: @item.ice_relatie}
        ]
    @column2.append @ice.el

    @person.render
      label: "persoon"
      rows: [
        {label: "initialen", value: @item.initialen},
        {label: "voornaam", value: @item.voornaam},
        {label: "achternaam", value: @item.achternaam},
        {label: "meisjesnaam", value: @item.meisjesnaam},
        {label: "geboortedatum", value: @item.geboortedatum},
        {label: "geslacht", value: @item.geslacht},
        {label: "bsn", value: @item.bsn},
        {label: "legitimatie", value: @item.legitimatie},
        {label: "profielfoto", value: @item.profielfoto}
        ]    
    @column2.append @person.el
       
    @mail.render
      label: "email"
      rows: [
        {label: "werk", value: @item.mail_werk},
        {label: "prive", value: @item.mail_prive}
        ]
    @column3.append @mail.el
    
    @address.render
      label: "adres"
      rows: [
        {label: "straat", value: @item.straat},
        {label: "huisnummer", value: @item.huisnummer},
        {label: "toevoeging", value: @item.huisnummer_toevoeging},
        {label: "postcode", value: @item.postcode},
        {label: "woonplaats", value: @item.woonplaats},
        {label: "land", value: @item.land}
        ]
    @column3.append @address.el
    
    @employee.render
      label: "medewerker"
      rows: [
        {label: "rol", value: @item.rol},
        {label: "bankrekening", value: @item.bankrekening},
        {label: "in dienst", value: @item.in_dienst},
        {label: "uit dienst", value: @item.uit_dienst},
        {label: "cv", value: @item.cv},
        {label: "contract", value: @item.contract}
        ]
    @column3.append @employee.el

  change: (params) =>
    @item = Medewerker.find(params.id)
    @render()
  
  delete: -> 
    @item.destroy() if confirm('Weet je zeker dat je het bestand wil verwijderen?')
    
    
module.exports = MedewerkersFile