Spine = require('spine')
permissions = require('lib/permissions')

class Acl extends Spine.Module

  constructor: (context) ->
    super
    @permissions = permissions['admin'][context]
    console.log @permissions
    
  can: (action, attr) =>
    console.log "act " #+ action + " attr " + attr
    #@permissions[attr][action]
    
  can: (action) =>
    console.log "act " #+ action + " attr " + attr
    #@permissions[action]
  
      
module.exports = Acl
