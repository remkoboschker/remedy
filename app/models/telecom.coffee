Spine = require('spine')
Ice = require('models/ice')

class Telecom extends Spine.Model
  
  @configure 'Telecom', 'tel_private', 'tel_work', 'mail_private', 'mail_work'
  
  @extend(require('models/ice'))
  
module.exports = Telecom