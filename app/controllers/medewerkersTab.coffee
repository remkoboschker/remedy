Spine = require('spine')
File = require('controllers/medewerkersFile')
Sidebar = require('controllers/medewerkersSidebar')
Medewerker = require('models/medewerker')

class MedewerkersTab extends Spine.Controller
  
  constructor: ->
    super
       
    @file = new File
    @sidebar = new Sidebar
    
    @routes
      '/admin/medewerkers/:id': (params) -> 
        @sidebar.active(params)
        @file.active(params)
    
    @append @file, @sidebar
    
    Medewerker.fetch()
    
module.exports = MedewerkersTab