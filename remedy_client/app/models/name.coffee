Spine = require('spine')

class Name extends Spine.Model
  @configure 'Name', 'initials', 'firstname', 'lastname'
  
module.exports = Name