Spine = require('spine')

class Medewerker extends Spine.Model
  @configure 'Medewerker', 'initialen', 'test', 'voornaam', 'achternaam','meisjesnaam', 'geboortedatum', 'geslacht', 'bsn', 'legitimatie', 'profielfoto', 'tel_werk', 'tel_prive', 'mail_werk', 'mail_prive', 'ice_tel', 'ice_naam', 'ice_relatie', 'straat', 'huisnummer', 'huisnummer_toevoeging', 'postcode', 'woonplaats', 'land', 'rol', 'bankrekening', 'in_dienst', 'uit_dienst', 'cv', 'contract'

  @extend @Local

  fullName: -> 
    "#{ @initialen ?  'initialen'}
     #{@achternaam ? 'achternaam'} 
    (#{@voornaam ? 'voornaam'})"
  
  @filter: (query) ->
    return @all() unless query
    query = query.toLowerCase()
    @select (item) ->
      item.id?.toLowerCase().indexOf(query) isnt -1 #or item.achternaam?.toLowerCase().indexOf(query) isnt -1
        
module.exports = Medewerker