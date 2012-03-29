Spine = require('spine')
permissions = require('lib/permissions')
labels = require('lib/labelsData')

class Medewerker extends Spine.Model
    
  @configure 'Medewerker', 'personal', 'tel', 'mail', 'ice', 'address', 'employed', 'photo'

  @extend @Local
  
  @can = permissions['admin']['employee']
    
  @label = labels['nl']['employee']
  
  @filter: (query) ->
    return @all() unless query
    query = query.toLowerCase()
    @select (item) ->
      item.personal.givenName?.toLowerCase().indexOf(query) isnt -1 or 
      item.personal.familyName?.toLowerCase().indexOf(query) isnt -1 or
      item.address.postalcode?.indexOf(query) isnt -1 or
      item.personal.dateOfBirth?.indexOf(query) isnt -1
  
  constructor: ->
    super
  
  fullName: -> 
    "#{ @initialen ?  'initialen'}
     #{@achternaam ? 'achternaam'} 
    (#{@voornaam ? 'voornaam'})"
    

        
module.exports = Medewerker