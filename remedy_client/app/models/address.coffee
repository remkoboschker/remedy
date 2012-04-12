Spine = require('spine')

class Address extends Spine.Model
  
  @configure 'Address', 'type', 'street', 'number', 'extension', 'postalcode', 'city', 'province', 'country'
  
module.exports = Address