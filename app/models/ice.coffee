Spine = require('spine')
Name = require('models/name')

class Ice extends Spine.Model
  @configure 'Ice', 'name', 'relation', 'tel'
  
module.exports = Ice