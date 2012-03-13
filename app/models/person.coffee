Spine = require('spine')

class Person extends Spine.Model
  #name
  @configure 'Person', 'birthday', 'sex', 'bsn', 'identification', 'passphoto'
  
  @extend(require('models/name'))
  
module.exports = Person